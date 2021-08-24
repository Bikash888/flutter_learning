import "package:flutter/material.dart";

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
      appBar: AppBar(
        title: Text("Grantha", style: TextStyle(fontSize: 22)),
      ),
      body: ProductCardWidget(),
      drawer: StyledDrawer(),
    );
  }
}

// Padding(
//   padding: const EdgeInsets.all(0.0),
//   child: GridView.builder(
//     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//       crossAxisCount: 2,
//       mainAxisSpacing: 16,
//       crossAxisSpacing: 16,
//     ),
//     itemBuilder: (context, index) {
//       final items = ProductsModal.products[index];
//       return Container(
//         padding: EdgeInsets.zero,
//         child: Card(
//             clipBehavior: Clip.antiAlias,
//             child: Image.network(items.image)),
//       );
//     },
//     itemCount: ProductsModal.products.length,
//   ),
// )

class Rating extends StatelessWidget {
  const Rating({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
