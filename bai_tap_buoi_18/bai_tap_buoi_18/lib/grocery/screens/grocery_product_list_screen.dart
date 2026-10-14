import 'package:flutter/material.dart';
import '../models/product_item.dart';
import '../widgets/grocery_product_tile.dart';

class GroceryProductListScreen extends StatefulWidget {
  final String categoryTitle;

  const GroceryProductListScreen({
    super.key,
    this.categoryTitle = 'Fruit',
  });

  @override
  State<GroceryProductListScreen> createState() => _GroceryProductListScreenState();
}

class _GroceryProductListScreenState extends State<GroceryProductListScreen> {
  late List<ProductItem> _products;

  @override
  void initState() {
    super.initState();
    _products = [
      const ProductItem(id: '1', name: 'Orange', stock: 1000, price: 15),
      const ProductItem(id: '2', name: 'Apple', stock: 1000, price: 20),
      const ProductItem(id: '3', name: 'Banana', stock: 1000, price: 5),
      const ProductItem(id: '4', name: 'Mango', stock: 1000, price: 15),
      const ProductItem(id: '5', name: 'Orange', stock: 1000, price: 10),
    ];
  }

  void _toggleFavorite(int index) {
    setState(() {
      _products[index] = _products[index].copyWith(
        isFavorite: !_products[index].isFavorite,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBFBFB),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1E2833)),
          onPressed: () => Navigator.maybePop(context),
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
          itemCount: _products.length,
          itemBuilder: (context, index) {
            final product = _products[index];
            return GroceryProductTile(
              product: product,
              onFavoriteToggle: () => _toggleFavorite(index),
            );
          },
        ),
      ),
    );
  }
}
