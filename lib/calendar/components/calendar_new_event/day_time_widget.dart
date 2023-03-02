import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:with_calendar/calendar/components/calendar_new_event/calendar_picker_widget.dart';
import 'package:with_calendar/calendar/provider/calendar_provider.dart';
import 'package:with_calendar/calendar/provider/new_event_screen_setting_provider.dart';
import 'package:with_calendar/common/data/color_data.dart';
import 'package:with_calendar/common/data/data_format.dart';

class DateTimeWidget extends ConsumerStatefulWidget {
  const DateTimeWidget({
    required this.columnDivider,
    super.key,
  });
  final Divider columnDivider;

  @override
  ConsumerState<DateTimeWidget> createState() => _DateTimeWidgetState();
}

class _DateTimeWidgetState extends ConsumerState<DateTimeWidget> {
  bool isAllDay = true;

  // bool isOnCalendarPicker = false;
  // bool isOnTimePicker = false;
  // double calendarPickerHeight = 0;
  // double timePickerHeight = 0;

  // void onCalendarPicker() {
  //   setState(() {
  //     timePickerHeight = 0;
  //     isOnTimePicker = false;
  //     isOnCalendarPicker = true;
  //     calendarPickerHeight = 365;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final DateTime selectedDay = ref.watch(selectedDayProvider);
    DateTime startDay = DateTime.utc(
      selectedDay.year,
      selectedDay.month,
      selectedDay.day,
      8,
      00,
    );
    DateTime endDay = DateTime.utc(
      selectedDay.year,
      selectedDay.month,
      selectedDay.day,
      9,
      00,
    );
    return Container(
      constraints: const BoxConstraints(
        minHeight: 50,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.event_available_outlined,
                      color: !isAllDay ? ColorStyles.color_3.withOpacity(0.5) : ColorStyles.color_1),
                  const SizedBox(
                    width: 16,
                  ),
                  const Text('하루 종일'),
                ],
              ),
              Switch(
                value: isAllDay,
                onChanged: (value) {
                  setState(() {
                    isAllDay = value;
                  });
                },
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.schedule_outlined,
                color: isAllDay ? ColorStyles.color_3.withOpacity(0.5) : ColorStyles.color_1,
              ),
              Row(
                children: [
                  Column(
                    children: [
                      InkWell(
                        borderRadius: BorderRadius.circular(16.0),
                        onTap: () => ref.read(newEventScreenSettingProvider.notifier).onCalendarPicker('start'),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 2.0,
                          ),
                          child: Text(mdFormat.format(startDay)),
                        ),
                      ),
                      if (!isAllDay)
                        InkWell(
                          borderRadius: BorderRadius.circular(16.0),
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                              vertical: 2.0,
                            ),
                            child: Text(timeLineFormat.format(startDay)),
                          ),
                        ),
                    ],
                  ),
                  const Icon(Icons.arrow_forward_outlined),
                  Column(
                    children: [
                      InkWell(
                        borderRadius: BorderRadius.circular(16.0),
                        onTap: () => ref.read(newEventScreenSettingProvider.notifier).onCalendarPicker('end'),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 2.0,
                          ),
                          child: Text(mdFormat.format(endDay)),
                        ),
                      ),
                      if (!isAllDay)
                        InkWell(
                          borderRadius: BorderRadius.circular(16.0),
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                              vertical: 2.0,
                            ),
                            child: Text(timeLineFormat.format(endDay)),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
              Icon(
                Icons.schedule_outlined,
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
            ],
          ),
          widget.columnDivider,
          CalendarPickerWidget(selectedDay: selectedDay, ref: ref, columnDivider: widget.columnDivider),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: 100,
            child: SingleChildScrollView(
              child: Row(
                children: const [
                  // Expanded(
                  //   child: CupertinoPicker(
                  //     looping: true,
                  //     itemExtent: 75,
                  //     onSelectedItemChanged: (value) {},
                  //     children: [
                  //       ...timePickerNoon.map(
                  //         (e) => Center(
                  //           child: Text(
                  //             e,
                  //             style: const TextStyle(color: Colors.white),
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // Expanded(
                  //   child: CupertinoPicker(
                  //     // squeeze: 4,
                  //     looping: true,
                  //     itemExtent: 75,
                  //     onSelectedItemChanged: (value) {},
                  //     children: [
                  //       ...timePickerHour.map(
                  //         (e) => Center(
                  //           child: Text(
                  //             e,
                  //             style: const TextStyle(color: Colors.white),
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // Expanded(
                  //   child: CupertinoPicker(
                  //     looping: true,
                  //     itemExtent: 75,
                  //     onSelectedItemChanged: (value) {},
                  //     children: [
                  //       ...timePickerMinute.map(
                  //         (e) => Center(
                  //           child: Text(
                  //             e,
                  //             style: const TextStyle(color: Colors.white),
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<String> timePickerNoon = ['오전', '오후'];
List<String> timePickerHour = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'];
List<String> timePickerMinute = ['00', '05', '10', '15', '20', '25', '30', '35', '40', '45', '50', '55'];
