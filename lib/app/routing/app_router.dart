import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'app_pages.dart';
import '../../features/user/presentation/user_page.dart';

/// Centralized routing configuration for the application.
abstract class AppRouter {
  static final router = GoRouter(
    initialLocation: AppPages.homePath,
    debugLogDiagnostics: true,
    routes: _routes,
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text(
          'Page not found: ${state.uri.path}',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    ),
  );

  static final List<RouteBase> _routes = [
    GoRoute(
      path: AppPages.homePath,
      name: AppPages.homeName,
      builder: (context, state) => const Scaffold(
        body: Center(child: Text('Home Page')),
      ),
      routes: [
        UserPage.route,
      ],
    ),
  ];
}
