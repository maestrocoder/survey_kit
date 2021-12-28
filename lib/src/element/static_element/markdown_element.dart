import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:survey_kit/src/element/step_element.dart';

@immutable
class MarkdownElement extends StepElement {
  final String text;
  final ScrollController? scrollController;
  final bool? selectable;

  const MarkdownElement({
    required this.text,
    this.scrollController,
    this.selectable,
  });

  @override
  Widget createWidget() {
    return Markdown(
      data: text,
      controller: scrollController,
      selectable: selectable ?? false,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MarkdownElement &&
          runtimeType == other.runtimeType &&
          text == other.text;

  @override
  int get hashCode => text.hashCode;
}
