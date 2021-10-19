import 'package:survey_kit/src/legacy/result/question_result.dart';
import 'package:survey_kit/src/legacy/steps/identifier/identifier.dart';

class DateQuestionResult extends QuestionResult<DateTime?> {
  DateQuestionResult({
    required Identifier id,
    required DateTime startDate,
    required DateTime endDate,
    required String valueIdentifier,
    required DateTime? result,
  }) : super(
          id: id,
          startDate: startDate,
          endDate: endDate,
          valueIdentifier: valueIdentifier,
          result: result,
        );
}
