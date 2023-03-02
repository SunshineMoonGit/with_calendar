import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:with_calendar/calendar/provider/event_data_provider.dart';
import 'package:with_calendar/calendar/provider/new_event_screen_setting_provider.dart';

class ColorPickerWidget extends ConsumerWidget {
  const ColorPickerWidget({
    super.key,
    required this.columnDivider,
  });
  final Divider columnDivider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: ref.watch(newEventScreenSettingProvider).colorPickerSize,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: List.generate(
                picker.length,
                (index) {
                  return InkWell(
                    borderRadius: BorderRadius.circular(100),
                    onTap: () {
                      ref.read(newEventProvider.notifier).setClass(color: picker[index]);
                      ref.read(newEventScreenSettingProvider.notifier).onColorPicker();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: picker[index],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            columnDivider,
          ],
        ),
      ),
    );
  }
}

final List<Color> picker = [
  Colors.red,
  Colors.deepOrange,
  Colors.deepPurple,
  Colors.green,
  Colors.blue,
];
