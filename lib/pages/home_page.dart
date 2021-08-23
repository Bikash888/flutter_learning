import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:flutter_basic/modals/products.dart';
import 'package:flutter_basic/widgets/drawer.dart';
import 'package:flutter_basic/widgets/productCard.dart';
import 'dart:convert';

import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    loadProductData();
  }

  loadProductData() async {
    await Future.delayed(Duration(seconds: 2));
    final productJson =
        await rootBundle.loadString("assets/files/product.json");
    final decodedProduct = jsonDecode(productJson);
    var productsInformation = decodedProduct["products"];
    ProductsModal.products = List.from(productsInformation)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    int days = 10;
    List<int> favoriteList = [];
    print(favoriteList);
    // final dummyList = List.generate(1, (index) => ProductsModal.products[0]);
    return Scaffold(
      appBar: AppBar(
        title: Text("Grantha", style: TextStyle(fontSize: 22)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (ProductsModal.products != null &&
                ProductsModal.products.isNotEmpty)
            ? Container(
                child: GridView.builder(
                    itemCount: ProductsModal.products.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: MediaQuery.of(context).size.width /
                            (MediaQuery.of(context).size.height / 1.2),
                        crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      final items = ProductsModal.products[index];
                      return SizedBox(
                        height: 50,
                        // width: 400,
                        child: Card(
                            semanticContainer: false,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.network(
                                    items.image,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Text(
                                      items.name,
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontFamily:
                                              GoogleFonts.poppins().fontFamily,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 0,
                                  ),
                                  Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(8, 0, 8, 8),
                                      child: Row(
                                        children: List.generate(
                                            int.parse(items.rating),
                                            (index) => Icon(Icons.star,
                                                color: Colors.yellow[900])),
                                      )),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(8, 0, 8, 8),
                                    child: Text("Author : ${items.author}"),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(8, 0, 8, 0),
                                    child: Text(
                                      items.description,
                                      style: TextStyle(color: Colors.black54),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  ButtonBar(
                                    alignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        // width: 200,
                                        child: ElevatedButton(
                                            style: ButtonStyle(),
                                            onPressed: () {},
                                            child: Text("Add to cart")),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          print(items.id);

                                          setState(() {
                                            favoriteList
                                                .add(int.parse(items.id));
                                          });
                                          print(favoriteList);
                                        },
                                        icon: Icon(
                                          Icons.favorite,
                                          color: favoriteList.contains(items.id)
                                              ? Colors.red[400]
                                              : Colors.black,
                                        ),
                                      )
                                    ],
                                  )
                                ])),
                      );
                    }),
              )
            : Center(
                child: CircularProgressIndicator(
                  color: Colors.teal[900],
                ),
              ),
      ),
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
