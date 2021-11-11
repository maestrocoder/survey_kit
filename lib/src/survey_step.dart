import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:survey_kit/src/element/result_step_element.dart';
import 'package:survey_kit/src/element/step_element.dart';

class SurveyStep extends ConsumerStatefulWidget {
  final String id;
  final List<StepElement> stepElements;
  final Widget Function(String stepId, List<StepElement>, BuildContext) build;
  const SurveyStep({
    required this.id,
    required this.stepElements,
    required this.build,
  }) : assert(stepElements.length > 0 && id.length > 0);

  @override
  ConsumerState<SurveyStep> createState() => _SurveyStepState();
}

class _SurveyStepState extends ConsumerState<SurveyStep> {
  @override
  void initState() {
    super.initState();
    widget.stepElements.forEach(
      (element) {
        if (element is ResultStepElement) {
          element.initState();
        }
      },
    );
  }

  @override
  void dispose() {
    widget.stepElements.forEach(
      (element) {
        if (element is ResultStepElement) {
          element.initState();
        }
      },
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.build.call(widget.id, widget.stepElements, context);
  }
}
