import 'package:flutter/material.dart';
import 'package:flutter_hidroponik/page/home_page.dart';
import 'package:flutter_hidroponik/screen/menu_screen.dart';
import 'package:flutter_hidroponik/screen/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isSecurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1F4F8),
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
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
              const Text(
                'Please Login First!',
                style: TextStyle(
                  fontSize: 28.0,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 40)),
              Container(
                margin: const EdgeInsets.only(top: 20),
                width: 385,
                height: 310,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(190, 44, 44, 44),
                      blurRadius: 6,
                      offset: Offset(3, 12),
                    )
                  ],
                ),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 20),
                    ),
                    const Text(
                      'Login First!',
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 17, 99, 97),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 20, left: 30, right: 30),
                      child: TextField(
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 17, 99, 97),
                        ),
                        autofocus: false,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          contentPadding: EdgeInsets.all(1.0),
                          labelStyle: TextStyle(
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
                        style: const TextStyle(
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
                          labelStyle: const TextStyle(
                            fontSize: 18,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 17, 99, 97),
                          ),
                          suffixIcon: togglePassword(),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: SizedBox(
                        width: 133,
                        height: 31,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(3.0),
                            backgroundColor:
                                const Color.fromARGB(255, 16, 120, 118),
                            shape: const StadiumBorder(),
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomePage()),
                            );
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 220, top: 10),
                child: Column(
                  children: [
                    GestureDetector(
                      child: const Text(
                        'Lupa Password?',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(144, 255, 230, 1),
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const HomePage()));
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 70),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Register ',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                      GestureDetector(
                        child: const Text(
                          'Disini!',
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
                                      RegisterScreen()));
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Aktivasi akun mu ',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                      GestureDetector(
                        child: const Text(
                          'Disini!',
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
                                      const HomePage()));
                        },
                      ),
                    ],
                  ),
                ),
              ),
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
          ? const Icon(Icons.visibility)
          : const Icon(Icons.visibility_off),
      color: const Color.fromARGB(255, 28, 140, 97),
    );
  }
}
