import 'package:survey_kit/src/legacy/steps/identifier/identifier.dart';
import 'package:survey_kit/src/legacy/result/question_result.dart';

class ScaleQuestionResult extends QuestionResult<double?> {
  ScaleQuestionResult({
    required Identifier id,
    required DateTime startDate,
    required DateTime endDate,
    required String valueIdentifier,
    required double? result,
  }) : super(
          id: id,
          startDate: startDate,
          endDate: endDate,
          valueIdentifier: valueIdentifier,
          result: result,
        );
}
