import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hhproject/features/auth/presentation/ui/auth_page.dart';
import 'package:hhproject/features/tasks/presentation/tasks.dart';
import 'package:hhproject/main.dart';
import 'package:hhproject/features/profile/presentation/profile_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthLocal {
  static Future<bool> hasalreadylogged() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }
}

final _rootNavigationKey = GlobalKey<NavigatorState>(debugLabel: 'root');

class Routes {
  static const String auth = '/auth';
  static const String home = '/home';
  static const String tasks = '/tasks';
  static const String profile = '/profile';
}

final router = GoRouter(
  navigatorKey: _rootNavigationKey,
  initialLocation: Routes.home,
  redirect: (context, state) async {
    final loggedIn = await AuthLocal.hasalreadylogged();
    final goingToAuth = state.name == Routes.auth;

    if (!loggedIn && !goingToAuth) return Routes.auth;
    if (loggedIn && goingToAuth) return Routes.home;
    return null;
  },
  routes: [
    GoRoute(path: Routes.auth, builder: (context, state) => const AuthScreen()),

    StatefulShellRoute.indexedStack(
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.home,
              builder: (context, state) => const Homepage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.tasks,
              builder: (context, state) => const Tasks(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.profile,
              builder: (context, state) => const Profile2(),
            ),
          ],
        ),
      ],
      builder: (context, state, navigationShell) {
        return Scaffold(
          body: navigationShell,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: navigationShell.currentIndex,
            onTap: navigationShell.goBranch,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.list), label: "Tasks"),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Profile",
              ),
            ],
          ),
        );
      },
    ),
  ],
);
