import 'package:riverpod/riverpod.dart';
import 'package:survey_kit/src/element/result_step_element.dart';
import 'package:survey_kit/src/element/step_element.dart';
import 'package:survey_kit/src/step_element_result.dart';
import 'package:survey_kit/src/step_result.dart';
import 'package:survey_kit/survey_kit.dart';

class SurveyPresenter extends StateNotifier<SurveyStep?> {
  List<SurveyStep> steps;
  final List<StepResult> stepResults = [];
  SurveyPresenter({
    required this.steps,
  }) : super(steps.isEmpty ? null : steps.first);

  void setSteps(List<SurveyStep> steps) {
    this.steps = steps;
    state = steps.first;
  }

  void nextStep() {
    final currentStep = state;
    if (currentStep == null) {
      return;
    }
    final result = collectResults(currentStep.stepElements);

    stepResults.add(result);
    int index = steps.indexWhere(
      (step) => step.id == state!.id,
    );
    if (steps.length - 1 < index + 1) {
      return;
    }
    state = steps[index + 1];
  }

  void previousStep() {
    final currentStep = state;
    if (currentStep == null) {
      return;
    }
    final result = collectResults(currentStep.stepElements);

    stepResults.add(result);
    int index = steps.indexWhere(
      (step) => step.id == state!.id,
    );
    if (index - 1 >= 0) {
      return;
    }
    state = steps[index - 1];
  }

  StepResult collectResults(List<StepElement> elements) {
    final List<StepElementResult> results = [];
    for (final element in elements) {
      if (element is ResultStepElement) {
        results.add(element.getResult());
      }
    }
    return StepResult(
      stepElementResults: results,
    );
  }

  bool isValid(List<StepElement> elements) {
    for (final element in elements) {
      if (element is ResultStepElement) {
        if (!element.validate()) {
          return false;
        }
      }
    }
    return true;
  }
}
