import 'package:flutter/widgets.dart';

abstract class StepElement {
  const StepElement();

  Widget createWidget();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StepElement && runtimeType == other.runtimeType;

  @override
  int get hashCode => super.hashCode;
}
