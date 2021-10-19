import 'package:survey_kit/src/legacy/result/result.dart';
import 'package:survey_kit/src/legacy/result/step_result.dart';
import 'package:survey_kit/src/legacy/steps/identifier/identifier.dart';

class SurveyResult extends Result {
  final FinishReason finishReason;
  final List<StepResult> results;

  SurveyResult({
    required Identifier? id,
    required DateTime startDate,
    required DateTime endDate,
    required this.finishReason,
    required this.results,
  }) : super(id: id, startDate: startDate, endDate: endDate);
}

enum FinishReason { SAVED, DISCARDED, COMPLETED, FAILED }
