import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:with_calendar/calendar/view/calendar_add_screen.dart';
import 'package:with_calendar/common/component/main_tab_views.dart';
import 'package:with_calendar/common/view/default_layout.dart';

class RootScreen extends StatefulWidget {
  static String get routeName => 'Root';
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> with SingleTickerProviderStateMixin {
  late TabController _controller;
  // final int _bottomNavIndex = 5;

  @override
  void initState() {
    super.initState();

    _controller = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void navigationTap(int value) {
    if (value != _controller.index) {
      setState(() {
        _controller.index = value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: MainTabViews(controller: _controller),
      bottomNavigationBar: bottomNavigationBar(),
      floatingActionButton: _controller.index == 0
          ? FloatingActionButton(
              onPressed: () => context.pushNamed(CalendarNewEventScreen.routeName),
              child: const Icon(Icons.add),
            )
          : null,
    );
  }

  BottomNavigationBar bottomNavigationBar() {
    return BottomNavigationBar(
      onTap: (value) => navigationTap(value),
      currentIndex: _controller.index,
      items: const [
        BottomNavigationBarItem(
          activeIcon: Icon(Icons.home),
          icon: Icon(Icons.home_outlined),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(Icons.group),
          icon: Icon(Icons.group_outlined),
          label: 'Group',
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(Icons.notifications),
          icon: Icon(Icons.notifications_outlined),
          label: 'Notification',
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(Icons.more_horiz),
          icon: Icon(Icons.more_horiz_outlined),
          label: 'Others',
        ),
      ],
    );
  }
}
