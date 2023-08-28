import 'package:flutter/material.dart';
import 'package:ulearning_app/Pages/login/widget/login_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: buildAppBar(),
          body: SingleChildScrollView(
              child: Column(
            children: [BuildThirdPartyLogin(context)],
          )),
        ),
      ),
    );
  }
}
