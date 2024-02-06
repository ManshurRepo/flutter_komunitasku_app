import 'package:flutter/material.dart';
import 'package:flutter_komunitas_app/presentation/auth/pages/login_page.dart';

import '../../../common/components/button.dart';
import '../../../common/components/custom_text_field.dart';
import '../../../common/components/space_height_width.dart';
import '../../../common/constants/colors.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _LoginPageState();
}

class _LoginPageState extends State<ChangePassword> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.all(15.0),
        children: [
          const SpaceHeight(60.0),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100.0),
              child: Image.asset(
                "assets/images/logo.png",
                width: 150,
                height: 150,
              )),
          const SpaceHeight(10.0),
          const Center(
            child: Text(
              "KOMUNITAS APP",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: ColorName.black,
              ),
            ),
          ),
          const SpaceHeight(60.0),
          const Center(
            child: Text("Buat sandi baru : ",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: ColorName.grey,
                )),
          ),
          const SpaceHeight(10.0),
          CustomTextField(
            controller: usernameController,
            label: 'Masukan Email',
          ),
          const SpaceHeight(12.0),
          CustomTextField(
            controller: passwordController,
            label: 'Sandi Baru',
            obscureText: true,
          ),
          const SpaceHeight(12.0),
          CustomTextField(
            controller: confirmPasswordController,
            label: 'Ulangi Sandi Baru',
            obscureText: true,
          ),
          const SpaceHeight(30.0),
          Button.filled(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
              );
            },
            label: 'Konfirmasi',
          ),
          const SpaceHeight(10),
          Button.filled2(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
              );
            },
            label: 'Batal',
          ),
        ],
      ),
    );
  }
}
