import 'package:flutter/material.dart';
import 'package:with_calendar/calendar/model/event_model.dart';

List<Event> getEventsForDay(DateTime day) {
  final selectedDay = DateTime.utc(day.year, day.month, day.day);
  return eventSource[selectedDay] ?? [];
}

Map<DateTime, List<Event>> eventSource = {
  DateTime.utc(2023, 2, 3): [
    Event(
      title: '운동',
      color: Colors.green,
      startTime: DateTime.utc(2023, 2, 3, 8, 00),
      endTime: DateTime.utc(2023, 2, 3, 9, 00),
      detail: '상체',
    ),
    Event(
      title: '데이트',
      color: Colors.red,
      isAllDay: true,
      place: '영화관',
    ),
    Event(
      title: '영어 공부하기',
      color: Colors.orange,
      startTime: DateTime.utc(2023, 2, 3, 15, 00),
      endTime: DateTime.utc(2023, 2, 3, 19, 00),
    ),
    Event(
      title: '동아리 모임',
      color: Colors.purple,
      startTime: DateTime.utc(2023, 2, 3, 18, 00),
      endTime: DateTime.utc(2023, 2, 3, 20, 00),
    ),
    Event(
      title: '운동',
      color: Colors.green,
      startTime: DateTime.utc(2023, 2, 3, 8, 00),
      endTime: DateTime.utc(2023, 2, 3, 9, 00),
      detail: '상체',
    ),
    Event(
      title: '데이트',
      color: Colors.red,
      isAllDay: true,
      place: '영화관',
    ),
    Event(
      title: '영어 공부하기',
      color: Colors.orange,
      startTime: DateTime.utc(2023, 2, 3, 15, 00),
      endTime: DateTime.utc(2023, 2, 3, 19, 00),
    ),
    Event(
      title: '동아리 모임',
      color: Colors.purple,
      startTime: DateTime.utc(2023, 2, 3, 18, 00),
      endTime: DateTime.utc(2023, 2, 3, 20, 00),
    ),
    Event(
      title: '운동',
      color: Colors.green,
      startTime: DateTime.utc(2023, 2, 3, 8, 00),
      endTime: DateTime.utc(2023, 2, 3, 9, 00),
      detail: '상체',
    ),
    Event(
      title: '데이트',
      color: Colors.red,
      isAllDay: true,
      place: '영화관',
    ),
    Event(
      title: '영어 공부하기',
      color: Colors.orange,
      startTime: DateTime.utc(2023, 2, 3, 15, 00),
      endTime: DateTime.utc(2023, 2, 3, 19, 00),
    ),
    Event(
      title: '동아리 모임',
      color: Colors.purple,
      startTime: DateTime.utc(2023, 2, 3, 18, 00),
      endTime: DateTime.utc(2023, 2, 3, 20, 00),
    ),
  ],
  DateTime.utc(2023, 2, 5): [
    Event(
      title: '운동',
      color: Colors.green,
      startTime: DateTime.utc(2023, 2, 3, 8, 00),
      endTime: DateTime.utc(2023, 2, 3, 9, 00),
    ),
    Event(
      title: '치킨 먹기',
      color: Colors.red,
      isAllDay: true,
    ),
    Event(
      title: '영어 공부하기',
      color: Colors.orange,
      startTime: DateTime.utc(2023, 2, 3, 8, 00),
      endTime: DateTime.utc(2023, 2, 3, 9, 00),
    ),
    Event(
      title: '동아리 모임',
      color: Colors.purple,
      startTime: DateTime.utc(2023, 2, 3, 18, 00),
      endTime: DateTime.utc(2023, 2, 3, 20, 00),
    ),
    Event(
      title: '운동',
      color: Colors.green,
      startTime: DateTime.utc(2023, 2, 3, 8, 00),
      endTime: DateTime.utc(2023, 2, 3, 9, 00),
    ),
    Event(
      title: '치킨 먹기',
      color: Colors.red,
      isAllDay: true,
    ),
    Event(
      title: '영어 공부하기',
      color: Colors.orange,
      startTime: DateTime.utc(2023, 2, 3, 8, 00),
      endTime: DateTime.utc(2023, 2, 3, 9, 00),
    ),
    Event(
      title: '동아리 모임',
      color: Colors.purple,
      startTime: DateTime.utc(2023, 2, 3, 18, 00),
      endTime: DateTime.utc(2023, 2, 3, 20, 00),
    ),
  ],
  DateTime.utc(2023, 2, 8): [
    Event(
      title: '운동',
      color: Colors.green,
      startTime: DateTime.utc(2023, 2, 3, 8, 00),
      endTime: DateTime.utc(2023, 2, 3, 9, 00),
    ),
    Event(
      title: '자기 셀카 올리기',
      color: Colors.red,
      isAllDay: true,
      startTime: DateTime.utc(2023, 2, 3, 15, 00),
      endTime: DateTime.utc(2023, 2, 3, 19, 00),
    ),
    Event(
      title: '영어 공부하기',
      color: Colors.orange,
      startTime: DateTime.utc(2023, 2, 3, 16, 00),
      endTime: DateTime.utc(2023, 2, 3, 21, 00),
    ),
    Event(
      title: '동아리 모임',
      color: Colors.purple,
      startTime: DateTime.utc(2023, 2, 3, 18, 00),
      endTime: DateTime.utc(2023, 2, 3, 20, 00),
    ),
  ],
  DateTime.utc(2023, 2, 11): [
    Event(
      title: '운동',
      color: Colors.green,
      startTime: DateTime.utc(2023, 2, 3, 8, 00),
      endTime: DateTime.utc(2023, 2, 3, 9, 00),
    ),
    Event(
      title: '가족과 저녁식사 하기',
      color: Colors.red,
      startTime: DateTime.utc(2023, 2, 3, 15, 00),
      endTime: DateTime.utc(2023, 2, 3, 19, 00),
    ),
    Event(
      title: '영어 공부하기',
      color: Colors.orange,
      startTime: DateTime.utc(2023, 2, 3, 19, 00),
      endTime: DateTime.utc(2023, 2, 3, 20, 00),
    ),
  ],
  DateTime.utc(2023, 2, 13): [
    Event(
      title: '운동',
      color: Colors.green,
      startTime: DateTime.utc(2023, 2, 3, 8, 00),
      endTime: DateTime.utc(2023, 2, 3, 9, 00),
    ),
    Event(
      title: '데이트',
      color: Colors.red,
      isAllDay: true,
    ),
    Event(
      title: '영어 공부하기',
      color: Colors.orange,
      startTime: DateTime.utc(2023, 2, 3, 15, 00),
      endTime: DateTime.utc(2023, 2, 3, 19, 00),
    ),
    Event(
      title: '동아리 모임',
      color: Colors.purple,
      startTime: DateTime.utc(2023, 2, 3, 18, 00),
      endTime: DateTime.utc(2023, 2, 3, 20, 00),
    ),
  ],
  DateTime.utc(2023, 2, 15): [
    Event(
      title: '운동',
      color: Colors.green,
      startTime: DateTime.utc(2023, 2, 3, 8, 00),
      endTime: DateTime.utc(2023, 2, 3, 9, 00),
    ),
    Event(
      title: '치킨 먹기',
      color: Colors.red,
      isAllDay: true,
    ),
    Event(
      title: '영어 공부하기',
      color: Colors.orange,
      startTime: DateTime.utc(2023, 2, 3, 15, 00),
      endTime: DateTime.utc(2023, 2, 3, 19, 00),
    ),
    Event(
      title: '동아리 모임',
      color: Colors.purple,
      startTime: DateTime.utc(2023, 2, 3, 18, 00),
      endTime: DateTime.utc(2023, 2, 3, 20, 00),
    ),
  ],
  DateTime.utc(2023, 2, 18): [
    Event(
      title: '운동',
      color: Colors.green,
      startTime: DateTime.utc(2023, 2, 3, 8, 00),
      endTime: DateTime.utc(2023, 2, 3, 9, 00),
    ),
    Event(
      title: '자기 셀카 올리기',
      color: Colors.red,
      isAllDay: true,
    ),
    Event(
      title: '영어 공부하기',
      color: Colors.orange,
      startTime: DateTime.utc(2023, 2, 3, 15, 00),
      endTime: DateTime.utc(2023, 2, 3, 19, 00),
    ),
    Event(
      title: '동아리 모임',
      color: Colors.purple,
      startTime: DateTime.utc(2023, 2, 3, 18, 00),
      endTime: DateTime.utc(2023, 2, 3, 20, 00),
    ),
  ],
  DateTime.utc(2023, 2, 20): [
    Event(
      title: '운동',
      color: Colors.green,
      startTime: DateTime.utc(2023, 2, 3, 8, 00),
      endTime: DateTime.utc(2023, 2, 3, 9, 00),
    ),
    Event(
      title: '자기 셀카 올리기',
      color: Colors.red,
      isAllDay: true,
    ),
    Event(
      title: '영어 공부하기',
      color: Colors.orange,
      startTime: DateTime.utc(2023, 2, 3, 15, 00),
      endTime: DateTime.utc(2023, 2, 3, 19, 00),
    ),
    Event(
      title: '동아리 모임',
      color: Colors.purple,
      startTime: DateTime.utc(2023, 2, 3, 18, 00),
      endTime: DateTime.utc(2023, 2, 3, 20, 00),
    ),
  ],
  DateTime.utc(2023, 2, 21): [
    Event(
      title: '운동',
      color: Colors.red,
      startTime: DateTime.utc(2023, 2, 3, 8, 00),
      endTime: DateTime.utc(2023, 2, 3, 9, 00),
    ),
    Event(
      title: '가족과 저녁식사 하기',
      color: Colors.orange,
      startTime: DateTime.utc(2023, 2, 3, 15, 00),
      endTime: DateTime.utc(2023, 2, 3, 19, 00),
    ),
    Event(
      title: '영어 공부하기',
      color: Colors.purple,
      startTime: DateTime.utc(2023, 2, 3, 18, 00),
      endTime: DateTime.utc(2023, 2, 3, 20, 00),
    ),
  ]
};
