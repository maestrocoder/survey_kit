import 'package:survey_kit/src/legacy/steps/identifier/identifier.dart';
import 'package:survey_kit/src/legacy/result/question_result.dart';

class CompletionStepResult extends QuestionResult {
  CompletionStepResult(
    Identifier id,
    DateTime startDate,
    DateTime endDate,
  ) : super(
          id: id,
          startDate: startDate,
          endDate: endDate,
          valueIdentifier: 'completion',
          result: null,
        );
}
