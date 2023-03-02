// ignore_for_file: public_member_api_docs, sort_constructors_first

class NewEventScreenSettingModel {
  bool isOnCalendarPicker;
  bool isOnTimePicker;
  double calendarPickerHeight;
  double timePickerHeight;
  double colorPickerSize;
  String nowOpenPicker;
  NewEventScreenSettingModel({
    required this.isOnCalendarPicker,
    required this.isOnTimePicker,
    required this.calendarPickerHeight,
    required this.timePickerHeight,
    required this.colorPickerSize,
    required this.nowOpenPicker,
  });

  NewEventScreenSettingModel copyWith({
    bool? isOnCalendarPicker,
    bool? isOnTimePicker,
    double? calendarPickerHeight,
    double? timePickerHeight,
    double? colorPickerSize,
    String? nowOpenPicker,
  }) {
    return NewEventScreenSettingModel(
      isOnCalendarPicker: isOnCalendarPicker ?? this.isOnCalendarPicker,
      isOnTimePicker: isOnTimePicker ?? this.isOnTimePicker,
      calendarPickerHeight: calendarPickerHeight ?? this.calendarPickerHeight,
      timePickerHeight: timePickerHeight ?? this.timePickerHeight,
      colorPickerSize: colorPickerSize ?? this.colorPickerSize,
      nowOpenPicker: nowOpenPicker ?? this.nowOpenPicker,
    );
  }
}
