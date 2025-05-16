import 'package:flutter/material.dart';
import 'home/home_screen.dart';
import 'bag/cart_screen.dart';
import 'profile/profile_screen.dart';
import '../../utils/constants.dart';

class NavigatorScreen extends StatefulWidget {
  final int selectedIndex;

  const NavigatorScreen({Key? key, this.selectedIndex = 0}) : super(key: key);

  @override
  _NavigatorScreenState createState() => _NavigatorScreenState();
}

class _NavigatorScreenState extends State<NavigatorScreen> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.selectedIndex;
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _screens = [HomeScreen(), CartScreen(), ProfileScreen()];

    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        selectedItemColor: AppConstantsColor.darkBrown, // Selected icon color
        unselectedItemColor: AppConstantsColor.darkBrown.withOpacity(
          0.5,
        ), 
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
