import 'package:flutter/material.dart';
import 'package:survey_kit/src/element/result_step_element.dart';
import 'package:survey_kit/src/step_element_result.dart';

class TextFieldElement extends ResultStepElement<String?> {
  final Function(String? text)? valid;
  TextEditingController? _textEditingController;

  TextFieldElement({
    this.valid,
  });

  @override
  void initState() {
    _textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _textEditingController?.dispose();
  }

  @override
  Widget createWidget() {
    return TextField(
      controller: _textEditingController,
    );
  }

  @override
  StepElementResult<String?> getResult() {
    return StepElementResult(
      value: _textEditingController?.text,
    );
  }

  @override
  bool validate() {
    if (valid != null) {
      return valid!.call(_textEditingController?.text);
    }
    return super.validate();
  }
}
