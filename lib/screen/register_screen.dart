import 'package:flutter/material.dart';
import 'package:flutter_hidroponik/screen/login_screen.dart';

import '../page/home_page.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _isSecurePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                'Lets Register your Account!',
                style: TextStyle(
                  fontSize: 28.0,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                width: 385,
                height: 350,
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
                      'Register!',
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 17, 99, 97),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 17, left: 30, right: 30),
                      child: TextField(
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 17, 99, 97),
                        ),
                        autofocus: false,
                        decoration: InputDecoration(
                          labelText: 'Username',
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
                    const Padding(
                      padding: EdgeInsets.only(top: 15, left: 30, right: 30),
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
                      padding:
                          const EdgeInsets.only(top: 15, left: 30, right: 30),
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
                      padding: const EdgeInsets.only(top: 40),
                      child: SizedBox(
                        width: 133,
                        height: 31,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(3.0),
                            shape: const StadiumBorder(),
                            backgroundColor:
                                const Color.fromARGB(255, 16, 120, 118),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomePage()),
                            );
                          },
                          child: const Text(
                            'Register',
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
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Sudah punya akun? ',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                      GestureDetector(
                        child: const Text(
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
