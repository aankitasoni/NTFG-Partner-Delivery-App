import 'package:mobile/screens/profile_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int currentTabIndex = 0;

  late List<Widget> pages;
  late HomeScreen homepage;
  late ProfileScreen profile;

  @override
  void initState() {
    super.initState();

    homepage = HomeScreen();
    profile = ProfileScreen();

    // ✅ Initialize pages here
    pages = [
      homepage,
      const Center(child: Text("ChatBot Screen for order help")), // Placeholder
      const Center(
        child: Text("Wallet Screen to checkout products"),
      ), // Placeholder
      profile,
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 50,
        backgroundColor: Colors.white,
        color: Colors.black,
        animationDuration: const Duration(milliseconds: 500),
        onTap: (int index) {
          setState(() {
            currentTabIndex = index;
          });
        },
        items: const [
          Icon(Icons.home_outlined, color: Colors.white),
          Icon(Icons.chat_bubble_outline_outlined, color: Colors.white),
          Icon(Icons.wallet_outlined, color: Colors.white),
          Icon(Icons.person_outline, color: Colors.white),
        ],
      ),
      body: pages[currentTabIndex],
    );
  }
}
