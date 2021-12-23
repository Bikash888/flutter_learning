class ProductsModal {
  static List<Item> products = [];
  static getProductById(String id) =>
      products.firstWhere((element) => element.id == id);
}

class Item {
  final String id;
  final String name;
  final String author;
  final String price;
  final String description;
  final String image;
  final String rating;
  final String summary;

  Item(
      {required this.id,
      required this.name,
      required this.author,
      required this.price,
      required this.description,
      required this.summary,
      required this.image,
      required this.rating});

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
        id: map['id'],
        name: map['name'],
        author: map['author'],
        price: map['price'],
        description: map['description'],
        rating: map['rating'],
        image: map['image'],
        summary: map['summary']);
  }
  toMap() => {
        "id": id,
        "name": name,
        "author": author,
        "price": price,
        "description": description,
        'image': image,
        "rating": rating,
        "summary": summary,
      };
}
