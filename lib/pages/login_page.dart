import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(height: 50),
          Image.asset("assets/images/login_image.jpg", fit: BoxFit.cover),
          SizedBox(
              height: 15,
              child: Center(
                  child:
                      Text("Welcome to", style: TextStyle(color: Colors.red)))),
          Text("Grantha",
              style: TextStyle(
                fontSize: 52,
                fontWeight: FontWeight.w900,
              )),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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
                  onPressed: () => {print("Hello login ")},
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.teal[400],
                  ),
                  child: Text("Login",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 22)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
