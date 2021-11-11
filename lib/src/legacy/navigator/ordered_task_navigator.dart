import 'package:survey_kit/src/legacy/navigator/task_navigator.dart';
import 'package:survey_kit/src/legacy/result/question_result.dart';
import 'package:survey_kit/src/legacy/steps/step.dart';
import 'package:survey_kit/src/legacy/task/task.dart';

class OrderedTaskNavigator extends TaskNavigator {
  OrderedTaskNavigator(Task task) : super(task);

  @override
  Step? nextStep({required Step step, QuestionResult? questionResult}) {
    record(step);
    return nextInList(step);
  }

  @override
  Step? previousInList(Step step) {
    final currentIndex = task.steps
        .indexWhere((element) => element.stepIdentifier == step.stepIdentifier);
    return (currentIndex - 1 < 0) ? null : task.steps[currentIndex - 1];
  }

  @override
  Step? firstStep() {
    final previousStep = peekHistory();
    return previousStep == null ? task.steps.first : nextInList(previousStep);
  }
}