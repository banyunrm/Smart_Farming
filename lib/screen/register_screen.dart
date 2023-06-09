import 'package:flutter/material.dart';
import 'package:flutter_hidroponik/screen/login_screen.dart';
import 'package:flutter_hidroponik/controllers/user.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _isSecurePassword = true;
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 17, left: 30, right: 30),
                      child: TextField(
                        controller: _usernameController,
                        style: const TextStyle(
                          fontSize: 18,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 17, 99, 97),
                        ),
                        autofocus: false,
                        decoration: const InputDecoration(
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
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 15, left: 30, right: 30),
                      child: TextField(
                        controller: _emailController,
                        style: const TextStyle(
                          fontSize: 18,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 17, 99, 97),
                        ),
                        autofocus: false,
                        decoration: const InputDecoration(
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
                        controller: _passwordController,
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
                          contentPadding: const EdgeInsets.all(1.0),
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
                          onPressed: () async {
                            FocusScope.of(context).unfocus();
                            if (_usernameController.text.isEmpty ||
                                _emailController.text.isEmpty ||
                                _passwordController.text.isEmpty) {
                              errorDialog(context, 'Harap isi semua field');
                            } else {
                              final res = await User.register(
                                  _usernameController.text,
                                  _emailController.text,
                                  _passwordController.text);

                              if (res != null && context.mounted) {
                                if (res.containsKey('error')) {
                                  errorDialog(context, res['error']);
                                } else {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginScreen()));
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content:
                                              Text('Registrasi Berhasil')));
                                }
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'Registrasi Gagal!',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400,
                                        color: Color.fromARGB(255, 17, 99, 97),
                                      ),
                                    ),
                                  ),
                                );
                              }
                            }
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
                                      const LoginScreen()));
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

Future<void> errorDialog(context, String message) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}
