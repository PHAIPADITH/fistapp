import 'package:flutter/material.dart';
import 'package:my_project/Drawer_menu.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ValueNotifier<bool> isPasswordVisible = ValueNotifier<bool>(false);

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    isPasswordVisible.dispose();
    super.dispose();
  }

  // สร้าง Widget โลโก้
  Widget logo() {
    return Image.asset(
      "images/nintendo.png",
      fit: BoxFit.cover,
      width: 160,
      height: 160,
    );
  }

  // ชื่อร้านค้า
  Widget textShop() {
    return Text(
      'NINTENDO SWITCH',
      style: TextStyle(
        color: Colors.red.shade400,
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  // ช่องกรอกข้อมูล
  Widget inputField({
    required String hintText,
    required IconData icon,
    bool isPassword = false,
    required TextEditingController controller,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
      child: ValueListenableBuilder<bool>(
        valueListenable: isPasswordVisible,
        builder: (context, isVisible, child) {
          return TextField(
            controller: controller,
            obscureText: isPassword ? !isVisible : false,
            decoration: InputDecoration(
              prefixIcon: Icon(icon, color: Colors.white70),
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.white70),
              filled: true,
              fillColor: Colors.white.withOpacity(0.3),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
              suffixIcon:
                  isPassword
                      ? IconButton(
                        icon: Icon(
                          isVisible ? Icons.visibility : Icons.visibility_off,
                          color: Colors.white70,
                        ),
                        onPressed: () {
                          isPasswordVisible.value = !isVisible;
                        },
                      )
                      : null,
            ),
            style: const TextStyle(color: Colors.white),
            autofocus: hintText == "Enter your username",
          );
        },
      ),
    );
  }

  // ปุ่ม Login และ Sign Up ในแนวเดียวกัน
  Widget loginAndSignUpButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade400,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                MaterialPageRoute route = MaterialPageRoute(
                  builder: (c) => Drawer_menu(),
                );
                Navigator.of(context).push(route);
                // TODO: ฟังก์ชัน Login
                print("Username: ${usernameController.text}");
                print("Password: ${passwordController.text}");
              },
              child: const Text(
                'LOGIN',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.red.shade400, width: 2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              onPressed: () {
                // TODO: ฟังก์ชัน Sign Up
                print("Go to Sign Up");
              },
              child: const Text(
                'SIGN UP',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            colors: [Colors.white, Colors.red],
            radius: 1.1,
            center: Alignment(0, -0.3),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              logo(),
              const SizedBox(height: 10),
              textShop(),
              const SizedBox(height: 30),
              inputField(
                hintText: "Enter your username",
                icon: Icons.person,
                controller: usernameController,
              ),
              inputField(
                hintText: "Enter your password",
                icon: Icons.lock,
                isPassword: true,
                controller: passwordController,
              ),
              const SizedBox(height: 10),
              loginAndSignUpButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
