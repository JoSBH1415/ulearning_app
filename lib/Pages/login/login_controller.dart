import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/Pages/login/Login_bloc/login_bloc.dart';
import 'package:ulearning_app/common/values/widget/Flutter_toast.dart';

class LoginController {
  final BuildContext context;
  const LoginController({required this.context});

  Future<void> handLogin(String type) async {
    try {
      if (type == "email") {
        final state = context.read<LoginBloc>().state;
        String emailAddress = state.email;
        String password = state.password;

        if (emailAddress.isEmpty) {
          toastInfo(msg: "ກະລຸນາປ້ອນອີເມລ");
          // print("ກະລຸນາປ້ອນອີເມລ");
        } else {
          print("email is $emailAddress");
        }
        if (password.isEmpty) {
          toastInfo(msg: "ກະລຸນາປ້ອນລະຫັດຜ່ານ");
          // print("ກະລຸນາປ້ອນລະຫັດຜ່ານ");
        } else if (password.length < 8) {
          toastInfo(msg: "ລະຫັດຕ້ອງມີຢ່າງນ້ອຍ 8 ໂຕ");
          // print("ລະຫັດຕ້ອງມີຢ່າງນ້ອຍ 8 ໂຕ");
        }
        // try {
        //   final credential = await FirebaseAuth.instance
        //       .signInWithEmailAndPassword(
        //           email: emailAddress, password: password);
        //   if (credential.user == null) {
        //     print("user does not exist");
        //   }
        //   if (!credential.user!.emailVerified) {
        //     print("not varied");
        //   }
        //   var user = credential.user;
        //   if (user != null) {
        //     print("user exist");
        //   } else {
        //     print("no User");
        //   }
        // } on FirebaseAuthException catch (e) {
        //   if (e.code == 'user-not-found') {
        //     print('No ser found for that email.');
        //   } else if (e.code == 'wrong-password') {
        //     print("wrong password provided for that user");
        //   }
        // }
      }
    } catch (e) {
      print("ສຳເລັດ");
    }
  }
}
