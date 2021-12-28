import 'package:flutter/material.dart';
import 'package:survey_kit/src/element/step_element.dart';

@immutable
class TextElement extends StepElement {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;

  const TextElement({
    required this.text,
    this.style,
    this.textAlign,
  });

  @override
  Widget createWidget() {
    return Text(
      text,
      style: style,
      textAlign: textAlign,
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
