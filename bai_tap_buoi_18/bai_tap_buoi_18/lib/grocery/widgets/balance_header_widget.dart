import 'package:flutter/material.dart';

class BalanceHeaderWidget extends StatelessWidget {
  final String label;
  final String balance;
  final VoidCallback? onAvatarTap;

  const BalanceHeaderWidget({
    super.key,
    this.label = 'Your Balance',
    this.balance = r'$1,700.00',
    this.onAvatarTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade600,
                letterSpacing: 0.2,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              balance,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w800,
                color: Color(0xFF1E2833),
                letterSpacing: -0.5,
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: onAvatarTap,
          child: Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFF4C8055).withAlpha(38),
              border: Border.all(
                color: const Color(0xFF4C8055).withAlpha(77),
                width: 1.5,
              ),
            ),
            child: const Center(
              child: Icon(
                Icons.person_rounded,
                color: Color(0xFF4C8055),
                size: 26,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
