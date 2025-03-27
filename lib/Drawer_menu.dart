import 'package:flutter/material.dart';
import 'package:my_project/MenuDrawer.dart';

class Drawer_menu extends StatefulWidget {
  const Drawer_menu({super.key});

  @override
  State<Drawer_menu> createState() => _Drawer_menuState();
}

class _Drawer_menuState extends State<Drawer_menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ບົດຮຽນພັດທະນາແອັບດ້ວຍ Flutter 1")),

      drawer: MenuDrawer(),
    );
  }
}
