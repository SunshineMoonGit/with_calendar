import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:with_calendar/calendar/model/event_model.dart';
import 'package:with_calendar/common/data/event_data.dart';

class CalendarDefaultBuilder extends ConsumerWidget {
  const CalendarDefaultBuilder({
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
    final List<Event> events = getEventsForDay(dateTime);

    final List renderEventsList = List.generate(
      events.length,
      (index) {
        return Container(
          height: 5,
          decoration: BoxDecoration(
            color: events[index].color,
            borderRadius: BorderRadius.circular(8.0),
          ),
        );
      },
    );
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
              Wrap(
                direction: Axis.horizontal,
                // alignment: WrapAlignment.center,
                // spacing: 1, // 좌우 간격
                runSpacing: 3,
                children: [...renderEventsList],
              )
            ],
          ),
        ),
      ),
    );
  }
}
