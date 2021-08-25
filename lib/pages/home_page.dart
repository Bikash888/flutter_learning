import 'package:badges/badges.dart';
import "package:flutter/material.dart";
import 'package:flutter_basic/utils/route.dart';

import 'package:flutter_basic/widgets/drawer.dart';
import 'package:flutter_basic/widgets/productCard.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    int days = 10;

    // final dummyList = List.generate(1, (index) => ProductsModal.products[0]);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, GranthaRoutes.CartRoute);
        },
        child: Badge(
            badgeContent: Text("3",
                style: TextStyle(
                    color: Colors.brown, fontWeight: FontWeight.w400)),
            badgeColor: Colors.white,
            child: Icon(Icons.shopping_cart_outlined)),
      ),
      appBar: AppBar(
        title: Text("Grantha", style: TextStyle(fontSize: 22)),
      ),
      body: ProductCardWidget(),
      drawer: StyledDrawer(),
    );
  }
}

class Rating extends StatelessWidget {
  const Rating({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
