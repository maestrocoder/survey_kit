import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:survey_kit/src/survey_view.dart';

extension Navigation on BuildContext {
  void nextStep() {
    final ref = this as WidgetRef;
    ref.read(surveyPresenter.notifier).nextStep();
  }

  void stepBack() {
    final ref = this as WidgetRef;
    ref.read(surveyPresenter.notifier).previousStep();
  }
}
