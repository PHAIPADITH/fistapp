import 'package:flutter/material.dart';

class Listviewpage extends StatefulWidget {
  const Listviewpage({super.key});

  @override
  State<Listviewpage> createState() => _ListviewpageState();
}

class _ListviewpageState extends State<Listviewpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ການໃຊ້ Text Widget")),
      body: Center(child: Text("ListView")),
    );
  }
}
