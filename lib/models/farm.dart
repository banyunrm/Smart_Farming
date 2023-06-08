import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Farm {
  late String name;
  late String type;
  late String userId;

  Farm({required this.name, required this.type, required this.userId});

  Farm.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    type = json['type'];
    userId = json['_user_id'];
  }

  static create(String name, String type, String farmArea, String longitude,
      String latitude) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = await http.post(
      Uri.parse('https://smartfarming-api-mulkihafizh.vercel.app/farm/create'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Cookie': 'token=${prefs.getString('token')}'
      },
      body: jsonEncode(<String, String>{
        'name': name,
        'type': type,
        'farmArea': farmArea,
        'longitude': longitude,
        'latitude': latitude,
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = jsonDecode(response.body);
      try {
        return Farm.fromJson(data['farm']);
      } catch (e) {
        throw Exception('Terjadi kesalahan');
      }
    } else {
      throw Exception(response.body);
    }
  }
}
