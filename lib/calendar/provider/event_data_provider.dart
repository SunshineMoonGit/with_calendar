import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:with_calendar/calendar/model/event_model.dart';
import 'package:with_calendar/common/data/event_data.dart';

final scheduleProvider = StateNotifierProvider.family<ScheduleStateNotifer, List<Event>, DateTime>((ref, day) {
  return ScheduleStateNotifer(day: day);
});

class ScheduleStateNotifer extends StateNotifier<List<Event>> {
  final DateTime day;

  ScheduleStateNotifer({required this.day}) : super(getEventsForDay(day));
}

// * New Event Page에서 필요한 Data Model

final newEventProvider = StateNotifierProvider<NewEventNotifier, Event>((ref) => NewEventNotifier());

class NewEventNotifier extends StateNotifier<Event> {
  NewEventNotifier() : super(Event());

  void setClass({
    String? title,
    Color? color,
    bool? isAllDay,
    DateTime? startTime,
    DateTime? endTime,
    String? place,
    String? detail,
  }) {
    state = state.copyWith(
      title: title ?? state.title,
      color: color ?? state.color,
      isAllDay: isAllDay ?? state.isAllDay,
      startTime: startTime ?? state.endTime,
      endTime: endTime ?? state.endTime,
      place: place ?? state.place,
      detail: detail ?? state.detail,
    );
  }
}
