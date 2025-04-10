import 'package:flutter/material.dart';

class ManagePage extends StatefulWidget {
  @override
  _ManagePageState createState() => _ManagePageState();
}

class _ManagePageState extends State<ManagePage> {
  final TextEditingController ipController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController databaseController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final FocusNode ipFocusNode = FocusNode();
  final FocusNode usernameFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode databaseFocusNode = FocusNode();

  void clearInputs() {
    ipController.clear();
    usernameController.clear();
    passwordController.clear();
    databaseController.clear();

    // โฟกัสกลับไปที่ช่อง IP Address
    FocusScope.of(context).requestFocus(ipFocusNode);
  }

  void _saveForm() {
    if (_formKey.currentState?.validate() ?? false) {
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    ipFocusNode.dispose();
    usernameFocusNode.dispose();
    passwordFocusNode.dispose();
    databaseFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.blue.shade600, width: 2.0),
          ),
        ),
        child: const Text(
          "ຈັດການຄ່າ",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: ipController,
              focusNode: ipFocusNode,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                labelText: "IP Address",
                border: OutlineInputBorder(),
              ),
              validator:
                  (value) =>
                      value == null || value.isEmpty
                          ? 'Please enter the IP address'
                          : null,
              onFieldSubmitted:
                  (_) => FocusScope.of(context).requestFocus(usernameFocusNode),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: usernameController,
              focusNode: usernameFocusNode,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                labelText: "Username",
                border: OutlineInputBorder(),
              ),
              validator:
                  (value) =>
                      value == null || value.isEmpty
                          ? 'Please enter the username'
                          : null,
              onFieldSubmitted:
                  (_) => FocusScope.of(context).requestFocus(passwordFocusNode),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: passwordController,
              focusNode: passwordFocusNode,
              textInputAction: TextInputAction.next,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
              ),
              validator:
                  (value) =>
                      value == null || value.isEmpty
                          ? 'Please enter the password'
                          : null,
              onFieldSubmitted:
                  (_) => FocusScope.of(context).requestFocus(databaseFocusNode),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: databaseController,
              focusNode: databaseFocusNode,
              textInputAction: TextInputAction.done,
              decoration: const InputDecoration(
                labelText: "Database",
                border: OutlineInputBorder(),
              ),
              validator:
                  (value) =>
                      value == null || value.isEmpty
                          ? 'Please enter the database name'
                          : null,
              onFieldSubmitted: (_) => _saveForm(), // กด Enter เพื่อบันทึก
            ),
          ],
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _saveForm,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              child: const Text("OK", style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              onPressed: clearInputs,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text(
                "Cancel",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
