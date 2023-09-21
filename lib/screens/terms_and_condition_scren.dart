import 'package:flutter/material.dart';
import 'package:google_mlkit_translation/google_mlkit_translation.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:translate_module/cubit/t_and_c_cubit.dart';
import 'package:translate_module/screens/widgets/bottom_sheet_widget.dart';
import 'package:translate_module/utils/app_constants.dart';

/// MyTermsAndConditionsScreen is a screen that displays a list of terms and conditions.
class MyTermsAndConditionsScreen extends StatefulWidget {
  const MyTermsAndConditionsScreen({super.key});

  @override
  _MyTermsAndConditionsScreenState createState() =>
      _MyTermsAndConditionsScreenState();
}

class _MyTermsAndConditionsScreenState
    extends State<MyTermsAndConditionsScreen> {
  /// The controller for the ListView that this screen displays.
  final ScrollController _scrollController = ScrollController();

  /// The controller for the text field that this screen displays in bottom sheet.
  final TextEditingController _textController = TextEditingController();

  final _modelManager = OnDeviceTranslatorModelManager();
  final _sourceLanguage = TranslateLanguage.english;
  final _targetLanguage = TranslateLanguage.spanish;

  /// onDeviceTranslator is the translator that this screen uses to translate text.
  final _onDeviceTranslator = OnDeviceTranslator(
      sourceLanguage: TranslateLanguage.english,
      targetLanguage: TranslateLanguage.hindi);

  /// ValueNotifier<int> that indicates the index of the selected language.
  late ValueNotifier<int> dataHindiIndexNotifier;
  late ValueNotifier<String> translatedText;

  @override
  void initState() {
    super.initState();
    performDownload();
    dataHindiIndexNotifier = ValueNotifier(-1);
    translatedText = ValueNotifier('welcome');
    // Add a listener to the scroll controller to detect when the user has scrolled to the end.
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms and Conditions'),
      ),
      body: BlocBuilder<TermsAndConditionCubit, TermsAndConditionState>(
        builder: (context, state) {
          return buildBody(context, state);
        },
      ),
    );
  }

  Widget buildBody(BuildContext context, TermsAndConditionState state) {
    if (state is Loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (state is Success) {
      final pages = state.data;

      return RefreshIndicator(
        onRefresh: () async {
          BlocProvider.of<TermsAndConditionCubit>(context).getData();
        },
        child: ListView.builder(
          itemCount: pages.length + 1,
          controller: _scrollController,
          itemBuilder: (context, index) {
            if (index < pages.length) {
              var page = pages[index];
              return ValueListenableBuilder(
                  valueListenable: dataHindiIndexNotifier,
                  builder: (_, __, ___) {
                    return GestureDetector(
                      onTap: () {
                        _textController.text = page.value ?? '';
                        _showBottomSheet(context, id: page.id ?? 0);
                      },
                      child: Container(
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(page.value ?? ''),
                              Row(
                                children: [
                                  Expanded(
                                    child: Visibility(
                                      visible:
                                          dataHindiIndexNotifier.value == index,
                                      child: Text(
                                        translatedText.value ?? '',
                                        style: const TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const Divider(
                                color: Colors.grey,
                              ),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      DateFormat('dd MMM yyyy').format(
                                          DateTime.parse(page.createdAt ?? '')),
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        _onDeviceTranslator
                                            .translateText(
                                                pages[index].value ?? '')
                                            .then((value) {
                                          translatedText.value = value;
                                          dataHindiIndexNotifier.value = index;
                                        });
                                      },
                                      child: const Text(
                                        AppConstants.readInHindi,
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ]),
                            ],
                          )
                          // Add more fields from the 'page' if needed.
                          ),
                    );
                  });
            } else {
              return state.shouldAllow
                  ? const Center(child: CircularProgressIndicator())
                  : Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Center(
                          child: OutlinedButton(
                              onPressed: () {
                                _showBottomSheet(context, id: 0);
                              },
                              child: const Text(AppConstants.addMoreButton))),
                    );
            }
          },
        ),
      );
    } else if (state is Empty) {
      return const Center(
        child: Text(AppConstants.noDataAvailable),
      );
    } else if (state is NoInternet) {
      return const Center(
        child: Text(AppConstants.noInternet),
      );
    } else if (state is Error) {
      return Center(
        child: Text(state.message),
      );
    } else {
      return Container(); // Handle other states if needed.
    }
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      // User has scrolled to the end, load more data.
      BlocProvider.of<TermsAndConditionCubit>(context).getMoreSearchResults();
    }
  }

  // Function to show the bottom sheet
  void _showBottomSheet(BuildContext context, {required int id}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return BottomSheetWidget(
            textController: _textController,
            onSpeechResult: (String data) {
              _textController.text = data;
            },
            id: id);
      },
    );
  }

  void performDownload() async {
    await _modelManager.downloadModel(
      _sourceLanguage.bcpCode,
    );
    await _modelManager.downloadModel(
      _targetLanguage.bcpCode,
    );

    _onDeviceTranslator.translateText('welcome').then((value) {});
  }
}
