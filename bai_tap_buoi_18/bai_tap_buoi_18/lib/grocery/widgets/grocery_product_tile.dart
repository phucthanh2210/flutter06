import 'package:flutter/material.dart';
import '../models/product_item.dart';

class GroceryProductTile extends StatelessWidget {
  final ProductItem product;
  final VoidCallback? onFavoriteToggle;
  final VoidCallback? onTap;

  const GroceryProductTile({
    super.key,
    required this.product,
    this.onFavoriteToggle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade100, width: 1.2),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(8),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            // Green thumbnail container matching slide 2
            Container(
              width: 68,
              height: 68,
              decoration: BoxDecoration(
                color: const Color(0xFF65985A),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Text(
                  _getProductEmoji(product.name),
                  style: const TextStyle(fontSize: 30),
                ),
              ),
            ),
            const SizedBox(width: 16),
            // Product info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1E2833),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${product.stock} ready stock',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey.shade500,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '\$${product.price.toStringAsFixed(0)}',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1E2833),
                    ),
                  ),
                ],
              ),
            ),
            // Favorite icon
            IconButton(
              onPressed: onFavoriteToggle,
              icon: Icon(
                product.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: product.isFavorite ? Colors.redAccent : Colors.grey.shade400,
                size: 22,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getProductEmoji(String name) {
    final lower = name.toLowerCase();
    if (lower.contains('orange')) return '🍊';
    if (lower.contains('apple')) return '🍎';
    if (lower.contains('banana')) return '🍌';
    if (lower.contains('mango')) return '🥭';
    return '🥬';
  }
}
