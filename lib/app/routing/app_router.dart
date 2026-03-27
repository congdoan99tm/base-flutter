import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/demo/demo_page.dart';
import 'app_routes.dart';

/// Centralized GoRouter configuration.
/// Route paths and names are managed by [AppRoutes].
final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.homePath,
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

/// All application routes.
final List<RouteBase> _routes = [
  GoRoute(
    path: AppRoutes.homePath,
    name: AppRoutes.homeName,
    // TODO: Replace with your actual HomePage widget
    builder: (context, state) => const Scaffold(
      body: Center(child: Text('Home Page')),
    ),
    routes: [
      // GoRoute(
      //   path: AppRoutes.demoPath,
      //   name: AppRoutes.demoName,
      //   builder: (context, state) => const DemoPage(),
      // ),
    ],
  ),
];
