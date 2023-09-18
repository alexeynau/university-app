import 'package:equatable/equatable.dart';

class ScheduleSettings extends Equatable {
  const ScheduleSettings({
    required this.showLections,
    required this.showEmptyLessons,
    required this.showLessonsNumbers,
    required this.calendarFormat,
  });
  final bool showLections;
  final bool showEmptyLessons;
  final bool showLessonsNumbers;
  final int calendarFormat;

  @override
  List<Object?> get props =>
      [showEmptyLessons, showLections, showLessonsNumbers];
}
