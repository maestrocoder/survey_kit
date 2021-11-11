import 'package:survey_kit/src/element/step_element.dart';
import 'package:survey_kit/src/step_element_result.dart';

abstract class ResultStepElement<T> implements StepElement {
  void initState() {}
  void dispose() {}
  StepElementResult<T> getResult();
  bool validate() => true;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StepElement && runtimeType == other.runtimeType;

  @override
  int get hashCode => super.hashCode;
}
