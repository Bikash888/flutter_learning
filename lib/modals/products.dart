class ProductsModal {
  static List<Item> products = [];
}

class Item {
  final String id;
  final String name;
  final String author;
  final String price;
  final String description;
  final String image;
  final String rating;

  Item(
      {required this.id,
      required this.name,
      required this.author,
      required this.price,
      required this.description,
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
        image: map['image']);
  }
  toMap() => {
        "id": id,
        "name": name,
        "author": author,
        "price": price,
        "description": description,
        'image': image,
        "rating": rating,
      };
}
