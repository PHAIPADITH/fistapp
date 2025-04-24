import 'package:flutter/material.dart';

List itm = [
  "ພັດທະນາແອັບດ້ອຍ Flutter 1",
  "ພັດທະນາແອັບດ້ວຍ React Native",
  "ພັດທະນາໂປຮແກຮມດ້ວຍ C#",
];

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  String? selectItm;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ຈັດການສິນຄ້າ"),
        backgroundColor: Colors.red,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            margin: EdgeInsets.symmetric(vertical: 5.0),
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
            ),
            child: DropdownButton(
              isExpanded: true,
              value: selectItm,
              hint: Text('ກະລຸນາເລືອກລາຍການ'),
              items:
                  itm.map((c) {
                    return DropdownMenuItem(
                      value: c,
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Icon(
                            Icons.book,
                            color: Colors.amber.shade700,
                            size: 25,
                          ),
                        ),
                        title: Text(
                          '${c}',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
              onChanged: (newval) {
                setState(() {
                  selectItm = newval.toString();
                });
              },
            ),
          ),
        ),
      ),
      body: Center(
        child:
            selectItm == null
                ? Text("ຂໍ້ມູນສິນຄ້າ")
                : Text(
                  '${selectItm}',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
      ),
    );
  }
}
