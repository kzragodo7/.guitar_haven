class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final List<String> images;
  final List<String> availableColors;
  final List<String> availableSizes;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.images,
    required this.availableColors,
    required this.availableSizes,
  });
}
