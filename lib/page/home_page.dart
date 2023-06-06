import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_hidroponik/page/detail_page.dart';
import 'package:flutter_hidroponik/page/garden_page.dart';
import 'package:flutter_hidroponik/page/profile_page.dart';
import 'package:flutter_hidroponik/screen/login_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> farmList = [];
  var addData;

  void _getData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var rawData = prefs.getString('farmdata');

    List<Map<String, dynamic>> convertedData =
        List<Map<String, dynamic>>.from(jsonDecode(rawData ?? "[]"));

    setState(() {
      farmList = convertedData;
      print(convertedData);
    });
  }

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 246, 246, 246),
      body: Container(
        margin: EdgeInsets.only(top: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(right: 30, left: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Hello, User!',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 17, 99, 97),
                    ),
                  ),
                  GestureDetector(
                    child: Icon(
                      Icons.person,
                      size: 40,
                      color: Color.fromRGBO(28, 101, 140, 1),
                    ),
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (BuildContext context) => ProfilePage()));
                    },
                  ),
                ],
              ),
            ),
            Image.asset(
              'assets/img/people2.png',
              height: 300,
              width: 370,
            ),
             Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                // child: SingleChildScrollView(
                //   child: Container(
                //     padding: EdgeInsets.only(top: 20),
                //     height: MediaQuery.of(context).size.height,
                //     width: MediaQuery.of(context).size.width,
                //     decoration: BoxDecoration(
                //       color: Colors.white,
                //     ),
                    child: ListView.builder(
                      itemCount: farmList.length,
                      itemBuilder: (context, index) {
                        var farmItem = farmList[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailScreen(
                                          farmDetail: farmItem,
                                        )));
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            color: Color.fromARGB(255, 178, 228, 216),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: IntrinsicHeight(
                                child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      Expanded(
                                          flex: 2,
                                          child: Image.asset('assets/img/plant.png',
                                              fit: BoxFit.cover)),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        flex: 5,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              farmItem['name'],
                                              style: GoogleFonts.poppins(
                                                  fontSize: 21,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text(
                                              farmItem['jenis'],
                                              style: GoogleFonts.poppins(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            Text(
                                              farmItem['farm'].toString(),
                                              style: GoogleFonts.poppins(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            const SizedBox(height: 10),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Text(
                                                  'Tap Untuk',
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w400),
                                                ),
                                                Text(
                                                  ' Detail',
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                    color: Color.fromARGB(
                                                        255, 23, 107, 95),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ]),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
              //     ),
              //   ),
              ),
            ),
          ]
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return GardenPage();
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
