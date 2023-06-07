import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_hidroponik/page/detail_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DevicePage extends StatefulWidget {

  @override
  State<DevicePage> createState() => _DevicePageState();
}

class _DevicePageState extends State<DevicePage> {
  List<Map<String, dynamic>> deviceList = [];
  String _nama = '';
  String _jenisDevice = '';
  final _namaField = TextEditingController();
  final _jenisDeviceField = TextEditingController();
  var addData;

  @override
  void initState() {
    super.initState();
  }
  
  void _storeData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var newData = prefs.getString('devicedata');
    List<Map<String, dynamic>> convertedData =
        List<Map<String, dynamic>>.from(jsonDecode(newData ?? "[]"));
    deviceList = convertedData;

    if (_namaField.text.isEmpty ||
        _jenisDeviceField.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            duration: Duration(seconds: 2),
            content: Text('Nama dan Jenis Device tidak boleh kosong!')),
      );
      return;
    }

    addData = {
      "nama": _nama,
      "jenisDevice": _jenisDevice,
    };

    deviceList.add(addData);
    var stringData = jsonEncode(deviceList);
    await prefs.setString('devicedata', stringData);

    _namaField.clear();
    _jenisDeviceField.clear();
    FocusScope.of(context).unfocus();
    setState(() {
      _nama = '';
      _jenisDevice = '';
    });
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return DetailPage();
    }));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
          content: Text('Device Ditambahkan!'), duration: Duration(seconds: 1)),
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
            image: AssetImage('assets/img/bg.png'),
            fit: BoxFit.cover
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 50),
              child: Text(
                "Let's set up your",
                style: GoogleFonts.poppins(
                  fontSize: 28.0,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
            Container(
              child: Text(
                "Device!",
                style: GoogleFonts.poppins(
                  fontSize: 28.0,
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
                    topRight: Radius.circular(30)
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
                          'Device',
                          style: GoogleFonts.poppins(
                            fontSize: 28.0,
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
                              _nama = value;
                            });
                          },
                          controller: _namaField,
                          enableSuggestions: false,
                          autocorrect: false,
                          style: GoogleFonts.poppins(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 23, 107, 95),
                          ),
                          autofocus: false,
                          decoration: InputDecoration(
                            labelText: 'Nama',
                            contentPadding: EdgeInsets.all(1.0),
                            labelStyle: GoogleFonts.poppins(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 23, 107, 95),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                            )
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20, left: 15, right: 15),
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              _jenisDevice = value;
                            });
                          },
                          controller: _jenisDeviceField,
                          enableSuggestions: false,
                          autocorrect: false,
                          style: GoogleFonts.poppins(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 23, 107, 95),
                          ),
                          autofocus: false,
                          decoration: InputDecoration(
                            labelText: 'Jenis Sensor',
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 80),
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
              )
            ),
          ],
        )
      ),
    );
  }
}