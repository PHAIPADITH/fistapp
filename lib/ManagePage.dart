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

  // Form Key for validation
  final _formKey = GlobalKey<FormState>();

  // Clear the input fields
  void clearInputs() {
    ipController.clear();
    usernameController.clear();
    passwordController.clear();
    databaseController.clear();
  }

  // Function to validate and save form data
  void _saveForm() {
    if (_formKey.currentState?.validate() ?? false) {
      // If the form is valid, proceed with saving or processing data
      // You can call your database connection setup here
      Navigator.pop(context); // Close dialog after saving
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.blue.shade600, // Border color
              width: 2.0, // Border thickness
            ),
          ),
        ),
        child: const Text(
          "Manage Database",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold, // Make the title bold
            color: Colors.blue, // Title text color
          ),
          textAlign: TextAlign.center, // Center the title
        ),
      ),
      content: Form(
        key: _formKey, // Assign form key to manage validation
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // IP Address Field
            TextFormField(
              controller: ipController,
              decoration: const InputDecoration(
                labelText: "IP Address",
                border: OutlineInputBorder(), // Rectangle border
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the IP address';
                }
                // You can add more validation, e.g., for valid IP format
                return null;
              },
            ),
            const SizedBox(height: 10),
            // Username Field
            TextFormField(
              controller: usernameController,
              decoration: const InputDecoration(
                labelText: "Username",
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the username';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            // Password Field
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the password';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            // Database Field
            TextFormField(
              controller: databaseController,
              decoration: const InputDecoration(
                labelText: "Database",
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the database name';
                }
                return null;
              },
            ),
          ],
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center, // Center the buttons
          children: [
            // OK Button
            Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: TextButton(
                onPressed: _saveForm, // Save form data
                style: TextButton.styleFrom(foregroundColor: Colors.white),
                child: const Text("OK"),
              ),
            ),
            const SizedBox(width: 10),
            // Cancel Button
            Container(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: TextButton(
                onPressed: () {
                  clearInputs(); // Clear fields on cancel
                },
                style: TextButton.styleFrom(foregroundColor: Colors.white),
                child: const Text("Cancel"),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
