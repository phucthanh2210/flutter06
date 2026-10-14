import 'package:flutter/material.dart';
import '../models/explore_category.dart';
import '../models/best_seller_product.dart';
import '../widgets/image_placeholder_box.dart';
import '../widgets/explore_search_field.dart';
import '../widgets/explore_category_icon_button.dart';
import '../widgets/explore_best_seller_card.dart';

class ExploreHomeScreen extends StatefulWidget {
  const ExploreHomeScreen({super.key});

  @override
  State<ExploreHomeScreen> createState() => _ExploreHomeScreenState();
}

class _ExploreHomeScreenState extends State<ExploreHomeScreen> {
  final List<ExploreCategory> _categories = const [
    ExploreCategory(title: 'Music', icon: Icons.music_note_outlined),
    ExploreCategory(title: 'Property', icon: Icons.apartment_outlined),
    ExploreCategory(title: 'Game', icon: Icons.sports_esports_outlined),
    ExploreCategory(title: 'Gadget', icon: Icons.phone_android_outlined),
    ExploreCategory(title: 'Electronic', icon: Icons.laptop_outlined),
    ExploreCategory(title: 'Property', icon: Icons.percent_outlined),
    ExploreCategory(title: 'Game', icon: Icons.videogame_asset_outlined),
    ExploreCategory(title: 'Book', icon: Icons.menu_book_outlined),
  ];

  final List<BestSellerProduct> _bestSellers = const [
    BestSellerProduct(title: 'Plant', rating: 5.0),
    BestSellerProduct(title: 'Lamp', rating: 5.0),
    BestSellerProduct(title: 'Chair', rating: 5.0),
  ];

  final int _currentBannerIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: Navigator.canPop(context)
            ? IconButton(
                icon: const Icon(Icons.arrow_back, color: Color(0xFF1E2833)),
                onPressed: () => Navigator.pop(context),
              )
            : null,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Welcome back,',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey.shade500,
                  ),
                ),
                const SizedBox(height: 2),
                const Text(
                  'Samantha William',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF1E2833),
                  ),
                ),
              ],
            ),
            IconButton(
              icon: Stack(
                clipBehavior: Clip.none,
                children: [
                  Icon(
                    Icons.notifications_none_outlined,
                    color: Colors.grey.shade700,
                    size: 26,
                  ),
                  Positioned(
                    top: 1,
                    right: 2,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFE87A38),
                      ),
                    ),
                  ),
                ],
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              ExploreSearchField(
                onFilterTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Filter tapped'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                },
              ),

              const SizedBox(height: 18),

              // Banner Box
              const ImagePlaceholderBox(
                height: 140,
                borderRadius: BorderRadius.all(Radius.circular(16)),
                iconSize: 40,
                fontSize: 12,
              ),

              const SizedBox(height: 10),

              // Dots indicator
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  4,
                  (index) => Container(
                    width: index == _currentBannerIndex ? 16 : 6,
                    height: 6,
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    decoration: BoxDecoration(
                      color: index == _currentBannerIndex
                          ? const Color(0xFFE87A38)
                          : Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 22),

              // Categories Grid (4 columns x 2 rows)
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 14,
                  childAspectRatio: 0.85,
                ),
                itemCount: _categories.length,
                itemBuilder: (context, index) {
                  final cat = _categories[index];
                  return ExploreCategoryIconButton(
                    category: cat,
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Selected category: ${cat.title}'),
                          duration: const Duration(seconds: 1),
                        ),
                      );
                    },
                  );
                },
              ),

              const SizedBox(height: 24),

              // Best Seller Section Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Best Seller',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF1E2833),
                      letterSpacing: -0.3,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: const Text(
                      'See All',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFE87A38),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 14),

              // Best Seller Horizontal List
              SizedBox(
                height: 155,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _bestSellers.length,
                  itemBuilder: (context, index) {
                    final product = _bestSellers[index];
                    return ExploreBestSellerCard(
                      product: product,
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Product: ${product.title}'),
                            duration: const Duration(seconds: 1),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
