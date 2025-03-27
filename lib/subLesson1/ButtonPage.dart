import 'package:flutter/material.dart';

class Buttonpage extends StatefulWidget {
  const Buttonpage({super.key});

  @override
  State<Buttonpage> createState() => _ButtonpageState();
}

class _ButtonpageState extends State<Buttonpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ການໃຊ້ Text Widget")),
      body: Center(child: Text("Button")),
    );
  }
}
