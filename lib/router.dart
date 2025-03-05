import 'package:go_router/go_router.dart';
import 'package:my_kpop/pages/dashboard_page.dart';
import 'package:my_kpop/pages/profile_page.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const DashboardPage()),
    GoRoute(path: '/profile', builder: (context, state) => const ProfilePage()),
  ],
);
