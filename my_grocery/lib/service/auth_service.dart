import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:my_grocery/const.dart';
import 'package:my_grocery/model/user.dart';

class RemoteAuthService {
  var client = http.Client();

  Future<dynamic> signUp({
    required String email,
    required String password,
  }) async {
    var body = {"username": email, "email": email, "password": password};
    var response = await client.post(
      Uri.parse('$baseUrl/api/auth/local/register'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );
    return response;
  }

  Future<dynamic> signIn({
    required String email,
    required String password,
  }) async {
    var body = {"identifier": email, "password": password};
    var response = await client.post(
      Uri.parse('$baseUrl/api/auth/local'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );
    return response;
  }

  Future<dynamic> createProfile({
    required String fullName,
    required String token,
  }) async {
    var body = {"fullName": fullName};
    var response = await client.post(
      Uri.parse('$baseUrl/api/profile/me'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
      body: jsonEncode(body),
    );
    return response;
  }

  Future<dynamic> getProfile({
    required String token,
  }) async {
    var response = await client.get(
      Uri.parse('$baseUrl/api/profile/me'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    return response;
  }
}

// Storage of the tokeb
class LocalAuthService {
  late Box<String> _tokenBox;
  late Box<User> _userBox;

  Future<void> init() async {
    _tokenBox = await Hive.openBox<String>('token');
    _userBox = await Hive.openBox<User>('user');
  }

  Future<void> addToken({required String token}) async {
    await _tokenBox.put('token', token);
  }

  Future<void> addUser({required User user}) async {
    await _userBox.put('user', user);
  }

  Future<void> clear() async {
    await _tokenBox.clear();
    await _userBox.clear();
  }

  String? getToken() => _tokenBox.get('token');
  User? getUser() => _userBox.get('user');
}
