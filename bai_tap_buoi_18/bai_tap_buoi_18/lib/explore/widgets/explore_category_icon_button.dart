import 'package:flutter/material.dart';
import '../models/explore_category.dart';

class ExploreCategoryIconButton extends StatelessWidget {
  final ExploreCategory category;
  final VoidCallback? onTap;

  const ExploreCategoryIconButton({
    super.key,
    required this.category,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFFF0F5F9),
              border: Border.all(
                color: const Color(0xFFE2ECF2),
                width: 1.2,
              ),
            ),
            child: Center(
              child: Icon(
                category.icon,
                color: const Color(0xFF5A9BBF),
                size: 24,
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            category.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xFF4A5568),
            ),
          ),
        ],
      ),
    );
  }
}
