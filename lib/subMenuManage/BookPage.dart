import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BookPage extends StatefulWidget {
  const BookPage({super.key});

  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  final String url =
      "http://localhost:3000/book"; // แก้เป็น 10.0.2.2 สำหรับ Android emulator
  List data = [];
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchAllData();
  }

  Future<void> fetchAllData() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        setState(() {
          data = json.decode(response.body);
        });
      } else {
        print('Error: Server responded with status ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  Future<void> fetchDataByVal(String txtsearch) async {
    final urlsearch = "http://localhost:3000/book/$txtsearch";
    try {
      final response = await http.get(Uri.parse(urlsearch));
      if (response.statusCode == 200) {
        setState(() {
          data = json.decode(response.body);
        });
      } else {
        print('Error: Server responded with status ${response.statusCode}');
      }
    } catch (e) {
      print('Error searching data: $e');
    }
  }

  void AddBook(String bid, String bookname, String price, String page) async {
    try {
      final String urladd = "http://localhost:3000/book/";
      final respones = await http.post(
        Uri.parse(urladd),
        headers: {"content-type": "application/json"},
        body: json.encode({}),
      );
    } catch (e) {
      print('$e');
    }
  }

  Widget TextBookID() {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
        filled: true,
        prefixIcon: Icon(Icons.book, color: Colors.green.shade800, size: 25),
        labelText: "ລະຫັດປຶ້ມ",
      ),
    );
  }

  Widget TextBookName() {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
        filled: true,
        prefixIcon: Icon(Icons.title, color: Colors.green.shade800, size: 25),
        labelText: "ລະຫັດປຶ້ມ",
      ),
    );
  }

  Widget TextPrice() {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
        filled: true,
        prefixIcon: Icon(
          Icons.attach_money,
          color: Colors.green.shade800,
          size: 25,
        ),
        labelText: "ລາຄາ",
      ),
    );
  }

  Widget TextPage() {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
        filled: true,
        prefixIcon: Icon(Icons.pages, color: Colors.green.shade800, size: 25),
        labelText: "ຈໍານວນໜ້າ",
      ),
    );
  }

  Widget TextDataInfo() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Divider(color: Colors.green, thickness: 2),
        TextBookID(),
        SizedBox(height: 10),
        TextBookName(),
        SizedBox(height: 10),
        TextPrice(),
        SizedBox(height: 10),
        TextPage(),
      ],
    );
  }

  void ShowBookMange() {
    showDialog(
      context: context,
      builder: (c) {
        return AlertDialog(
          title: Text("ຈັດການຂໍ້ມູນ"),
          content: TextDataInfo(),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade700,
                padding: EdgeInsets.symmetric(vertical: 18, horizontal: 15),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "ບັນທຶກຂໍ້ມູນ",
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade700,
                padding: EdgeInsets.symmetric(vertical: 18, horizontal: 15),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "ຍົກເລີກ",
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Container(
            margin: const EdgeInsets.fromLTRB(25, 0, 25, 5),
            child: TextField(
              controller: searchController,
              onChanged: (value) {
                if (value.trim().isEmpty) {
                  fetchAllData();
                } else {
                  fetchDataByVal(value.trim());
                }
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                filled: true,
                fillColor: Colors.white,
                prefixIcon: const Icon(
                  Icons.input,
                  size: 30,
                  color: Colors.red,
                ),
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.close,
                        size: 30,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        searchController.clear();
                        fetchAllData();
                      },
                    ),
                    const SizedBox(width: 15),
                    IconButton(
                      icon: const Icon(
                        Icons.search,
                        size: 30,
                        color: Colors.blue,
                      ),
                      onPressed: () {
                        fetchDataByVal(searchController.text.trim());
                      },
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add, size: 35, color: Colors.black),
          ),
        ],
        title: const Text("ຈັດການຂໍ້ມູນປຶ້ມ"),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            final getdata = data[index];
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: Text(
                    '${getdata["bookid"]}',
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  title: Text(
                    '${getdata["bookname"]}',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Row(
                      children: [
                        Text(
                          'Price: ${getdata["price"]}',
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(width: 20),
                        Text(
                          'Pages: ${getdata["page"]}',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.green,
                          size: 25,
                        ),
                      ),
                      const SizedBox(width: 8),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                          size: 25,
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(color: Colors.black, thickness: 1),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {
          ShowBookMange();
        },
        child: Icon(Icons.add, color: Colors.white, size: 45),
      ),
    );
  }
}
