import "package:flutter/material.dart";
import 'package:flutter_basic/modals/products.dart';
import 'package:flutter_basic/widgets/drawer.dart';
import 'package:flutter_basic/widgets/productCard.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int days = 10;
    final dummyList = List.generate(1, (index) => ProductsModal.products[0]);
    return Scaffold(
      appBar: AppBar(
        title: Text("Grantha", style: TextStyle(fontSize: 22)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
            itemCount: dummyList.length,
            itemBuilder: (context, index) {
              return ProductCardWidget(
                item: dummyList[index],
              );
            }),
      ),
      drawer: StyledDrawer(),
    );
  }
}
