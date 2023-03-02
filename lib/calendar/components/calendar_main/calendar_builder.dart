import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:with_calendar/calendar/components/calendar_main/calendar_builder/calendar_default_builder.dart';
import 'package:with_calendar/calendar/components/calendar_main/calendar_builder/calendar_dow_builder.dart';
import 'package:with_calendar/common/data/color_data.dart';

CalendarBuilders calendarBuilder() {
  return CalendarBuilders(
    defaultBuilder: (_, day, __) => CalendarDefaultBuilder(dateTime: day),
    todayBuilder: (_, day, __) => CalendarDefaultBuilder(dateTime: day, borderColor: ColorStyles.color_2),
    selectedBuilder: (_, day, __) =>
        CalendarDefaultBuilder(dateTime: day, backgroundColor: ColorStyles.color_4.withOpacity(0.5)),
    dowBuilder: (_, day) => CalendarDowBuilder(dateTime: day),
    outsideBuilder: (_, day, __) => Opacity(opacity: 0.3, child: CalendarDefaultBuilder(dateTime: day)),
  );
}

Color textColorChoice(dateTime) {
  final String weekDay = DateFormat.E('ko_KR').format(dateTime);
  late Color textColor;

  if (weekDay == '토') {
    textColor = Colors.blue;
  } else if (weekDay == '일') {
    textColor = Colors.red;
  } else {
    textColor = Colors.black;
  }
  return textColor;
}
