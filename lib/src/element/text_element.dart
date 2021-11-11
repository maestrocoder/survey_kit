import 'package:flutter/material.dart';
import 'package:survey_kit/src/element/step_element.dart';

class TextElement extends StepElement {
  final String text;

  const TextElement({
    required this.text,
  });

  @override
  Widget createWidget() {
    return Text(
      text,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TextElement &&
          runtimeType == other.runtimeType &&
          text == other.text;

  @override
  int get hashCode => text.hashCode;
}
