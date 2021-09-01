import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic/pages/cart_page.dart';
import 'package:flutter_basic/pages/home_page.dart';
import 'package:flutter_basic/pages/login_page.dart';
import 'package:flutter_basic/utils/route.dart';
import 'package:flutter_basic/widgets/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      themeMode: ThemeMode.light,
      theme: GranthaTheme.themeData,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      initialRoute: GranthaRoutes.LoginRoute,
      routes: {
        GranthaRoutes.HomeRoute: (context) => Home(),
        GranthaRoutes.CartRoute: (context) => CartPage(),
      },
    );
  }
}
