import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic/pages/cart_page.dart';
import 'package:flutter_basic/pages/home_page.dart';
import 'package:flutter_basic/pages/login_page.dart';
import 'package:flutter_basic/services/general_providers.dart';
import 'package:flutter_basic/utils/route.dart';
import 'package:flutter_basic/widgets/themes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AuthValidator(),
      themeMode: ThemeMode.light,
      theme: GranthaTheme.themeData,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      routes: {
        GranthaRoutes.HomeRoute: (context) => Home(),
        GranthaRoutes.CartRoute: (context) => CartPage(),
      },
    );
  }
}

class AuthValidator extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watchReader) {
    final _authState = watchReader(authStateProvider);
    return _authState.when(data: (value) {
      if (value != null) {
        return Home();
      }
      return LoginPage();
    }, loading: () {
      return Scaffold(
          body: Center(
        child: CircularProgressIndicator(
          color: Colors.blue,
        ),
      ));
    }, error: (_, __) {
      return Scaffold(
          body: Center(child: Text("Something went wrong ,Try again")));
    });
  }
}
