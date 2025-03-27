import 'package:flutter/material.dart';

class Textfieldpage extends StatefulWidget {
  const Textfieldpage({super.key});

  @override
  State<Textfieldpage> createState() => _TextfieldpageState();
}

class _TextfieldpageState extends State<Textfieldpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ການໃຊ້ Text Widget")),
      body: Center(child: Text("TextField")),
    );
  }
}
