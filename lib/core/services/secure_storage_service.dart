import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStorage {
  static const _storage = FlutterSecureStorage();

  static const String accessTokenKey = 'access_token';
  static const String refreshTokenKey = 'refresh_token';

  // Save Tokens
  static Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    await _storage.write(
      key: accessTokenKey,
      value: accessToken,
    );

    await _storage.write(
      key: refreshTokenKey,
      value: refreshToken,
    );
  }

  // Get Access Token
  static Future<String?> getAccessToken() async {
    return await _storage.read(key: accessTokenKey);
  }

  // Get Refresh Token
  static Future<String?> getRefreshToken() async {
    return await _storage.read(key: refreshTokenKey);
  }

  // Clear Tokens
  static Future<void> clearTokens() async {
    await _storage.delete(key: accessTokenKey);
    await _storage.delete(key: refreshTokenKey);
  }
}