import 'package:flutter/material.dart';
import 'package:flutter_basic/services/auth_service.dart';
import 'package:flutter_basic/utils/route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = "";
  String password = "";
  bool loading = false;
  final _loginFormKey = GlobalKey<FormState>();

  routeToHome(BuildContext context) async {
    if (_loginFormKey.currentState!.validate()) {
      setState(() {
        loading = true;
      });
      await Navigator.pushNamed(context, GranthaRoutes.HomeRoute);
      setState(() {
        loading = false;
      });
    }
  }

  bool isValidEmail(String email) {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, child) {
      final _authService = watch(authServiceProvider);
      return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50),
              Image.asset("assets/images/login_image.jpg",
                  height: 190, fit: BoxFit.cover),
              SizedBox(
                height: 10,
              ),
              Text("Grantha",
                  style: TextStyle(
                    fontSize: 52,
                    fontWeight: FontWeight.w900,
                  )),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                child: Form(
                  key: _loginFormKey,
                  child: Column(
                    children: [
                      TextFormField(
                        onChanged: (value) {
                          email = value;
                          setState(() {});
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "This is mandatory";
                          } else if (!isValidEmail(value)) {
                            return "Invalid email";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            labelStyle: TextStyle(
                                color: Colors.black45,
                                fontSize: 22,
                                fontWeight: FontWeight.w600),
                            labelText: "Email address",
                            hintText: "Enter email address"),
                      ),
                      SizedBox(height: 25),
                      TextFormField(
                        onChanged: (value) {
                          password = value;
                          setState(() {});
                        },
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "This is mandatory";
                          } else if (value.length < 8) {
                            return "Minimum 8 characters is required";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            labelStyle: TextStyle(
                                color: Colors.black45,
                                fontSize: 22,
                                fontWeight: FontWeight.w600),
                            labelText: "Password",
                            hintText: "Enter password"),
                      ),
                      SizedBox(height: 25),
                      Material(
                        color: Colors.teal[400],
                        borderRadius: BorderRadius.circular(8),
                        child: InkWell(
                          onTap: () async {
                            if (_loginFormKey.currentState!.validate()) {
                              setState(() {
                                loading = true;
                              });

                              await _authService.signIn(email, password);
                              if (_authService.getCurrentUser() != null) {
                                await Navigator.pushNamed(
                                    context, GranthaRoutes.HomeRoute);
                              }

                              setState(() {
                                loading = false;
                              });
                            }
                          },
                          child: AnimatedContainer(
                              duration: Duration(seconds: 1),
                              width: loading ? 90 : 150,
                              height: 50,
                              alignment: Alignment.center,
                              child: loading
                                  ? Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8, horizontal: 2),
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                                    )
                                  : Text("Login",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22))),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
