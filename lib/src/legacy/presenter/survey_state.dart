import 'package:survey_kit/src/legacy/configuration/app_bar_configuration.dart';
import 'package:survey_kit/src/legacy/result/question_result.dart';
import 'package:survey_kit/src/legacy/result/survey/survey_result.dart';
import 'package:survey_kit/src/legacy/steps/step.dart';

abstract class SurveyState {
  const SurveyState();
}

class LoadingSurveyState extends SurveyState {}

class PresentingSurveyState extends SurveyState {
  final AppBarConfiguration appBarConfiguration;
  final Step currentStep;
  final QuestionResult? result;
  final int currentStepIndex;
  final int stepCount;
  final bool isPreviousStep;

  PresentingSurveyState({
    required this.stepCount,
    required this.appBarConfiguration,
    required this.currentStep,
    this.result,
    this.currentStepIndex = 0,
    this.isPreviousStep = false,
  });
}

class SurveyResultState extends SurveyState {
  final SurveyResult result;
  final Step? currentStep;
  final QuestionResult? stepResult;

  SurveyResultState({
    required this.result,
    this.stepResult,
    required this.currentStep,
  });
}
