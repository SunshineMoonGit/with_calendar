import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:with_calendar/calendar/model/new_event_screen_setting_model.dart';

final newEventScreenSettingProvider = StateNotifierProvider<NewEventScreenSetting, NewEventScreenSettingModel>((ref) {
  return NewEventScreenSetting();
});

class NewEventScreenSetting extends StateNotifier<NewEventScreenSettingModel> {
  NewEventScreenSetting()
      : super(NewEventScreenSettingModel(
          isOnCalendarPicker: false,
          isOnTimePicker: false,
          calendarPickerHeight: 0,
          timePickerHeight: 0,
          colorPickerSize: 0,
          nowOpenPicker: 'nothing',
        ));

  void onColorPicker() {
    if (state.colorPickerSize == 0) {
      state = state.copyWith(colorPickerSize: 40);
    } else {
      state = state.copyWith(colorPickerSize: 0);
    }
  }

  void onCalendarPicker(String type) {
    if (state.isOnCalendarPicker && type == state.nowOpenPicker) {
      state = state.copyWith(
        timePickerHeight: 0,
        isOnTimePicker: false,
        isOnCalendarPicker: false,
        calendarPickerHeight: 0,
      );
    } else {
      state = state.copyWith(
        timePickerHeight: 0,
        isOnTimePicker: false,
        isOnCalendarPicker: true,
        calendarPickerHeight: 370,
        nowOpenPicker: type,
      );
    }
  }
}
