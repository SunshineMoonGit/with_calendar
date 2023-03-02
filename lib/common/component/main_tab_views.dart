import 'package:flutter/material.dart';
import 'package:with_calendar/calendar/view/calendar_screen.dart';
import 'package:with_calendar/group/view/group_screen.dart';

class MainTabViews extends StatelessWidget {
  const MainTabViews({
    super.key,
    required this.controller,
  });

  final TabController controller;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      physics: const NeverScrollableScrollPhysics(),
      controller: controller,
      children: const [
        CalendarScreen(),
        GroupScreen(),
        Center(child: Text('NOTIFICATION')),
        Center(child: Text('PROFILE')),
      ],
    );
  }
}
