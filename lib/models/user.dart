import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class User {
  late String id;
  late String username;
  late String email;

  User({
    required this.id,
    required this.username,
    required this.email,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    username = json['username'];
    email = json['email'];
  }

  static login(String email, String password) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = await http.post(
      Uri.parse(
          'https://smartfarming-api-mulkihafizh.vercel.app/smart-farming/signin'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      try {
        prefs.setString('token', data['token']);
        return User.fromJson(data['user']);
      } catch (e) {
        throw Exception('Terjadi kesalahan');
      }
    } else {
      throw Exception(response.body);
    }
  }

  static register(String username, String email, String password) async {
    final response = await http.post(
      Uri.parse(
          'https://smartfarming-api-mulkihafizh.vercel.app/smart-farming/signup'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'email': email,
        'password': password
      }),
    );

    if (response.statusCode == 200||response.statusCode == 201) {
      final data = jsonDecode(response.body);
      try {
        return User.fromJson(data['newUser']);
      } catch (e) {
        throw Exception('Terjadi kesalahan');
      }
    } else {
      throw Exception(response.body);
    }
  }

  static logout() async {
    final response = await http.post(
      Uri.parse(
          'https://smartfarming-api-mulkihafizh.vercel.app/smart-farming/signout'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      try {
        return data;
      } catch (e) {
        throw Exception('Terjadi kesalahan');
      }
    } else {
      throw Exception(response.body);
    }
  }

  static dashboard() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    final response = await http.get(
      Uri.parse(
          'https://smartfarming-api-mulkihafizh.vercel.app/smart-farming/dashboard'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': prefs.getString('token') ?? '',
        'Cookie': 'token=$token'
      },
    );

    final data = jsonDecode(response.body);
    try {
      return data;
    } catch (e) {
      throw Exception('Terjadi kesalahan');
    }
  }
}
