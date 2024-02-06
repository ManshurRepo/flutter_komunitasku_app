import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_komunitas_app/data/models/requests/login_request_model.dart';
import 'package:flutter_komunitas_app/data/models/responses/members_response_model.dart';
import 'package:flutter_komunitas_app/presentation/auth/bloc/login/login_bloc.dart';
import 'package:flutter_komunitas_app/presentation/auth/pages/change_password_page.dart';

import '../../../common/components/button.dart';
import '../../../common/components/custom_text_field.dart';
import '../../../common/components/space_height_width.dart';
import '../../../common/constants/colors.dart';
import '../../home/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 254, 255),
      body: ListView(
        padding: const EdgeInsets.all(15.0),
        children: [
          const SpaceHeight(80.0),
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
            child: Text("Masuk untuk melanjutkan ",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: ColorName.grey,
                )),
          ),
          const SpaceHeight(10.0),
          CustomTextField(
            controller: usernameController,
            label: 'Nama Anggota',
          ),
          const SpaceHeight(12.0),
          CustomTextField(
            controller: passwordController,
            label: 'Password',
            obscureText: true,
          ),
          const SpaceHeight(24.0),
          BlocConsumer<LoginBloc, LoginState>(
            listener: (context, state) {
              state.maybeWhen(
                  orElse: () {},
                  success: (data) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Login Succes',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                        ),
                        backgroundColor: ColorName.green,
                      ),
                    );
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                    );
                  },
                  error: (message) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(message,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w600 )),
                        backgroundColor: ColorName.red,
                      ),
                    );
                  });
            },
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () => Button.filled(
                  onPressed: () {
                    final requestModel = LoginRequestModel(
                      identifier: usernameController.text,
                      password: passwordController.text);
                    context
                        .read<LoginBloc>()
                        .add(LoginEvent.login(requestModel));
                  },
                  label: 'Masuk',
                  ),
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ));
            },
          ),
          // Button.filled(
          //       onPressed: () {
          //         Navigator.pushReplacement(
          //           context,
          //           MaterialPageRoute(
          //             builder: (context) => const HomePage(),
          //           ),
          //         );
          //       },
          //       label: 'Masuk',
          //     );
          //   },
          // ),
          const SpaceHeight(122.0),
          Center(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChangePassword(),
                  ),
                );
              },
              child: const Text.rich(
                TextSpan(
                  text: "Lupa sandi anda? ",
                  children: [
                    TextSpan(
                      text: "Buat sandi baru",
                      style: TextStyle(color: Color.fromARGB(255, 0, 65, 117)),
                    ),
                  ],
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: ColorName.grey,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
