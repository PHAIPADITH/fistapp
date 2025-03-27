import 'package:flutter/material.dart';

class Textpage extends StatefulWidget {
  const Textpage({super.key});

  @override
  State<Textpage> createState() => _TextpageState();
}

class _TextpageState extends State<Textpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ການໃຊ້ Text Widget")),
      body: Center(child: Text("Text")),
    );
  }
}
