import 'package:flutter/material.dart';
import 'package:flutter_basic/utils/route.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50),
            Image.asset("assets/images/login_image.jpg",
                height: 280, fit: BoxFit.cover),
            SizedBox(
              height: 10,
            ),
            Text("Grantha",
                style: TextStyle(
                  fontSize: 52,
                  fontWeight: FontWeight.w900,
                )),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        labelStyle: TextStyle(
                            color: Colors.black45,
                            fontSize: 22,
                            fontWeight: FontWeight.w600),
                        labelText: "Email address",
                        hintText: "Enter email address"),
                  ),
                  SizedBox(height: 18),
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
                  SizedBox(height: 18),
                  ElevatedButton(
                    onPressed: () =>
                        {Navigator.pushNamed(context, GranthaRoutes.HomeRoute)},
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.teal[400],
                        minimumSize: Size(150, 40)),
                    child: Text("Login",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 22)),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
