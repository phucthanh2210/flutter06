import 'package:flutter/material.dart';
import 'explore_home_screen.dart';
import 'explore_dark_screen.dart';

class ExploreMainScreen extends StatefulWidget {
  final int initialIndex;

  const ExploreMainScreen({super.key, this.initialIndex = 0});

  @override
  State<ExploreMainScreen> createState() => _ExploreMainScreenState();
}

class _ExploreMainScreenState extends State<ExploreMainScreen> {
  late int _currentIndex;

  final List<Widget> _screens = const [
    ExploreHomeScreen(),
    ExploreDarkScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: const Color(0xFFE87A38),
        unselectedItemColor: Colors.grey,
        backgroundColor: _currentIndex == 1 ? const Color(0xFF142A36) : Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_rounded),
            label: 'Explore',
          ),
        ],
      ),
    );
  }
}
