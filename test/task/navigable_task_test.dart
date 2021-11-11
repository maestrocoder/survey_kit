import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:survey_kit/src/legacy/navigator/rules/conditional_navigation_rule.dart';
import 'package:survey_kit/src/legacy/steps/identifier/step_identifier.dart';
import 'package:survey_kit/src/legacy/task/identifier/task_identifier.dart';
import 'package:survey_kit/src/legacy/task/navigable_task.dart';

void main() {
  test('navigable task created by json is the same as created via code', () {
    final jsonStr = '''
    {
      "id": "123",
      "type": "navigable",
      "rules": [
          {
            "type": "conditional",
            "triggerStepIdentifier": {
                "id": "123"
            },
            "values": {
                "Yes": "321",
                "No": "456"
            }
          }
        ]
    }
    ''';
    final NavigableTask navigableTask = NavigableTask(
      id: TaskIdentifier(id: '123'),
      steps: [],
    );
    navigableTask.addNavigationRule(
      forTriggerStepIdentifier: StepIdentifier(id: '123'),
      navigationRule: ConditionalNavigationRule(
        resultToStepIdentifierMapper: (input) {
          switch (input) {
            case "Yes":
              return StepIdentifier(id: '321');
            case "No":
              return StepIdentifier(id: '456');
            default:
              return null;
          }
        },
      ),
    );

    final navigableJsonTask = NavigableTask.fromJson(json.decode(jsonStr));

    expect(navigableJsonTask, navigableTask);
  });
}
