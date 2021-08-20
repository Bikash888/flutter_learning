class ProductsModal {
  static final products = [
    Item(
        id: "1",
        name: "Bar Nature Valley",
        author: "Gasper MacGarrity",
        image:
            "https://i.picsum.photos/id/0/5616/3744.jpg?hmac=3GAAioiQziMGEtLbfrdbcoenXoWAW-zlyEAMkfEdBzQ",
        description: "Mechanical entropion of right upper eyelid",
        price: "1200")
  ];
}

class Item {
  final String id;
  final String name;
  final String author;
  final String price;
  final String description;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.author,
      required this.price,
      required this.description,
      required this.image});
}
