import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: _BottomNavbar(),
        appBar: AppBar(title: Text("Cart")),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: _CartProductCard(),
        ),
      ),
    );
  }
}

class _CartProductCard extends StatefulWidget {
  const _CartProductCard({Key? key}) : super(key: key);

  @override
  __CartProductCardState createState() => __CartProductCardState();
}

class __CartProductCardState extends State<_CartProductCard> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: ListView.builder(
            itemCount: 10,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Row(children: [
                    Expanded(
                      child: SizedBox(
                          child: Card(
                        color: Colors.blueGrey[50],
                        borderOnForeground: true,
                        child: Padding(
                          padding: const EdgeInsets.all(0),
                          child: ListTile(
                              leading: Image.network(
                                  'https://i.picsum.photos/id/113/4168/2464.jpg?hmac=p1FqJDS9KHL70UWqUjlYPhJKBdiNOI_CIH0Qo-74_fU'),
                              title: Text("Product name"),
                              subtitle: Text("Rs : 1200"),
                              trailing: IconButton(
                                  icon: Icon(Icons.remove_circle),
                                  onPressed: () {})),
                        ),
                      )),
                    ),
                  ]),
                ],
              );
            }));
  }
}

class _BottomNavbar extends StatelessWidget {
  const _BottomNavbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.blueGrey[100],
      decoration: BoxDecoration(
        color: Colors.blueGrey[100],
        border: Border.all(color: Colors.teal),
        borderRadius: BorderRadius.vertical(
            top: Radius.elliptical(MediaQuery.of(context).size.width, 40.0)),
      ),
      child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 2, 16, 2),
          child: ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                Text(
                  "Rs : ${1000}",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.blueGrey[900],
                    fontWeight: FontWeight.w700,
                    fontFamily: GoogleFonts.merriweather().fontFamily,
                  ),
                ),
              ]),
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
                    "Buy Now",
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: GoogleFonts.actor().fontFamily,
                        color: Colors.teal[900],
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
