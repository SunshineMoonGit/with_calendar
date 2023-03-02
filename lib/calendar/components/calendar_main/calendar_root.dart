import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:with_calendar/calendar/components/calendar_main/calendar_builder.dart';
import 'package:with_calendar/calendar/provider/calendar_provider.dart';
import 'package:with_calendar/common/data/color_data.dart';

class CalendarRoot extends ConsumerWidget {
  const CalendarRoot({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final DateTime selectedDay = ref.watch(selectedDayProvider);
    return Container(
      decoration: BoxDecoration(
        color: ColorStyles.color_4.withOpacity(0.5),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: TableCalendar(
        //PRIMARY_SETTINGS
        locale: 'ko_KR',
        firstDay: DateTime.now().subtract(const Duration(days: 365 * 10 + 2)),
        lastDay: DateTime.now().add(const Duration(days: 365 * 10 + 2)),
        // shouldFillViewport: true,

        focusedDay: selectedDay,

        onDaySelected: ref.read(selectedDayProvider.notifier).onDaySelected,
        daysOfWeekHeight: 40,
        selectedDayPredicate: (day) => isSameDay(selectedDay, day),
        // calendarFormat: CalendarFormat.week,

        headerVisible: false,
        calendarStyle: const CalendarStyle(tablePadding: EdgeInsets.symmetric(vertical: 10.0)),
        daysOfWeekStyle: const DaysOfWeekStyle(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: ColorStyles.color_4),
            ),
          ),
        ),

        //BUILDER
        calendarBuilders: calendarBuilder(),
      ),
    );
  }
}
