import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarDowBuilder extends StatelessWidget {
  const CalendarDowBuilder({
    required this.dateTime,
    Key? key,
  }) : super(key: key);
  final DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    final String weekDay = DateFormat.E('ko_KR').format(dateTime);

    return Center(
      child: Text(
        weekDay,
        style: const TextStyle(
            // color: textColorChoice(dateTime),
            ),
      ),
    );
  }
}
