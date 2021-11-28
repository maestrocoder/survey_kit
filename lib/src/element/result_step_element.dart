import 'package:flutter/material.dart';
import 'package:survey_kit/src/element/step_element.dart';
import 'package:survey_kit/src/step_element_result.dart';

@immutable
abstract class ResultStepElement<T> implements StepElement {
  void initState() {}
  void dispose() {}
  StepElementResult<T> getResult();
  bool validate() => true;
}
