import 'package:flutter/material.dart';
import 'package:survey_kit/survey_kit.dart';

class LinearSurveyStep extends StatelessWidget {
  final String id;
  final List<StepElement> stepElements;

  const LinearSurveyStep({
    Key? key,
    required this.id,
    required this.stepElements,
  }) : super(key: key);

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
              child: const Text('Next'),
            ),
          ],
        );
      },
    );
  }
}
