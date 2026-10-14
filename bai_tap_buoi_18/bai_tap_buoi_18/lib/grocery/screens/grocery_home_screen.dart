import 'package:flutter/material.dart';
import '../models/category_item.dart';
import '../widgets/balance_header_widget.dart';
import '../widgets/promo_banner_widget.dart';
import '../widgets/grocery_category_card.dart';
import 'grocery_product_list_screen.dart';

class GroceryHomeScreen extends StatelessWidget {
  const GroceryHomeScreen({super.key});

  final List<CategoryItem> categories = const [
    CategoryItem(title: 'Fruit', emoji: '🍊'),
    CategoryItem(title: 'Vegetable', emoji: '🥦'),
    CategoryItem(title: 'Cookies', emoji: '🍪'),
    CategoryItem(title: 'Meat', emoji: '🥩'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBFBFB),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Balance Header
              const BalanceHeaderWidget(),

              const SizedBox(height: 24),

              // Banner
              PromoBannerWidget(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GroceryProductListScreen(
                        categoryTitle: 'Special Offers',
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 28),

              // For you Section Title
              const Text(
                'For you',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF1E2833),
                  letterSpacing: -0.2,
                ),
              ),

              const SizedBox(height: 16),

              // 2x2 Categories Grid
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.05,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final cat = categories[index];
                  return GroceryCategoryCard(
                    item: cat,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GroceryProductListScreen(
                            categoryTitle: cat.title,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
