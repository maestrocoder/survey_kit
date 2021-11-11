import 'package:flutter/material.dart';
import 'package:survey_kit/survey_kit.dart';
import 'package:surveykit_example/linear_survey_step.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
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
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.cyan,
          ),
          textTheme: TextTheme(
            button: TextStyle(
              color: Colors.cyan,
            ),
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.cyan,
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(
              Size(150.0, 60.0),
            ),
            side: MaterialStateProperty.resolveWith(
              (Set<MaterialState> state) {
                if (state.contains(MaterialState.disabled)) {
                  return BorderSide(
                    color: Colors.grey,
                  );
                }
                return BorderSide(
                  color: Colors.cyan,
                );
              },
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
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
            alignment: Alignment.center,
            child: SurveyKit(
              appBar: (controller) => AppBar(
                leading: TextButton(
                  child: Text('Next'),
                  onPressed: () => controller.nextStep(),
                ),
              ),
              surveySteps: [
                SurveyStep(
                  id: '1',
                  stepElements: [
                    TextElement(text: 'Sample text'),
                    TextFieldElement(
                      valid: (String? input) => input?.isNotEmpty,
                    ),
                  ],
                  build: (id, stepElements, context) => LinearSurveyStep(
                    id: id,
                    stepElements: stepElements,
                  ),
                ),
                SurveyStep(
                  id: '2',
                  stepElements: [
                    TextElement(text: 'Step 2'),
                    TextFieldElement(),
                  ],
                  build: (id, stepElements, context) => LinearSurveyStep(
                    id: id,
                    stepElements: stepElements,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
