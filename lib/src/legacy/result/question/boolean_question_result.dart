import 'package:survey_kit/src/legacy/answer_format/boolean_answer_format.dart';
import 'package:survey_kit/src/legacy/steps/identifier/identifier.dart';
import 'package:survey_kit/src/legacy/result/question_result.dart';

class BooleanQuestionResult extends QuestionResult<BooleanResult?> {
  BooleanQuestionResult({
    required Identifier id,
    required DateTime startDate,
    required DateTime endDate,
    required String valueIdentifier,
    required BooleanResult? result,
  }) : super(
          id: id,
          startDate: startDate,
          endDate: endDate,
          valueIdentifier: valueIdentifier,
          result: result,
        );
}
