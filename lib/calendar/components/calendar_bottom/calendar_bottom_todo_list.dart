import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:with_calendar/calendar/model/event_model.dart';
import 'package:with_calendar/calendar/provider/calendar_provider.dart';
import 'package:with_calendar/common/data/color_data.dart';
import 'package:with_calendar/common/data/data_format.dart';
import 'package:with_calendar/calendar/provider/event_data_provider.dart';

class CalendarBottomTodoList extends ConsumerWidget {
  const CalendarBottomTodoList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextStyle textStyle = Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 30);
    final DateTime selectedDay = ref.watch(selectedDayProvider);
    List<Event> events = ref.watch(scheduleProvider(selectedDay));

    List<Event> timeLineTaskList = [];
    List<Event> allDayTaskList = [];

    for (Event e in events) {
      if (e.isAllDay) {
        allDayTaskList.add(e);
      } else {
        timeLineTaskList.add(e);
      }
    }
    //timeLineTaskList 정렬
    timeLineTaskList.sort((a, b) => a.startTime!.compareTo(b.startTime!));

    final timeLineTask = getTaskList(timeLineTaskList);
    final allDayTask = getTaskList(allDayTaskList);

    final bool dividerCondition = timeLineTask.isNotEmpty && allDayTask.isNotEmpty ? true : false;
    final bool taskCondition = timeLineTask.isEmpty && allDayTask.isEmpty ? false : true;

    return Container(
      decoration: const BoxDecoration(
        // color: ColorStyles.color_4,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32.0),
          topRight: Radius.circular(32.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: taskCondition
            ? [
                Text('Events', style: textStyle),
                ...allDayTask,
                dividerCondition ? const Divider(color: ColorStyles.color_1) : const SizedBox(),
                ...timeLineTask,
              ]
            : [
                Text('Events', style: textStyle),
                const SizedBox(height: 10),
                Text(
                  '일정이 없습니다.',
                  style: textStyle.copyWith(
                    fontSize: 20,
                  ),
                ),
              ],
      ),
    );
  }

  List getTaskList(List<Event> events) {
    return List.generate(
      events.length,
      (index) {
        return InkWell(
          onTap: () {},
          child: TimelineTile(
            alignment: TimelineAlign.manual,
            lineXY: 0.25,
            isFirst: true,
            isLast: true,
            hasIndicator: true, //현재 시간과 같은 곳 indicator true
            indicatorStyle: timeLineIndicatorStyle(events, index),
            startChild: timeLineStartChild(events, index),
            endChild: timeLineEndChild(events, index),
          ),
        );
      },
    );
  }

  IndicatorStyle timeLineIndicatorStyle(List<Event> events, int index) {
    return IndicatorStyle(
      indicatorXY: 0.5, // indicator 위치 조정
      width: 8,
      height: 30,
      drawGap: true,
      indicator: Container(
        decoration: BoxDecoration(
          color: events[index].color.withOpacity(0.8),
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }

  SizedBox timeLineStartChild(List<Event> events, int index) {
    String timeLineString;

    if (events[index].isAllDay) {
      // AllDay String 중복 제거
      if (index != 0) {
        timeLineString = '';
      } else {
        timeLineString = '하루종일';
      }
    } else {
      // TimeLine String 중복 제거
      if (index != 0) {
        if (events[index].startTime == events[index - 1].startTime) {
          timeLineString = '';
        } else {
          timeLineString = timeLineFormat.format(events[index].startTime!);
        }
      } else {
        timeLineString = timeLineFormat.format(events[index].startTime!);
      }
    }

    return SizedBox(
      height: 30,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(timeLineString),
        ],
      ),
    );
  }

  Padding timeLineEndChild(List<Event> events, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(events[index].title),
          const Text('2 AM ~ 3 AM'),
        ],
      ),
    );
  }
}
