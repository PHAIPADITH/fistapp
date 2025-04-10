import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      type: BottomNavigationBarType.fixed, // ป้องกันการขยับของไอคอน
      backgroundColor: Colors.red,
      selectedItemColor: Colors.white, // สีของไอคอนที่ถูกเลือก
      unselectedItemColor: Colors.white70, // สีของไอคอนที่ไม่ได้เลือก
      selectedFontSize: 14, // ขนาดตัวอักษรเมื่อถูกเลือก
      unselectedFontSize: 12, // ขนาดตัวอักษรเมื่อไม่ได้เลือก
      iconSize: 30, // ขนาดไอคอน
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        BottomNavigationBarItem(
          icon: Icon(Icons.room_service),
          label: 'Service',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Login'),
      ],
    );
  }
}
