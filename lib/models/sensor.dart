import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Sensor {
  late String name;
  late String type;
  late String farmId;
  late String userId;
  late String guid;

  Sensor(
      {required this.name,
      required this.type,
      required this.farmId,
      required this.userId,
      required this.guid});

  Sensor.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    type = json['type'];
    guid = json['_guid'];
    farmId = json['_farm_id'];
    userId = json['_user_id'];
  }

  static create(String name, String type, String guid, String farmId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = await http.post(
      Uri.parse(
          'https://smartfarming-api-mulkihafizh.vercel.app/sensor/create'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Cookie': 'token=${prefs.getString('token')}'
      },
      body: jsonEncode(<String, String>{
        'name': name,
        'type': type,
        '_guid': guid,
        '_farm_id': farmId,
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = jsonDecode(response.body);
      try {
        return Sensor.fromJson(data['sensor']);
      } catch (e) {
        throw Exception('Terjadi kesalahan');
      }
    } else {
      throw Exception(response.body);
    }
  }
}
