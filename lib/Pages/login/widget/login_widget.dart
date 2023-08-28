import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/Pages/login/Login_bloc/login_bloc.dart';
import 'package:ulearning_app/Pages/login/Login_bloc/login_event.dart';
import 'package:ulearning_app/Pages/login/Login_bloc/login_state.dart';
import 'package:ulearning_app/Pages/login/login_controller.dart';

AppBar buildAppBar() {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.white,
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1.0),
      child: Container(),
    ),
    title: const Center(
        child: Text(
      "ລັອກອິນ",
      style: TextStyle(color: Colors.black),
    )),
  );
}

// ignore: non_constant_identifier_names
Widget BuildThirdPartyLogin(BuildContext context) {
  return Column(
    children: [BuildIcon(), buildLogin(context), Text("data")],
  );
}

Widget BuildIcon() {
  return Container(
    padding: EdgeInsets.only(left: 50.w, right: 50.w),
    margin: EdgeInsets.only(top: 34.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _resableIcons("google"),
        _resableIcons("apple"),
        _resableIcons("facebook"),
      ],
    ),
  );
}

Widget buildLogin(BuildContext context) {
  return Container(
    child: Column(
      children: [
        Center(
            child: resableText(
                "ຫຼື ໃຊ້ບັນຊີອີເມວຂອງທ່ານເພື່ອເຂົ້າສູ່ລະບົບ", "conMargin")),
        Container(
          margin: EdgeInsets.only(top: 34.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              resableText("ອີເມລ", "emailMagin"),
              Center(child: buildTextField("ໃສ່ທີ່ຢູອີເມລ", "user", "email")),
              Center(child: BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  if (state is LoginErrorState) {
                    return Text(
                      state.errorMessage,
                      style: const TextStyle(color: Colors.red),
                    );
                  } else {
                    return Container();
                  }
                },
              )),
              resableText("ລະຫັດຜ່ານ", "passMargin"),
              Center(child: buildTextField("ໃສ່ລະຫັດຜ່ານ", "lock", "password")),
              forgotPassword(),
              bottonName("ລັອກອິນ", "login", () {
                print("Login button");
                LoginController(context: context).handLogin("email");
              }),
              bottonName("ລົງທະບຽນ", "register", () {}),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _resableIcons(String iconName) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      margin: EdgeInsets.only(
        bottom: 10.h,
      ),
      width: 40.w,
      height: 40.w,
      child: Image.asset("assets/icons/$iconName.png"),
    ),
  );
}

Widget resableText(String text, String marginText) {
  return Container(
    margin: marginText == "conMargin"
        ? EdgeInsets.only(left: 0.w)
        : EdgeInsets.only(left: 25),
    child: Text(
      text,
      style: TextStyle(
        color: Colors.grey,
        fontSize: 14.sp,
      ),
    ),
  );
}

Widget buildTextField(String hintText, String iconName, String textType) {
  return BlocBuilder<LoginBloc, LoginState>(
    builder: (context, state) {
      return Container(
        margin: EdgeInsets.only(bottom: 20.h),
        width: 325.w,
        height: 50.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.w),
            border: Border.all(color: Colors.black)),
        child: Row(
          children: [
            Container(
                margin: EdgeInsets.only(left: 10.w),
                child: Image.asset("assets/icons/$iconName.png")),
            SizedBox(
              width: 270.w,
              height: 50.h,
              child: TextField(
                onChanged: textType == "email"
                    ? (value) {
                        context.read<LoginBloc>().add(EmailEvent(value));
                      }
                    : (value) {
                        context.read<LoginBloc>().add(PasswordEvent(value));
                      },
                obscureText: textType == "password" ? state.icon_eye : false,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  hintText: hintText,
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  disabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  suffixIcon: textType == "password"
                      ? GestureDetector(
                          onTap: () => context.read<LoginBloc>().add(
                                LoginChangeIconEyeEvent(),
                              ),
                          child: Icon(
                              state.icon_eye
                                  ? FluentIcons.eye_off_24_regular
                                  : FluentIcons.eye_24_regular,
                              color: Colors.grey.shade500),
                        )
                      : null,
                ),
              ),
            )
          ],
        ),
      );
    },
  );
}

Widget forgotPassword() {
  return Container(
    margin: EdgeInsets.only(left: 25.w),
    width: 260.w,
    height: 44.h,
    child: GestureDetector(
      onTap: () {},
      child: Text(
        "ລືມລະຫັດຜ່ານ",
        style: TextStyle(
            decoration: TextDecoration.underline,
            decorationColor: Colors.blue,
            fontSize: 12.sp),
      ),
    ),
  );
}

Widget bottonName(String textName, String bottonType, void Function()? func) {
  return GestureDetector(
    onTap: func,
    child: Container(
      margin: EdgeInsets.only(
          left: 25.w, right: 25.w, top: bottonType == "login" ? 40.h : 20.h),
      width: 325.w,
      height: 50.h,
      decoration: BoxDecoration(
          color: bottonType == "login" ? Colors.green : Colors.green[200],
          borderRadius: BorderRadius.circular(15)),
      child: Center(
        child: Text(
          textName,
          style: TextStyle(fontSize: 16.sp),
        ),
      ),
    ),
  );
}
