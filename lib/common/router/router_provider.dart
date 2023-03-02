import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:with_calendar/calendar/view/calendar_add_screen.dart';
import 'package:with_calendar/common/view/root_screen.dart';

// GoRouter configuration
final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: RootScreen.routeName,
        builder: (context, state) => const RootScreen(),
      ),
      GoRoute(
        path: '/new_event',
        name: CalendarNewEventScreen.routeName,
        builder: (context, state) => const CalendarNewEventScreen(),
      ),
    ],
  );
});
