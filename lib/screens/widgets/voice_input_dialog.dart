import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:translate_module/utils/app_constants.dart';

/// VoiceInputDialog is a widget that displays a dialog with a text field for voice input.
/// It uses the speech to text plugin to recognize speech.
class VoiceInputDialog extends StatefulWidget {
  final Function(String) onSpeechResult;

  const VoiceInputDialog({super.key, required this.onSpeechResult});

  @override
  _VoiceInputDialogState createState() => _VoiceInputDialogState();
}

class _VoiceInputDialogState extends State<VoiceInputDialog> {
  /// The speech to text object that this screen uses to recognize speech.
  late stt.SpeechToText _speech;

  /// ValueNotifier<bool> that indicates whether the speech to text object is listening.
  late ValueNotifier<bool> _isListening;

  /// ValueNotifier<String> that indicates the last recognized words.
  late ValueNotifier<String> _lastRecognizedWords;

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();

    _isListening = ValueNotifier(false);

    _lastRecognizedWords = ValueNotifier(AppConstants.listening);

    /// Add a listener to the speech to text object to detect when the listening status changes.
    _startListening();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(AppConstants.voiceInput),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(AppConstants.speakYourInput),
          const SizedBox(height: 10),
          ValueListenableBuilder(
              valueListenable: _lastRecognizedWords,
              builder: (_, __, ___) {
                return Text(_lastRecognizedWords.value);
              })
        ],
      ),
      actions: <Widget>[
        ValueListenableBuilder(
          valueListenable: _isListening,
          builder: (_, __, ___) {
            return Visibility(
              visible: _isListening.value == true ? false : true,
              child: ElevatedButton(
                onPressed: () async {
                  _stopListening();
                  Navigator.of(context).pop();
                  widget.onSpeechResult(_speech.lastRecognizedWords);
                },
                child: const Text(AppConstants.submitButton),
              ),
            );
          },
        ),
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text(AppConstants.cancel),
        ),
      ],
    );
  }

  /// Starts listening to speech.
  Future<void> _startListening() async {
    if (!_isListening.value) {
      final bool available = await _speech.initialize(
        onStatus: (status) {
          if (status == stt.SpeechToText.listeningStatus) {
            _isListening.value = true;
          } else if (status == stt.SpeechToText.notListeningStatus) {
            _stopListening();
          }
        },
        onError: (error) {
          _stopListening();
        },
      );
      if (available) {
        await _speech.listen(
          onResult: (SpeechRecognitionResult result) {
            _lastRecognizedWords.value = result.recognizedWords;
          },
        );
      } else {
        _stopListening();
      }
    }
  }

  /// Stops listening.
  Future<void> _stopListening() async {
    try {
      await _speech.stop();
      _isListening.value = false;
    } catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    // Stop speech recognition if it's active
    if (_isListening.value) {
      _stopListening();
    }
    super.dispose();
  }
}
