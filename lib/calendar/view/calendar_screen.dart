import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:with_calendar/calendar/components/calendar_bottom/calendar_bottom_todo_list.dart';
import 'package:with_calendar/calendar/components/calendar_main/calendar_root.dart';
import 'package:with_calendar/common/data/color_data.dart';
import 'package:with_calendar/common/data/data_format.dart';

class CalendarScreen extends ConsumerWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    DateTime today = DateTime.now();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          renderSliverAppBar(today, context),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const CalendarRoot(),
                const SizedBox(height: 16.0),
                const CalendarBottomTodoList(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SliverAppBar renderSliverAppBar(DateTime today, BuildContext context) {
    return SliverAppBar(
      // centerTitle: true,
      title: Text(
        ymFormat.format(today),
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 24, color: ColorStyles.color_1),
      ),
      actions: const [Icon(Icons.settings)],
      pinned: true,
      elevation: 0,
      titleSpacing: 0,
      backgroundColor: ColorStyles.color_5,
    );
  }
}
