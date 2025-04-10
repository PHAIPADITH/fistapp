import 'package:flutter/material.dart';
import 'package:my_project/BottomBar.dart';
import 'package:my_project/MenuDrawer.dart';
import 'package:my_project/ManagePage.dart';
import 'package:my_project/submenuTabBar/ImportProductsPage.dart';
import 'package:my_project/submenuTabBar/SalePage.dart';
import 'package:my_project/submenuTabBar/menuManagePage.dart';
import 'package:my_project/submenuTabBar/menuOrderPage.dart';
import 'package:my_project/submenuTabBar/menuReportPage.dart';
import 'package:my_project/submenuTabBar/searchPage.dart'; // Import ManagePage

class Drawer_menu extends StatefulWidget {
  const Drawer_menu({super.key});

  @override
  State<Drawer_menu> createState() => _Drawer_menuState();
}

class _Drawer_menuState extends State<Drawer_menu> {
  Widget popupMenuButton() {
    return PopupMenuButton<String>(
      itemBuilder:
          (context) => [
            PopupMenuItem(
              child: ListTile(
                leading: Icon(
                  Icons.settings,
                  color: Colors.grey.shade600,
                  size: 35,
                ),
                title: Text(
                  'ຕັ້ງຄ່າ',
                  style: TextStyle(color: Colors.blue.shade600, fontSize: 20),
                ),
                onTap: () {
                  Navigator.of(context).pop(); // Close Popup
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ManagePage()),
                  );
                },
              ),
            ),
            PopupMenuDivider(),
            PopupMenuItem(
              child: ListTile(
                leading: Icon(
                  Icons.wifi_outlined,
                  color: Colors.grey.shade600,
                  size: 35,
                ),
                title: Text(
                  'ເຊື່ອມຕໍ່ Wifi',
                  style: TextStyle(color: Colors.blue.shade600, fontSize: 20),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            PopupMenuDivider(),
            PopupMenuItem(
              child: ListTile(
                leading: Icon(
                  Icons.folder,
                  color: Colors.yellow.shade600,
                  size: 35,
                ),
                title: Text(
                  'ເຊື່ອມຕໍ່ ຖານຂໍ້ມູນ',
                  style: TextStyle(color: Colors.blue.shade600, fontSize: 20),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          title: Text("ບົດຮຽນພັດທະນາແອັບດ້ວຍ Flutter 1"),
          backgroundColor: Colors.red,
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.add)),
            popupMenuButton(),
          ],
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              Tab(
                icon: Icon(Icons.folder_open, color: Colors.white),
                text: "ຈັດການຂໍ້ມູນພື້ນຖານ",
              ),

              Tab(
                icon: Icon(Icons.shopping_basket, color: Colors.white),
                text: "ຂາຍ",
              ),

              Tab(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                text: "ສັ່ງຊື້ສິນຄ້າ",
              ),

              Tab(
                icon: Icon(Icons.arrow_forward, color: Colors.white),
                text: "ນຳເຂົ້າສິນຄ້າ",
              ),

              Tab(
                icon: Icon(Icons.search, color: Colors.white),
                text: "ຄົ້ນຫາ",
              ),

              Tab(
                icon: Icon(Icons.bar_chart, color: Colors.white),
                text: "ລາຍງານ",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            menuManagePage(),
            SalePage(),
            menuOrderPage(),
            ImportProductsPage(),
            searchPage(),
            menuReportPage(),
          ],
        ),

        drawer: MenuDrawer(),
        bottomNavigationBar: BottomBar(),
      ),
    );
  }
}
