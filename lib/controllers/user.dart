import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class User {
  static login(String email, String password) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = await http.post(
      Uri.parse('https://smartfarming-api-mulkihafizh.vercel.app/user/signin'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{'email': email, 'password': password}),
    );
    final data = jsonDecode(response.body);
    prefs.setString('token', data['token']);
    prefs.setString('id', data['user']['_id']);
    return data;
  }

  static register(String username, String email, String password) async {
    final response = await http.post(
      Uri.parse('https://smartfarming-api-mulkihafizh.vercel.app/user/signup'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'email': email,
        'password': password
      }),
    );
    final data = jsonDecode(response.body);

    return data;
  }

  static logout() async {
    final response = await http.post(
      Uri.parse('https://smartfarming-api-mulkihafizh.vercel.app/user/signout'),
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
          'https://smartfarming-api-mulkihafizh.vercel.app/user/dashboard/${token!}'),
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
      throw Exception(e);
    }
  }
}
