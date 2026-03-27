/// Application-wide constants.
abstract class AppConstants {
  // API
  static const String baseUrl = 'https://api.example.com';
  static const int connectTimeout = 30000; // ms
  static const int receiveTimeout = 30000; // ms

  // Pagination
  static const int defaultPageSize = 20;

  // Storage keys
  static const String authTokenKey = 'auth_token';
  static const String refreshTokenKey = 'refresh_token';
  static const String userIdKey = 'user_id';
  static const String languageKey = 'language';

  // Auth endpoints
  static const String refreshTokenEndpoint = '/auth/refresh';
}
