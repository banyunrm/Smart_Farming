import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';

import 'home_page.dart';

class GardenPage extends StatefulWidget {
  @override
  _GardenPageState createState() => _GardenPageState();
}

class _GardenPageState extends State<GardenPage> {
  List<Map<String, dynamic>> farmList = [];
  String _name = '';
  String _jenis = '';
  final _nameField = TextEditingController();
  final _jenisField = TextEditingController();
  var addData;

  double longitude = 0.0;
  double latitude = 0.0;
  int _farm = 0;
  final _longitudeField = TextEditingController();
  final _latitudeField = TextEditingController();
  final _farmField = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  void _storeData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var newData = prefs.getString('farmdata');
    List<Map<String, dynamic>> convertedData =
        List<Map<String, dynamic>>.from(jsonDecode(newData ?? "[]"));
    farmList = convertedData;

    if (_nameField.text.isEmpty ||
        _jenisField.text.isEmpty ||
        _farmField.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            duration: Duration(seconds: 2),
            content: Text('Nama, Jenis Tanaman dan lahan tidak boleh kosong!')),
      );
      return;
    }

    addData = {
      "name": _name,
      "jenis": _jenis,
      "longitude": longitude,
      "latitude": latitude,
      "farm": _farm
    };

    farmList.add(addData);
    var stringData = jsonEncode(farmList);
    await prefs.setString('farmdata', stringData);

    _nameField.clear();
    _jenisField.clear();
    FocusScope.of(context).unfocus();
    setState(() {
      _name = '';
      _jenis = '';
      _farm = 0;
    });
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return HomePage();
    }));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
          content: Text('Lahan Ditambahkan!'), duration: Duration(seconds: 1)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/img/bg.png'), fit: BoxFit.cover),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 50),
              child: Text(
                "Let's decide your",
                style: TextStyle(
                  fontSize: 28.0,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
            Container(
              child: Text(
                "Garden!",
                style: TextStyle(
                  fontSize: 28.0,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
            SizedBox(height: 100),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(190, 18, 12, 12),
                      blurRadius: 3,
                      offset: Offset(0, -5),
                      spreadRadius: -2.0,
                    ),
                  ],
                ),
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Text(
                          'Tambah Lahan',
                          style: TextStyle(
                            fontSize: 28.0,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 23, 107, 95),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20, left: 15, right: 15),
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              _name = value;
                            });
                          },
                          controller: _nameField,
                          enableSuggestions: false,
                          autocorrect: false,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 23, 107, 95),
                          ),
                          autofocus: false,
                          decoration: InputDecoration(
                            labelText: 'Nama Kebun',
                            contentPadding: EdgeInsets.all(1.0),
                            labelStyle: TextStyle(
                              fontSize: 16.0,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 23, 107, 95),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20, left: 15, right: 15),
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              _jenis = value;
                            });
                          },
                          controller: _jenisField,
                          enableSuggestions: false,
                          autocorrect: false,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 23, 107, 95),
                          ),
                          autofocus: false,
                          decoration: InputDecoration(
                            labelText: 'Jenis Tanaman',
                            contentPadding: EdgeInsets.all(1.0),
                            labelStyle: TextStyle(
                              fontSize: 16.0,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 23, 107, 95),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20, left: 15, right: 15),
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              int luas = int.parse(value);
                              _farm = luas;
                            });
                          },
                          controller: _farmField,
                          enableSuggestions: false,
                          autocorrect: false,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 23, 107, 95),
                          ),
                          autofocus: false,
                          decoration: InputDecoration(
                            labelText: 'Luas Lahan',
                            contentPadding: EdgeInsets.all(1.0),
                            labelStyle: TextStyle(
                              fontSize: 16.0,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 23, 107, 95),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 50),
                        child: SizedBox(
                          width: 133,
                          height: 31,
                          child: ElevatedButton(
                            child: Text(
                              'Submit',
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.all(3.0),
                              shape: StadiumBorder(),
                              primary: Color.fromARGB(255, 16, 120, 118),
                            ),
                            onPressed: () {
                              _storeData();
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
