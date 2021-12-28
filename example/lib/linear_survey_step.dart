import 'package:flutter/material.dart';
import 'package:survey_kit/survey_kit.dart';

class LinearSurveyStep extends StatelessWidget {
  final String id;
  final List<StepElement> stepElements;
  final EdgeInsets padding;
  final double runSpacing;

  const LinearSurveyStep({
    Key? key,
    required this.id,
    required this.stepElements,
    this.padding = const EdgeInsets.all(32),
    this.runSpacing = 14,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SurveyStep(
      id: id,
      stepElements: stepElements,
      build: (id, elements, context) {
        return Padding(
          padding: padding,
          child: Column(
            children: [
              Expanded(
                child: Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  runAlignment: WrapAlignment.center,
                  runSpacing: runSpacing,
                  children: [...elements.map((e) => e.createWidget()).toList()],
                ),
              ),
              OutlinedButton(
                onPressed: () => context.nextStep(),
                child: const Text('Next'),
              ),
            ],
          ),
        );
      },
    );
  }
}
