class ProductItem {
  final String id;
  final String name;
  final int stock;
  final double price;
  final bool isFavorite;

  const ProductItem({
    required this.id,
    required this.name,
    required this.stock,
    required this.price,
    this.isFavorite = false,
  });

  ProductItem copyWith({
    String? id,
    String? name,
    int? stock,
    double? price,
    bool? isFavorite,
  }) {
    return ProductItem(
      id: id ?? this.id,
      name: name ?? this.name,
      stock: stock ?? this.stock,
      price: price ?? this.price,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
