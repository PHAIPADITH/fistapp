import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UnitPage extends StatefulWidget {
  const UnitPage({super.key});

  @override
  State<UnitPage> createState() => _UnitPageState();
}

class _UnitPageState extends State<UnitPage> {
  PickedFile? imgFile;
  final ImagePicker impicker = ImagePicker();

  void takePhoto(ImageSource source) async {
    final FileImage = await impicker.pickImage(source: source);
  }

  void selectPhoto() {
    showModalBottomSheet(
      context: context,
      builder: (c) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "ເລືອກຮູບຈາກ",
                style: TextStyle(color: Colors.blue.shade800, fontSize: 22),
              ),
              const Divider(color: Colors.blue, thickness: 2),

              ListTile(
                leading: Icon(Icons.camera_alt, color: Colors.red, size: 25),
                title: Text(
                  "Camera",
                  style: TextStyle(color: Colors.red, fontSize: 20),
                ),
                onTap: () {
                  Navigator.pop(context); // ปิด bottom sheet
                  // TODO: Add camera functionality
                },
              ),
              ListTile(
                leading: Icon(Icons.photo, color: Colors.red, size: 25),
                title: Text(
                  "Gallery",
                  style: TextStyle(color: Colors.red, fontSize: 20),
                ),
                onTap: () {
                  Navigator.pop(context); // ปิด bottom sheet
                  // TODO: Add gallery functionality
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ຈັດການຫົວໜ່ວຍ")),
      body: Center(
        child: Stack(
          children: [
            const CircleAvatar(
              radius: 80.0,
              backgroundImage: AssetImage("images/shop.png"),
            ),
            Positioned(
              bottom: 18.0,
              right: 18.0,
              child: InkWell(
                onTap: selectPhoto,
                child: Icon(
                  Icons.camera_alt,
                  color: Colors.amber.shade900,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
