import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/MyHomePage.dart';

class Signup extends StatefulWidget {
  const Signup({super.key, required String title});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  bool hiddenPassword = true;
  bool hiddenConfirm = true;
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onCloseDialog() {
    _controller.forward().then((_) {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 1000),
          pageBuilder: (_, __, ___) => MyHomePage(title: 'Shopping App'),
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          tr("SignUp_page"),
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/imagebackgroung.jfif'),
                fit: BoxFit.fill)),
        child: FadeTransition(
          opacity: _animation,
          child: Center(
            child: Form(
                key: _formKey,
                child: ListView(shrinkWrap: true, children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        controller: nameController,
                        validator: (value) {
                          if (value != null && value!.isEmpty) {
                            return tr("Enter_Name");
                          } else if (!isFirstCapital(value!)) {
                            return tr("First_Letter");
                          }
                        },
                        decoration: InputDecoration(
                          labelText: tr("Full_Name"),
                          border: OutlineInputBorder(),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        controller: emailController,
                        validator: (value) {
                          if (value != null && value!.isEmpty) {
                            return tr("Enter_Email");
                          } else if (!value!.contains('@gmail.com')) {
                            return tr("Email_extension");
                          }
                        },
                        decoration: InputDecoration(
                          labelText: tr("Email"),
                          border: OutlineInputBorder(),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        controller: passwordController,
                        validator: (value) {
                          if (value != null && value!.isEmpty) {
                            return tr("Enter_Password");
                          } else if (value!.length < 6) {
                            return tr("Password_character");
                          }
                        },
                        obscureText: hiddenPassword,
                        decoration: InputDecoration(
                            labelText: tr("Password"),
                            border: OutlineInputBorder(),
                            suffixIcon: IconButton(
                              onPressed: () {
                                togglePassword();
                              },
                              icon: Icon(hiddenPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                            ))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        controller: confirmPasswordController,
                        validator: (value) {
                          if (value != null && value!.isEmpty) {
                            return tr("Enter_Confirm_Password");
                          } else if (!isEqual(
                              value!, passwordController.text)) {
                            return tr("Pass_match");
                          }
                        },
                        obscureText: hiddenConfirm,
                        decoration: InputDecoration(
                            labelText: tr("Confirm_Password"),
                            border: OutlineInputBorder(),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  toggleConfirm();
                                },
                                icon: Icon(hiddenConfirm
                                    ? Icons.visibility
                                    : Icons.visibility_off)))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            myDialog();

                            debugPrint("You are logged");
                            debugPrint(nameController.text);
                            debugPrint(emailController.text);
                            debugPrint(passwordController.text);
                            debugPrint(confirmPasswordController.text);
                          }
                        },
                        child: Text(
                          tr("Sign_Up"),
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
                ])),
          ),
        ),
      ),
    );
  }

  togglePassword() {
    hiddenPassword = !hiddenPassword;
    setState(
      () {},
    );
  }

  toggleConfirm() {
    hiddenConfirm = !hiddenConfirm;
    setState(
      () {},
    );
  }

  bool isFirstCapital(String name) {
    String firstChar = name[0];
    return firstChar == firstChar.toUpperCase();
  }

  bool isEqual(String pass, String confirmPass) {
    return pass == confirmPass;
  }

  Future<void> myDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            tr("Hello"),
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          content: Text(tr("Message"),
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          actions: <Widget>[
            TextButton(
              child: Text(tr("OK"),
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              onPressed: () {
                _onCloseDialog();
              },
            ),
          ],
        );
      },
    );
  }
}
