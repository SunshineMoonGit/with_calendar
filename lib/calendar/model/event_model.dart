import 'package:flutter/material.dart';

class Event {
  String title;

  bool isAllDay;
  DateTime? startTime;
  DateTime? endTime;
  String? place;
  // 어느 캘린더에 저장할지 -> 나중에
  // 알림 시간 -> 몇분 전 뭐 이런식
  // 반복 -> 언제언제
  String? detail;

  Color color;
  Event({
    this.title = '내 일정',
    this.color = Colors.red,
    this.isAllDay = false,
    this.startTime,
    this.endTime,
    this.place,
    this.detail,
  });

  Event copyWith({
    String? title,
    Color? color,
    bool? isAllDay,
    DateTime? startTime,
    DateTime? endTime,
    String? place,
    String? detail,
  }) {
    return Event(
      title: title ?? this.title,
      color: color ?? this.color,
      isAllDay: isAllDay ?? this.isAllDay,
      startTime: startTime ?? this.endTime,
      endTime: endTime ?? this.endTime,
      place: place ?? this.place,
      detail: detail ?? this.detail,
    );
  }
}
