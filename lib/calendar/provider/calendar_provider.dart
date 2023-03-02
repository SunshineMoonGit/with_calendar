import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedDayProvider = StateNotifierProvider<SelectedDay, DateTime>((ref) {
  return SelectedDay(ref: ref);
});

class SelectedDay extends StateNotifier<DateTime> {
  SelectedDay({required this.ref}) : super(DateTime.now());
  final Ref ref;

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    state = selectedDay;
  }
}
