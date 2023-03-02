import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:with_calendar/common/data/color_data.dart';
import 'package:with_calendar/common/data/data_format.dart';

class CalendarTopBar extends ConsumerWidget {
  const CalendarTopBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    DateTime today = DateTime.now();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        topLeftCalenderBar(today, context),
        const Icon(Icons.calendar_month_rounded),
      ],
    );
  }

  InkWell topLeftCalenderBar(DateTime today, BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(8.0),
      // highlightColor: ColorStyles.color_2,
      splashColor: ColorStyles.color_2,
      child: Row(
        children: [
          Text(
            ymFormat.format(today),
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 24, color: ColorStyles.color_4),
          ),
          const Icon(Icons.expand_more_rounded),
        ],
      ),
    );
  }
}
