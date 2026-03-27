import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/app_constants.dart';

/// Persists and retrieves auth tokens from SharedPreferences.
/// Injected into [AuthInterceptor] to decouple storage from network logic.
@singleton
class TokenStorage {
  TokenStorage(this._prefs);

  final SharedPreferences _prefs;

  // ── Access Token ────────────────────────────────────────────────────────────

  Future<String?> getAccessToken() async =>
      _prefs.getString(AppConstants.authTokenKey);

  Future<void> saveAccessToken(String token) async =>
      _prefs.setString(AppConstants.authTokenKey, token);

  // ── Refresh Token ───────────────────────────────────────────────────────────

  Future<String?> getRefreshToken() async =>
      _prefs.getString(AppConstants.refreshTokenKey);

  Future<void> saveRefreshToken(String token) async =>
      _prefs.setString(AppConstants.refreshTokenKey, token);

  // ── Session ─────────────────────────────────────────────────────────────────

  Future<void> clearTokens() async {
    await _prefs.remove(AppConstants.authTokenKey);
    await _prefs.remove(AppConstants.refreshTokenKey);
  }

  bool get isLoggedIn =>
      _prefs.getString(AppConstants.authTokenKey) != null;
}
