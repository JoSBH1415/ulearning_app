import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/Pages/login/Login_bloc/login_bloc.dart';
import 'package:ulearning_app/Pages/login/login.dart';
import 'package:ulearning_app/Pages/welcome/welcome.dart';
import 'package:ulearning_app/Pages/welcome/welcome_bloc/welcome_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WelcomeBloc>(
            create: (context) => WelcomeBloc(), lazy: false),
        BlocProvider<LoginBloc>(
            create: (context) => LoginBloc(), lazy: false),
      ],
      child: ScreenUtilInit(
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const WelComePage(),
          routes: {
            "login": (context) => const LoginPage(),
          },
        ),
      ),
    );
  }
}
