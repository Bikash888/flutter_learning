import 'package:flutter/material.dart';

import 'package:flutter_basic/modals/products.dart';
import 'package:flutter_basic/widgets/feedback.dart';
import 'package:flutter_basic/widgets/reviewCard.dart';

import 'package:google_fonts/google_fonts.dart';

class ProductDetails extends StatefulWidget {
  final Item product;
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
    return Container(
      // height: 600,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            toolbarHeight: 40,
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                    tag: Key(widget.product.id),
                    child: Image.network(widget.product.image)),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    widget.product.name,
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
                          int.parse(widget.product.rating),
                          (index) =>
                              Icon(Icons.star, color: Colors.yellow[900])),
                    )),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                  child: Text(
                    "Author : ${widget.product.author}",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                  child: Text(
                    "Price : Rs ${widget.product.price}",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      fontFamily: GoogleFonts.merriweather().fontFamily,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: Text(
                    widget.product.description,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: GoogleFonts.roboto().fontFamily,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: ButtonBar(
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
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite,
                        ),
                      )
                    ],
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
