import 'package:flutter/material.dart';
import 'package:flutter_hidroponik/page/garden_page.dart';
import 'package:flutter_hidroponik/page/profile_page.dart';
import 'package:flutter_hidroponik/screen/login_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 235, 255, 241),
      body: Container(
        margin: EdgeInsets.only(top: 15),
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
              child: Container(
                padding: EdgeInsets.only(top: 30),
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(190, 18, 12, 12),
                      blurRadius: 3,
                      offset: Offset(0, -5),
                      spreadRadius: -2.0,
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      
                    ],
                  ),
                ),
              ),
            ),
          ],
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
