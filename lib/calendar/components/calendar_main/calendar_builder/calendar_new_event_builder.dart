import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:with_calendar/common/data/color_data.dart';

CalendarBuilders calendarNewEventBuilder() {
  return CalendarBuilders(
    defaultBuilder: (_, day, __) => CalendarNewEventBuilder(dateTime: day),
    todayBuilder: (_, day, __) => CalendarNewEventBuilder(dateTime: day, borderColor: ColorStyles.color_2),
    selectedBuilder: (_, day, __) =>
        CalendarNewEventBuilder(dateTime: day, backgroundColor: ColorStyles.color_4.withOpacity(0.5)),
    outsideBuilder: (_, day, __) => Opacity(opacity: 0.3, child: CalendarNewEventBuilder(dateTime: day)),
  );
}

class CalendarNewEventBuilder extends ConsumerWidget {
  const CalendarNewEventBuilder({
    required this.dateTime,
    this.borderColor,
    this.backgroundColor,
    super.key,
  });
  final DateTime dateTime;
  final Color? borderColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String dayString = dateTime.day.toString();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 2.0),
      child: Container(
        height: 1000,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: borderColor ?? Colors.transparent,
            width: 1,
          ),
        ),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                child: Text(
                  textAlign: TextAlign.center,
                  dayString,
                  // style: TextStyle(fontSize: 14, color: textColorChoice(dateTime)),
                  style: const TextStyle(fontSize: 14, color: Colors.white),
                ),
              ),
              const SizedBox(height: 5),
            ],
          ),
        ),
      ),
    );
  }
}
