import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UnitPage extends StatefulWidget {
  const UnitPage({super.key});

  @override
  State<UnitPage> createState() => _UnitPageState();
}

class _UnitPageState extends State<UnitPage> {
  XFile? imgFile;
  final ImagePicker impicker = ImagePicker();

  void takePhoto(ImageSource source) async {
    final pickedImage = await impicker.pickImage(source: source);
    if (pickedImage != null) {
      setState(() {
        imgFile = pickedImage;
      });
    }
  }

  void handleMenuSelection(String value) {
    if (value == 'camera') {
      takePhoto(ImageSource.camera);
    } else if (value == 'gallery') {
      takePhoto(ImageSource.gallery);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ຈັດການຫົວໜ່ວຍ"), backgroundColor: Colors.red),
      body: Stack(
        fit: StackFit.expand, // ให้ภาพพื้นหลังครอบเต็มจอ
        children: [
          Image.asset(
            "images/background.jpg", // เปลี่ยนเป็น path ของ background image คุณ
            fit: BoxFit.cover,
          ),
          Center(
            child: Stack(
              children: [
                CircleAvatar(
                  radius: 80.0,
                  backgroundImage:
                      imgFile == null
                          ? const AssetImage("images/image.png")
                          : FileImage(File(imgFile!.path)) as ImageProvider,
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: PopupMenuButton<String>(
                    icon: Icon(
                      Icons.camera_alt,
                      color: Colors.amber.shade900,
                      size: 30,
                    ),
                    onSelected: handleMenuSelection,
                    itemBuilder:
                        (BuildContext context) => [
                          PopupMenuItem(
                            value: 'camera',
                            child: Row(
                              children: [
                                Icon(Icons.camera_alt, color: Colors.red),
                                SizedBox(width: 8),
                                Text("Camera"),
                              ],
                            ),
                          ),
                          PopupMenuItem(
                            value: 'gallery',
                            child: Row(
                              children: [
                                Icon(Icons.photo, color: Colors.red),
                                SizedBox(width: 8),
                                Text("Gallery"),
                              ],
                            ),
                          ),
                        ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
