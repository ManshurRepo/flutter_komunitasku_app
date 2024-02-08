import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_komunitas_app/presentation/auth/bloc/login/login_bloc.dart';
import 'package:flutter_komunitas_app/presentation/home/bloc/bloc/member_bloc.dart';

import 'package:flutter_komunitas_app/presentation/splash_screen_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
         BlocProvider(
          create: (context) => MemberBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Komunitas App',
        theme: ThemeData(
            primarySwatch: Colors.blue, scaffoldBackgroundColor: Colors.black),
        home: const SplashScreen(),
      ),
    );
  }
}
