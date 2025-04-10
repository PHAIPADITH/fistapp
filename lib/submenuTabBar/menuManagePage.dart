import 'package:flutter/material.dart';
import 'package:my_project/subMenuManage/CategoryPage.dart';
import 'package:my_project/subMenuManage/ProductPage.dart';
import 'package:my_project/subMenuManage/UnitPage.dart';

class menuManagePage extends StatefulWidget {
  const menuManagePage({super.key});

  @override
  State<menuManagePage> createState() => _menuManagePageState();
}

class _menuManagePageState extends State<menuManagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 3, // จำนวนคอลัมน์
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          children: [
            _buildMenuItem(Icons.straighten, 'ຫົວໜ່ວຍ', () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UnitPage()),
              );
            }),
            _buildMenuItem(Icons.category, 'ປະເພດສິນຄ້າ', () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CategoryPage()),
              );
            }),
            _buildMenuItem(Icons.inventory, 'ຂໍ້ມູນສິນຄ້າ', () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProductPage()),
              );
            }),
            _buildMenuItem(Icons.store, 'ຜູ້ສະໜອງ', () {
              print("กดเมนูผู้จำหน่าย");
            }),
            _buildMenuItem(Icons.person, 'ພະນັກງານ', () {
              print("กดเมนูพนักงาน");
            }),
            _buildMenuItem(Icons.currency_exchange, 'ອັດຕາແລກ', () {
              print("อัตราแลกเปลี่ยน");
            }),
            _buildMenuItem(Icons.people, 'ລູກຄ້າ', () {
              print("กดเมนูลูกค้า");
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 50, color: Colors.red),
              SizedBox(height: 10),
              Text(title, style: TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }
}
