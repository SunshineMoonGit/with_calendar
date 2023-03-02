import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:with_calendar/calendar/components/calendar_main/calendar_builder/calendar_new_event_builder.dart';
import 'package:with_calendar/calendar/provider/calendar_provider.dart';
import 'package:with_calendar/calendar/provider/new_event_screen_setting_provider.dart';

class CalendarPickerWidget extends StatelessWidget {
  const CalendarPickerWidget({
    super.key,
    required this.selectedDay,
    required this.ref,
    required this.columnDivider,
  });

  final DateTime selectedDay;
  final WidgetRef ref;
  final Divider columnDivider;

  @override
  Widget build(BuildContext context) {
    final double height = ref.watch(newEventScreenSettingProvider).calendarPickerHeight;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: height,
      child: SingleChildScrollView(
        child: Column(
          children: [
            TableCalendar(
              locale: 'ko_KR',
              firstDay: DateTime.now().subtract(const Duration(days: 365 * 10 + 2)),
              lastDay: DateTime.now().add(const Duration(days: 365 * 10 + 2)),
              focusedDay: selectedDay,
              headerStyle: const HeaderStyle(
                titleCentered: true,
                formatButtonVisible: false,
              ),
              onDaySelected: ref.read(selectedDayProvider.notifier).onDaySelected,
              daysOfWeekHeight: 40,
              selectedDayPredicate: (day) => isSameDay(selectedDay, day),
              calendarBuilders: calendarNewEventBuilder(),
            ),
            columnDivider,
          ],
        ),
      ),
    );
  }
}
