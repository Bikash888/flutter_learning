import 'package:carousel_slider/carousel_slider.dart';
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
  final List<String> images = [
    'https://images.unsplash.com/photo-1586882829491-b81178aa622e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80',
    'https://images.unsplash.com/photo-1586871608370-4adee64d1794?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2862&q=80',
    'https://images.unsplash.com/photo-1586901533048-0e856dff2c0d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
    'https://images.unsplash.com/photo-1586902279476-3244d8d18285?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80',
    'https://images.unsplash.com/photo-1586943101559-4cdcf86a6f87?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1556&q=80',
    'https://images.unsplash.com/photo-1586951144438-26d4e072b891?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
    'https://images.unsplash.com/photo-1586953983027-d7508a64f4bb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
  ];

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
                Container(
                    child: CarouselSlider.builder(
                        itemCount: images.length,
                        itemBuilder: (context, index, realIDx) {
                          return Container(
                              child: Image.network(images[index],
                                  fit: BoxFit.cover));
                        },
                        options: CarouselOptions(
                            autoPlay: true,
                            aspectRatio: 2,
                            enlargeCenterPage: false))),
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
