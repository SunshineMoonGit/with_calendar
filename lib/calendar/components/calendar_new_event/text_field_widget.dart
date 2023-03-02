import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:with_calendar/calendar/provider/event_data_provider.dart';
import 'package:with_calendar/calendar/provider/new_event_screen_setting_provider.dart';
import 'package:with_calendar/common/data/color_data.dart';

class TextFieldWidget extends ConsumerWidget {
  const TextFieldWidget({
    required this.hintText,
    required this.controller,
    required this.icon,
    required this.isFilled,
    required this.index,
    required this.textFieldOnTap,
    required this.columnDivider,
    this.suffixOnTap,
    this.suffixIcon,
    super.key,
  });
  final String hintText;
  final TextEditingController controller;
  final Icon icon;
  final List<bool> isFilled;
  final int index;
  final Function textFieldOnTap;
  final Divider columnDivider;
  final Function? suffixOnTap;
  final Icon? suffixIcon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final Event state = ref.watch(newEventProvider);
    return Column(
      children: [
        Container(
          constraints: const BoxConstraints(
            minHeight: 50,
          ),
          child: TextField(
            onTap: () => textFieldOnTap(index),
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              suffixIcon: suffixIcon != null
                  ? IconButton(
                      onPressed: () {
                        ref.read(newEventScreenSettingProvider.notifier).onColorPicker();
                      },
                      icon: suffixIcon!,
                      color: ref.watch(newEventProvider).color,
                    )
                  : suffixIcon,
              icon: icon,
              suffixIconColor: ColorStyles.color_3.withOpacity(0.5),
              iconColor: isFilled[index] ? ColorStyles.color_1 : ColorStyles.color_3.withOpacity(0.5),
            ),
          ),
        ),
        columnDivider,
      ],
    );
  }
}
