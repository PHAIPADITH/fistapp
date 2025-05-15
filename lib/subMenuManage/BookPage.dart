import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

List data = [];

class BookPage extends StatefulWidget {
  const BookPage({super.key});

  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  final String url = "localhost:3000/book/350000";

  Future<void> fetchAllData() async {
    final respones = await http.get(Uri.parse(url));
    if (respones.statusCode == 200) {
      setState(() {
        data = json.decode(respones.body);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Container(
            margin: EdgeInsets.fromLTRB(25, 0, 25, 5),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Icon(Icons.input, size: 30, color: Colors.red),
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.close, size: 30, color: Colors.red),
                    SizedBox(width: 15),
                    Icon(Icons.search, size: 30, color: Colors.blue),
                    SizedBox(width: 10),
                  ],
                ),
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add, size: 35, color: Colors.red),
          ),
        ],
        title: Text("ຈັດການຂໍ້ມູນປຶ້ມ"),
      ),
    );
  }
}
