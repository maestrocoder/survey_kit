import 'package:survey_kit/src/legacy/steps/identifier/identifier.dart';

abstract class Result {
  final Identifier? id;
  final DateTime startDate;
  final DateTime endDate;

  Result({
    required this.id,
    required this.startDate,
    required this.endDate,
  });
}
