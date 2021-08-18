import 'package:flutter/material.dart';
import 'package:flutter_basic/utils/route.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = '';
  bool loading = false;
  @override
  Widget build(BuildContext context) {
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
            Text("Grantha $name",
                style: TextStyle(
                  fontSize: 52,
                  fontWeight: FontWeight.w900,
                )),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: Column(
                children: [
                  TextFormField(
                    onChanged: (value) {
                      name = value;
                      setState(() {});
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
                    obscureText: true,
                    decoration: InputDecoration(
                        labelStyle: TextStyle(
                            color: Colors.black45,
                            fontSize: 22,
                            fontWeight: FontWeight.w600),
                        labelText: "Password",
                        hintText: "Enter password"),
                  ),
                  SizedBox(height: 25),
                  InkWell(
                    onTap: () => {
                      // Navigator.pushNamed(context, GranthaRoutes.HomeRoute)
                      setState(() {
                        loading = true;
                      })
                    },
                    child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        width: loading ? 80 : 150,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.teal[400],
                          borderRadius: BorderRadius.circular(8),
                        ),
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
                  )
                  // ElevatedButton(
                  //   onPressed: () =>
                  //       {Navigator.pushNamed(context, GranthaRoutes.HomeRoute)},
                  //   style: TextButton.styleFrom(
                  //       backgroundColor: Colors.teal[400],
                  //       minimumSize: Size(150, 40)),
                  //   child: Text("Login",
                  //       style: TextStyle(
                  //           fontWeight: FontWeight.w500, fontSize: 22)),
                  // )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
