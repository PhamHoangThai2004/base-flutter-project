import 'package:base_flutter_project/features/splash/views/splash_screen.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

part 'app_routes.dart';

final class AppNavigation {
  static final rootNavigatorKey = GlobalKey<NavigatorState>();

  static final shellNavigatorKey = GlobalKey<NavigatorState>();

  static var params = {};
  static var extra = {};

  static GoRouter router = GoRouter(
    initialLocation: AppRoutes.splash,
    observers: [BotToastNavigatorObserver()],
    navigatorKey: rootNavigatorKey,
    routes: [
      // Splash route
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
         path: AppRoutes.splash,
         name: AppRoutes.splash,
         pageBuilder: (context, state) =>  CustomTransitionPage(
          key: state.pageKey,
          child: const SplashScreen(),
          transitionDuration: const Duration(milliseconds: 300),
          reverseTransitionDuration: const Duration(milliseconds: 300),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      )
    ],
  );
}

