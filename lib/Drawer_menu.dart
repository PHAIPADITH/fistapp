import 'package:flutter/material.dart';
import 'package:my_project/MenuDrawer.dart';
import 'package:my_project/ManagePage.dart'; // Import ManagePage

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
    return Scaffold(
      appBar: AppBar(
        title: Text("ບົດຮຽນພັດທະນາແອັບດ້ວຍ Flutter 1"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.add)),
          popupMenuButton(),
        ],
      ),
      drawer: MenuDrawer(),
    );
  }
}
