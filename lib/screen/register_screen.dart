import 'package:flutter/material.dart';
import 'package:flutter_hidroponik/screen/login_screen.dart';

import '../page/home_page.dart';

class RegisterScreen extends StatefulWidget {
  @override

  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _isSecurePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/img/garden.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                'Lets Register your Account!',
                  style: TextStyle(
                    fontSize: 28.0,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 255, 255, 255),
                ),
            ),

            Container(
                margin: EdgeInsets.only(top: 20),
                width: 385,
                height: 350,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(190, 44, 44, 44),
                      blurRadius: 6,
                      offset: Offset(3, 12),
                    )
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                    ),
                     Text(
                'Register!',
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 17, 99, 97),
                ),
            ),
             Padding(
                padding: EdgeInsets.only(top: 20, left: 30, right: 30),
                child: TextField(
                  style:  TextStyle(
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 17, 99, 97),
                  ),
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    contentPadding: EdgeInsets.all(1.0),
                    labelStyle:  TextStyle(
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 17, 99, 97),
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
                padding: EdgeInsets.only(top: 20, left: 30, right: 30),
                child: TextField(
                  style:  TextStyle(
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 17, 99, 97),
                  ),
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    contentPadding: EdgeInsets.all(1.0),
                    labelStyle:  TextStyle(
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 17, 99, 97),
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
                padding: EdgeInsets.only(top: 15, left: 30, right: 30),
                child: TextField(
                  style:  TextStyle(
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 17, 99, 97),
                    ),
                  obscureText: _isSecurePassword,
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    contentPadding: EdgeInsets.all(1.0),
                    labelStyle:  TextStyle(
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 17, 99, 97),
                    ),
                    suffixIcon: togglePassword(),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ),
               Padding(padding: EdgeInsets.only(top: 30),
               child: SizedBox(
                width: 133,
                height: 31,
                child: ElevatedButton (
                  child: Text('Register',
                style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(3.0),
                  shape: StadiumBorder(),
                  primary: Color.fromARGB(255, 16, 120, 118),
                ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                },
              ),
              ),),
              ],
              ),
              ),
              Padding(padding: EdgeInsets.only(top: 15),
              child: Positioned(
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Sudah punya akun? ',
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                      ),
                    GestureDetector(
                        child: Text(
                          'Login!',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(144, 255, 230, 1),
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      LoginScreen()));
                        },
                      ),
                    ],
                  ),
                ),
              ),),
            ],
          ),
       ),
      ),
    
    );
  }

  Widget togglePassword() {
    return IconButton(
      onPressed: () {
        setState(() {
          _isSecurePassword = !_isSecurePassword;
        });
      },
      icon: _isSecurePassword
          ? Icon(Icons.visibility)
          : Icon(Icons.visibility_off),
      color: Color.fromARGB(255, 28, 140, 97),
    );
  }

}