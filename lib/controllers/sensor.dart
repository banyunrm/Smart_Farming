import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Sensor {
  static create(String name, String type, String guid, String farmId,
      String actuatorVal) async {
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
        '_actuator_id': actuatorVal,
      }),
    );

    final data = jsonDecode(response.body);

    return data;
  }

  static getType() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = await http.get(
      Uri.parse(
          'https://smartfarming-api-mulkihafizh.vercel.app/type/all/${prefs.getString('token')!}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Cookie': 'token=${prefs.getString('token')}'
      },
    );

    final data = jsonDecode(response.body);
    final actuator = data['actuators'];
    final type = data['types'];

    final returned = {
      'actuator': actuator,
      'type': type,
    };
    return returned;
  }
}
