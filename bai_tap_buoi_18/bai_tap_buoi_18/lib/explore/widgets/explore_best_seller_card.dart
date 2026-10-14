import 'package:flutter/material.dart';
import '../models/best_seller_product.dart';
import 'image_placeholder_box.dart';

class ExploreBestSellerCard extends StatelessWidget {
  final BestSellerProduct product;
  final VoidCallback? onTap;

  const ExploreBestSellerCard({
    super.key,
    required this.product,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 104,
        margin: const EdgeInsets.only(right: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ImagePlaceholderBox(
              width: 104,
              height: 100,
              borderRadius: BorderRadius.circular(12),
              iconSize: 32,
              fontSize: 10,
            ),
            const SizedBox(height: 6),
            Text(
              product.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1E2833),
              ),
            ),
            const SizedBox(height: 3),
            Row(
              children: [
                ...List.generate(
                  5,
                  (index) => const Icon(
                    Icons.star,
                    color: Color(0xFFFFB800),
                    size: 11,
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  product.rating.toStringAsFixed(1),
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
