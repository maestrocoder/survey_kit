import 'package:flutter/material.dart';
import 'package:survey_kit/src/element/result_step_element.dart';
import 'package:survey_kit/src/step_element_result.dart';

class TextFieldElement extends ResultStepElement<String?> {
  final bool Function(String? text)? valid;
  final TextEditingController textEditingController;
  final InputDecoration? inputDecoration;

  TextFieldElement({
    required this.textEditingController,
    this.inputDecoration,
    this.valid,
  });

  @override
  void dispose() {
    textEditingController.dispose();
  }

  @override
  Widget createWidget() {
    return TextField(
      controller: textEditingController,
      decoration: inputDecoration,
    );
  }

  @override
  StepElementResult<String?> getResult() {
    return StepElementResult(
      value: textEditingController.text,
    );
  }

  @override
  bool validate() {
    if (valid != null) {
      return valid!.call(textEditingController.text);
    }
    return super.validate();
  }
}
