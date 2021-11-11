import 'package:flutter/material.dart';
import 'package:survey_kit/survey_kit.dart';

class LinearSurveyStep extends StatelessWidget {
  final String id;
  final List<StepElement> stepElements;

  const LinearSurveyStep({
    required this.id,
    required this.stepElements,
  });

  @override
  Widget build(BuildContext context) {
    return SurveyStep(
      id: id,
      stepElements: stepElements,
      build: (id, elements, context) {
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: elements.length,
                itemBuilder: (
                  BuildContext context,
                  int index,
                ) {
                  return elements[index].createWidget();
                },
              ),
            ),
            TextButton(
              onPressed: () => context.nextStep(),
              child: Text('Next'),
            ),
          ],
        );
      },
    );
  }
}
