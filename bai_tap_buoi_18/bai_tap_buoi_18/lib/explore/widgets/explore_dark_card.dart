import 'package:flutter/material.dart';
import 'image_placeholder_box.dart';

class ExploreDarkCard extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  const ExploreDarkCard({
    super.key,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(50),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Top Image Area
            ImagePlaceholderBox(
              height: 140,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              iconSize: 42,
              fontSize: 13,
            ),
            // Bottom White Area
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Text(
                title,
                style: const TextStyle(
                  color: Color(0xFF1E2833),
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
