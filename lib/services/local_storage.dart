import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../constant/strings.dart';

class TokenService {
  final _storage = const FlutterSecureStorage(
      aOptions: AndroidOptions(
    encryptedSharedPreferences: true,
  ));

  Future<String?> getToken() async {
    final String? value = await _storage.read(key: LocalKey.kAccessToken);
    return value;
  }

  Future<bool> delToken() async {
    await _storage.delete(key: LocalKey.kAccessToken);
    final String? value = await _storage.read(key: LocalKey.kAccessToken);
    return value == null;
  }

  Future saveToken(String token) async {
    await _storage.write(key: LocalKey.kAccessToken, value: token);
  }
}
