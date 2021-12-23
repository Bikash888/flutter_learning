import 'package:flutter_basic/models/products.dart';

class CartModal {
  late ProductsModal _products;
  //collection of id stores product information
  List<String> _productsList = [];
  ProductsModal get product => _products;
  set products(ProductsModal prodcut) {
    _products = product;
  }
}
