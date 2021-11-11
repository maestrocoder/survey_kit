import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:survey_kit/src/legacy/task/identifier/task_identifier.dart';
import 'package:survey_kit/src/legacy/task/ordered_task.dart';
import 'package:survey_kit/src/legacy/task/task.dart';

void main() {
  test('ordered task created by json is the same as created via code', () {
    final jsonStr = '''
    {
      "id": "123",
      "type": "ordered"
    }
    ''';
    final Task orderedTask =
        OrderedTask(id: TaskIdentifier(id: '123'), steps: []);

    final orderedJsonTask = OrderedTask.fromJson(json.decode(jsonStr));

    expect(orderedTask, orderedJsonTask);
  });
}
