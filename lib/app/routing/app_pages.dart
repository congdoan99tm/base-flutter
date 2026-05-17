/// Manages all route paths and names for the application.
///
/// - [path]: used in [GoRoute] `path` and `context.go()`
/// - [name]: used for named navigation via `context.goNamed()`
abstract class AppPages {
  // ── Paths ─────────────────────────────────────────────────────────────────
  static const String homePath = '/';
  static const String userPath = '/user';

  // ── Names ─────────────────────────────────────────────────────────────────
  static const String homeName = 'home';
  static const String userName = 'user';
}
