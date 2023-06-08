import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_hidroponik/page/device_page.dart';
import 'package:flutter_hidroponik/page/home_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailPage extends StatefulWidget {
  final dynamic farmDetail;
  const DetailPage({super.key, this.farmDetail});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  var _farmDetail;
  
  @override
  void initState() {
    super.initState();
    _farmDetail = widget.farmDetail;
    _getData();
  }

  List<Map<String, dynamic>> deviceList = [];
  var addData;

  void _getData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var rawData = prefs.getString('devicedata');

    List<Map<String, dynamic>> convertedData =
        List<Map<String, dynamic>>.from(jsonDecode(rawData ?? "[]"));

    setState(() {
      deviceList = convertedData;
      print(convertedData);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        margin: EdgeInsets.only(top: 55),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(right: 30, left: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child: Icon(
                      Icons.arrow_back,
                      size: 40,
                      color: Color.fromRGBO(43, 90, 82, 1),
                    ),
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (BuildContext context) => HomePage()));
                    },
                  ),
                  Text('Detail',
                      style: GoogleFonts.poppins(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 36, 96, 93),
                      )),
                  GestureDetector(
                    child: Icon(
                      Icons.person,
                      size: 40,
                      color: Color.fromRGBO(28, 101, 140, 1),
                    ),
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (BuildContext context) => HomePage()));
                    },
                  ),
                ],
              ),
            ),
             Container(
                  margin: EdgeInsets.only(left: 15, right: 20, top: 20),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Color.fromARGB(255, 52, 113, 88), width: 1)),
                  )
              ),
            SizedBox(height: 50),
            Card(
              margin: EdgeInsets.only(left: 25, right: 25),
              color: Color.fromARGB(255, 50, 93, 71),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                    _farmDetail['name'],
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                    )),
                    Text(
                    _farmDetail['jenis'],
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                    )),
                    Text(
                    _farmDetail['farm'].toString(),
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                    )),
                    Text(
                    _farmDetail['latitude'],
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                    )),
                    Text(
                    _farmDetail['longitude'],
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                    )),
                  ],
                ),
              ),
            ),
             Card(
              margin: EdgeInsets.only(left: 25, right: 25),
              color: Color.fromARGB(255, 50, 93, 71),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                 
                  ],
                ),
              ),
            ),
            
          
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return DevicePage();
          }));
        },
        child: Icon(
          Icons.add,
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        splashColor: Color.fromARGB(255, 36, 96, 93),
        backgroundColor: Color.fromARGB(255, 80, 143, 128),
      ),
    );
  }
}
