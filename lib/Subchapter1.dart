import 'package:flutter/material.dart';
import 'package:my_project/subLesson1/ButtonPage.dart';
import 'package:my_project/subLesson1/ListViewPage.dart';
import 'package:my_project/subLesson1/TextFieldPage.dart';
import 'package:my_project/subLesson1/TextPage.dart';

List itm = [Textpage(), Textfieldpage(), Buttonpage(), Listviewpage()];
List<String> lessonTitles = ["Text", "TextField", "Button", "ListView"];
List<IconData> icons = [
  Icons.text_fields,
  Icons.input,
  Icons.touch_app,
  Icons.list,
];

class Subchapter1 extends StatefulWidget {
  const Subchapter1({super.key});

  @override
  State<Subchapter1> createState() => _Subchapter1State();
}

class _Subchapter1State extends State<Subchapter1> {
  void selectPage(int idx) {
    if (idx < itm.length) {
      Navigator.of(context).push(MaterialPageRoute(builder: (c) => itm[idx]));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ບົດທີ 1")),

      body: Container(
        margin: EdgeInsets.all(5),
        child: GridView.builder(
          itemCount: itm.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
          ),
          itemBuilder: (c, idx) {
            return InkWell(
              onTap: () => selectPage(idx),
              child: Card(
                elevation: 15,
                child: Container(
                  width: 100,
                  height: 180,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade700,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.red.shade700),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(icons[idx], color: Colors.red, size: 80),
                      Divider(),
                      Text(
                        "ບົດທີ 1.${idx + 1}",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        lessonTitles[idx],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
