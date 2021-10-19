import 'package:survey_kit/src/legacy/result/question_result.dart';
import 'package:survey_kit/src/legacy/steps/identifier/identifier.dart';

class InstructionStepResult extends QuestionResult {
  InstructionStepResult(
    Identifier id,
    DateTime startDate,
    DateTime endDate,
  ) : super(
          id: id,
          startDate: startDate,
          endDate: endDate,
          valueIdentifier: 'instruction',
          result: null,
        );
}
