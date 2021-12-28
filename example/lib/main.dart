import 'package:flutter/material.dart';
import 'package:survey_kit/survey_kit.dart';
import 'package:surveykit_example/linear_survey_step.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Theme.of(context).copyWith(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.cyan,
        ).copyWith(
          onPrimary: Colors.white,
        ),
        primaryColor: Colors.cyan,
        backgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          iconTheme: const IconThemeData(
            color: Colors.cyan,
          ),
          toolbarTextStyle: const TextTheme(
            button: TextStyle(
              color: Colors.cyan,
            ),
          ).bodyText2,
          titleTextStyle: const TextTheme(
            button: TextStyle(
              color: Colors.cyan,
            ),
          ).headline6,
        ),
        iconTheme: const IconThemeData(
          color: Colors.cyan,
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(
              const Size(150, 60),
            ),
            side: MaterialStateProperty.resolveWith(
              (Set<MaterialState> state) {
                if (state.contains(MaterialState.disabled)) {
                  return const BorderSide(
                    color: Colors.grey,
                  );
                }
                return const BorderSide(
                  color: Colors.cyan,
                );
              },
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            textStyle: MaterialStateProperty.resolveWith(
              (Set<MaterialState> state) {
                if (state.contains(MaterialState.disabled)) {
                  return Theme.of(context).textTheme.button?.copyWith(
                        color: Colors.grey,
                      );
                }
                return Theme.of(context).textTheme.button?.copyWith(
                      color: Colors.cyan,
                    );
              },
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.all(
              Theme.of(context).textTheme.button?.copyWith(
                    color: Colors.cyan,
                  ),
            ),
          ),
        ),
      ),
      home: Scaffold(
        body: Container(
          color: Colors.white,
          child: Align(
            child: SurveyKit(
              appBar: (controller) => AppBar(
                leading: TextButton(
                  onPressed: () => controller.nextStep(),
                  child: const Text('Next'),
                ),
              ),
              surveySteps: [
                SurveyStep(
                  key: const Key('1'),
                  id: '1',
                  stepElements: [
                    const MarkdownElement(text: 'Insert emoji here 😀'),
                    const TextElement(
                      text: 'Sample text',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    TextFieldElement(
                      textEditingController: TextEditingController(),
                      valid: (String? input) => input?.isNotEmpty ?? false,
                      inputDecoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(
                          left: 8,
                          bottom: 8,
                          top: 8,
                          right: 8,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.zero,
                          borderSide: BorderSide(
                            color: Colors.black.withOpacity(0.2),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.zero,
                          borderSide: BorderSide(
                            color: Colors.black.withOpacity(0.2),
                          ),
                        ),
                      ),
                    ),
                  ],
                  build: (id, stepElements, context) => LinearSurveyStep(
                    id: id,
                    stepElements: stepElements,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
