/// Manages all route paths and names for the application.
///
/// - [path]: used in [GoRoute] `path` and `context.go()`
/// - [name]: used for named navigation via `context.goNamed()`
abstract class AppRoutes {
  // ── Paths ─────────────────────────────────────────────────────────────────
  static const String homePath = '/';
  static const String demoPath = 'demo'; // child of home → full: /demo

  // ── Names ─────────────────────────────────────────────────────────────────
  static const String homeName = 'home';
  static const String demoName = 'demo';
}
