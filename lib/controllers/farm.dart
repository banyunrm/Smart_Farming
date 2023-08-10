import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Farm {
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
        'userId': prefs.getString('id')!,
      }),
    );

    final data = jsonDecode(response.body);
    return data;
  }
}

