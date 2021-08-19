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

final products = [
  Item(
      id: "1",
      name: "Bar Nature Valley",
      author: "Gasper MacGarrity",
      image: "http://dummyimage.com/243x100.png/ff4444/ffffff",
      description: "Mechanical entropion of right upper eyelid",
      price: "adw")
];
