import 'package:flutter/material.dart';
import 'package:my_project/Subchapter1.dart';

class MenuDrawer extends StatefulWidget {
  const MenuDrawer({super.key});

  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  void _navigateTo(BuildContext context, Widget page) {
    Navigator.pop(context); // ปิด Drawer ก่อน
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text("PHAIAPDITH SOUKHATHAMMAVONG"),
            accountEmail: const Text("020 56139848"),
            currentAccountPicture: const CircleAvatar(
              backgroundImage: AssetImage("images/image.png"),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.book),
            title: const Text("ບົດທີ1"),
            onTap: () => _navigateTo(context, const Subchapter1()),
          ),
          ListTile(
            leading: const Icon(Icons.book),
            title: const Text("ບົດທີ2"),
            onTap: () => Navigator.pop(context), // แก้เป็นหน้าที่ต้องการ
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Home"),
            onTap: () => Navigator.pop(context), // แค่ปิด Drawer
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Settings"),
            onTap: () => Navigator.pop(context), // แค่ปิด Drawer
          ),
        ],
      ),
    );
  }
}
