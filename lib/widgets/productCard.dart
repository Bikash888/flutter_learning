import 'package:flutter/material.dart';
import 'package:flutter_basic/modals/products.dart';

class ProductCardWidget extends StatelessWidget {
  final Item item;

  const ProductCardWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
          child: ListTile(
            leading: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: 88,
                minHeight: 180,
                maxWidth: 88,
                maxHeight: 200,
              ),
              child: Image.network(
                item.image,
                fit: BoxFit.fill,
              ),
            ),
            title: Text(item.name,
                style: TextStyle(
                    color: Colors.blue[900], fontWeight: FontWeight.bold)),
            subtitle: Text(
              item.description,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
            ),
            trailing: Text("\$ ${item.price}",
                textScaleFactor: 1.3,
                style: TextStyle(fontSize: 18, color: Colors.purple[900])),
          ),
        ),
      ),
    );
  }
}
