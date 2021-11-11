import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:survey_kit/src/survey_presenter.dart';
import 'package:survey_kit/src/survey_step.dart';
import 'package:survey_kit/src/survey_view.dart';

class SurveyKit extends StatelessWidget {
  final List<SurveyStep> surveySteps;
  final Widget Function(SurveyPresenter surveyNavigator)? appBar;
  final Widget Function(SurveyPresenter surveyNavigator)? leadingWidget;
  final Widget Function(SurveyPresenter surveyNavigator)? trailingWidget;

  const SurveyKit({
    Key? key,
    required this.surveySteps,
    this.appBar,
    this.leadingWidget,
    this.trailingWidget,
  })  : assert(surveySteps.length > 0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: SurveyView(
        surveySteps: surveySteps,
      ),
    );
  }
}
