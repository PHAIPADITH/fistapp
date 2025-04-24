import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  String? selectedUnit;
  String? selectedCategory;
  Widget showButtonSheet() {
    return Container(
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey.shade900,
              child: Icon(Icons.share, color: Colors.red, size: 30),
            ),
            title: Text(
              "share",
              style: TextStyle(
                color: Colors.red,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey.shade900,
              child: Icon(Icons.copy, color: Colors.red, size: 30),
            ),
            title: Text(
              "Copy",
              style: TextStyle(
                color: Colors.red,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey.shade900,
              child: Icon(Icons.delete, color: Colors.red, size: 30),
            ),
            title: Text(
              "Delete",
              style: TextStyle(
                color: Colors.red,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          Divider(),
        ],
      ),
    );
  }

  final TextEditingController codeController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  final List<String> units = ['ອັນ', 'ແກ້ວ', 'ແກັດ', 'ແພັກ', 'ກວດ', 'ປ້ອງ'];
  final List<String> categories = [
    'ນົມ',
    'ນົມຜົງ',
    'ເຄື່ອງດື່ມ',
    'ອາຫານ',
    'ເຄື່ອງສຳອາງ',
  ];
  List<Map<String, String>> itemList = []; // ✅ เพิ่มตรงนี้

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ເພີ່ມລາຍການສິນຄ້າ"),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (c) => showButtonSheet(),
              );
            },
            icon: Icon(Icons.add, color: Colors.white),
          ),
        ],
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                controller: codeController,
                decoration: InputDecoration(
                  labelText: 'ລະຫັດສິນຄ້າ',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'ລາຍການສິນຄ້າ',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              DropdownButtonFormField<String>(
                isExpanded: true,
                value: selectedUnit,
                decoration: InputDecoration(
                  labelText: 'ເລືອກ Unit',
                  border: OutlineInputBorder(),
                ),
                items:
                    units
                        .map(
                          (unit) =>
                              DropdownMenuItem(value: unit, child: Text(unit)),
                        )
                        .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedUnit = value;
                  });
                },
              ),
              SizedBox(height: 20),
              DropdownButtonFormField<String>(
                isExpanded: true,
                value: selectedCategory,
                decoration: InputDecoration(
                  labelText: 'ເລືອກປະເພດ',
                  border: OutlineInputBorder(),
                ),
                items:
                    categories
                        .map(
                          (cat) =>
                              DropdownMenuItem(value: cat, child: Text(cat)),
                        )
                        .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedCategory = value;
                  });
                },
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      if (codeController.text.isEmpty ||
                          nameController.text.isEmpty ||
                          selectedUnit == null ||
                          selectedCategory == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("ກະລຸນາກອກຂໍ້ມູນໃຫ້ຄົບ")),
                        );
                      } else {
                        setState(() {
                          itemList.add({
                            'code': codeController.text,
                            'name': nameController.text,
                            'unit': selectedUnit!,
                            'category': selectedCategory!,
                          });
                          codeController.clear();
                          nameController.clear();
                          selectedUnit = null;
                          selectedCategory = null;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("ເພີ່ມສິນຄ້າແລ້ວ")),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 44, 255, 51),
                    ),
                    icon: Icon(Icons.add),
                    label: Text("ເພີ່ມ"),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        codeController.clear();
                        nameController.clear();
                        selectedUnit = null;
                        selectedCategory = null;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("ລ້າງຂໍ້ມູນສຳເລັດ")),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    icon: Icon(Icons.cancel),
                    label: Text("ຍົກເລີກ"),
                  ),
                ],
              ),
              SizedBox(height: 30),

              // 🔽 แสดงรายการสินค้าที่เพิ่ม
              if (itemList.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "ລາຍການສິນຄ້າທີ່ເພີ່ມ:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    ...itemList.map((item) {
                      return Card(
                        child: ListTile(
                          title: Text("${item['name']} (${item['code']})"),
                          subtitle: Text(
                            "Unit: ${item['unit']}, ປະເພດ: ${item['category']}",
                          ),
                        ),
                      );
                    }).toList(),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
