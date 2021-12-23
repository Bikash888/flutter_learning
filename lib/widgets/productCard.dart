import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_basic/models/products.dart';
import 'package:flutter_basic/pages/home_details_page.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductCardWidget extends StatefulWidget {
  @override
  _ProductCardWidgetState createState() => _ProductCardWidgetState();
}

class _ProductCardWidgetState extends State<ProductCardWidget> {
  List<int> favoriteList = [];
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
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: (ProductsModal.products != null &&
              ProductsModal.products.isNotEmpty)
          ? Container(
              child: GridView.builder(
                  itemCount: ProductsModal.products.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: MediaQuery.of(context).size.width /
                          (MediaQuery.of(context).size.height - 60 / 1),
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    final items = ProductsModal.products[index];
                    return SizedBox(
                      height: 80,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ProductDetails(product: items.id)));
                        },
                        child: Card(
                            semanticContainer: false,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Hero(
                                    tag: Key(items.id),
                                    child: Image.network(
                                      items.image,
                                    ),
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
                                      items.summary,
                                      style: TextStyle(color: Colors.black54),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ButtonBar(
                                      buttonPadding: EdgeInsets.zero,
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
                                              if (favoriteList.contains(
                                                  int.parse(items.id))) {
                                                print("contains");
                                                favoriteList.remove(
                                                    int.parse(items.id));
                                                return;
                                              } else {
                                                favoriteList
                                                    .add(int.parse(items.id));
                                              }
                                            });
                                            print(favoriteList);
                                          },
                                          icon: Icon(
                                            Icons.favorite,
                                            color: favoriteList.contains(
                                                    int.parse(items.id))
                                                ? Colors.red[400]
                                                : Colors.black,
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ])),
                      ),
                    );
                  }),
            )
          : Center(
              child: CircularProgressIndicator(
                color: Colors.teal[900],
              ),
            ),
    );
  }
}
