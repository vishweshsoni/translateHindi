import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mlkit_translation/google_mlkit_translation.dart';
import 'package:translate_module/cubit/t_and_c_cubit.dart';
import 'package:translate_module/screens/widgets/voice_input_dialog.dart';
import 'package:translate_module/utils/app_constants.dart';

class BottomSheetWidget extends StatefulWidget {
  TextEditingController textController;
  final int id;
  final Function(String) onSpeechResult;

  BottomSheetWidget({
    super.key,
    required this.textController,
    required this.id,
    required this.onSpeechResult,
  });

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  /// ValueNotifier<String> that indicates the translated text.
  late ValueNotifier<String> translatedText;

  /// ValueNotifier<bool> that indicates whether the text is translated.
  late ValueNotifier<bool> isTranslated;

  final _onDeviceTranslator = OnDeviceTranslator(
      sourceLanguage: TranslateLanguage.english,
      targetLanguage: TranslateLanguage.hindi);

  @override
  void initState() {
    translatedText = ValueNotifier('');
    isTranslated = ValueNotifier(false);
    if (widget.id == 0) {
      widget.textController.text = '';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Wrap(
            children: <Widget>[
              TextField(
                controller: widget.textController,
                decoration: InputDecoration(
                  labelText: AppConstants.labelText,
                  hintText: AppConstants.hintText,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return VoiceInputDialog(
                            onSpeechResult: widget.onSpeechResult,
                          );
                        },
                      );
                    },
                    child: const Icon(Icons.mic),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Row(
                        children: [
                          ValueListenableBuilder(
                              valueListenable: translatedText,
                              builder: (_, __, ___) {
                                return Text(translatedText.value);
                              })
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                          _onDeviceTranslator
                              .translateText(widget.textController.text)
                              .then((value) {
                            translatedText.value = value;
                          });
                        },
                        child: const Text(
                          AppConstants.viewInHindi,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () async {
                        if (widget.textController.text.isNotEmpty) {
                          bool val =
                              await BlocProvider.of<TermsAndConditionCubit>(
                                      context)
                                  .addTermsAndCondition(
                                      value: widget.textController.text,
                                      id: widget.id);
                          if (val) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        AppConstants.termsAndConditionAdded)));
                            Navigator.of(context).pop();
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text(AppConstants.somethingWentWrong)));
                            Navigator.of(context).pop();
                          }
                        }
                      },
                      child: const Text(AppConstants.confirm),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    translatedText.dispose();
    isTranslated.dispose();
    _onDeviceTranslator.close();
    super.dispose();
  }
}
