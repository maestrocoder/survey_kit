import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:survey_kit/src/survey_presenter.dart';
import 'package:survey_kit/src/survey_step.dart';
import 'package:survey_kit/survey_kit.dart';

final surveyPresenter =
    StateNotifierProvider<SurveyPresenter, SurveyStep?>((ref) {
  return SurveyPresenter(
    steps: [],
  );
});

class SurveyView extends HookConsumerWidget {
  final Widget? appBar;
  final Widget? leadingWidget;
  final Widget? trailingWidget;
  final List<SurveyStep> surveySteps;

  const SurveyView({
    Key? key,
    required this.surveySteps,
    this.leadingWidget,
    this.trailingWidget,
    this.appBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _surveyProvider = ref.read(surveyPresenter.notifier);
    final _step = ref.watch(surveyPresenter);

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      if (_step == null) {
        _surveyProvider.setSteps(surveySteps);
      }
    });

    if (_step == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return _step;
  }
}
