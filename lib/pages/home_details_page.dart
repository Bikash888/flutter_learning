import 'package:flutter/material.dart';

import 'package:flutter_basic/models/products.dart';
import 'package:flutter_basic/widgets/feedback.dart';
import 'package:flutter_basic/widgets/reviewCard.dart';

import 'package:google_fonts/google_fonts.dart';

class ProductDetails extends StatefulWidget {
  final String product;
  const ProductDetails({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    final item = ProductsModal.getProductById(widget.product);
    return Container(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Rs ${item.price}",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.red[900],
                    fontWeight: FontWeight.w700,
                    fontFamily: GoogleFonts.merriweather().fontFamily,
                  ),
                ),
                SizedBox(
                  // width: 200,
                  child: OutlinedButton(
                    autofocus: true,
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0))),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Add to cart",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: GoogleFonts.actor().fontFamily,
                          color: Colors.teal[900],
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(tag: Key(item.id), child: Image.network(item.image)),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    item.name,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.roboto().fontFamily,
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                    child: Row(
                      children: List.generate(
                          int.parse(item.rating),
                          (index) =>
                              Icon(Icons.star, color: Colors.yellow[900])),
                    )),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                  child: Text(
                    "Author : ${item.author}",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: Text(
                    item.description,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: GoogleFonts.roboto().fontFamily,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(width: 2, color: Colors.blueGrey))),
                    child: Text(
                      "Reviews",
                      style: TextStyle(
                        fontSize: 22,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                      ),
                    ),
                  ),
                ),
                Row(children: [
                  Expanded(
                    child: SizedBox(child: ReviewCard()),
                  ),
                ]),
                FeedbackForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
