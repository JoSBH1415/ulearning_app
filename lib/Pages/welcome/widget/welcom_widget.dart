import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/Pages/welcome/welcome_bloc/welcome_bloc.dart';
import 'package:ulearning_app/Pages/welcome/welcome_bloc/welcome_event.dart';
import 'package:ulearning_app/Pages/welcome/welcome_bloc/welcome_state.dart';

PageController pageController = PageController(initialPage: 0);

Widget pageView(BuildContext context) {
  return Scaffold(body: BlocBuilder<WelcomeBloc, WelcomeState>(
    builder: (context, state) {
      return Container(
        margin: EdgeInsets.only(top: 34.h),
        width: 375.w,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            PageView(
              controller: pageController,
              onPageChanged: (index) {
                state.page = index;
                BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent());
                print("indext value is ${index}");
              },
              children: [
                buildPageView(
                  1,
                  context,
                  "ໜ້າຕໍ່ໄປ",
                  "ເບິ່ງການຮຽນຮູ້ກ່ອນ",
                  "ລືມເລື່ອງການອ່ານໜັງສືດ້ວຍເຈ້ຍໄດ້ເລີຍ! ວ້າວ",
                  "assets/images/reading.png",
                ),
                buildPageView(
                  2,
                  context,
                  "ໜ້າຕໍ່ໄປ",
                  "ເຊື່ອມຕໍ່ກັບທຸກຄົນ",
                  "ຕິດຕໍ່ກັບຄູສອນ ແລະ ໝູ່ຂອງເຈົ້າໄດ້ຕະຫຼອດເວລາ. ມາເຊື່ອມຕໍ່ກັນເລີຍ",
                  "assets/images/boy.png",
                ),
                buildPageView(
                  3,
                  context,
                  "ເລີ່ມຕົ້ນດຽວນີ້!",
                  "ການຮຽນຮູ້ທີ່ໜ້າສົນໃຈສະເໝີ",
                  "ທຸກບ່ອນທຸກເວລາ. ເວລາແມ່ນຢູ່ໃນການຕັດສິນໃຈຂອງພວກເຮົາ, ສະນັ້ນຈົ່ງສຶກສາທຸກຄັ້ງທີ່ທ່ານຕ້ອງການ",
                  "assets/images/man.png",
                )
              ],
            ),
            Positioned(
              bottom: 100.w,
              child: DotsIndicator(
                position: state.page,
                dotsCount: 3,
                decorator: const DotsDecorator(activeColor: Colors.green),
              ),
            )
          ],
        ),
      );
    },
  ));
}

Widget buildPageView(int index, BuildContext context, String buttonName,
    String title, String subtitle, String imagePath) {
  return Column(children: [
    SizedBox(
        width: 345.w,
        height: 345.w,
        child: Image.asset(imagePath, fit: BoxFit.cover)),
    Container(
      child: Text(
        title,
        style: TextStyle(
            color: Colors.black,
            fontSize: 24.sp,
            fontWeight: FontWeight.normal,
            fontFamily: 'NotoSansLao'),
      ),
    ),
    Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          subtitle,
          style: TextStyle(
              color: Colors.black.withOpacity(0.5),
              fontSize: 14.sp,
              fontWeight: FontWeight.normal),
        ),
      ),
    ),
    GestureDetector(
      onTap: () {
        if (index < 3) {
          pageController.animateToPage(index,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeIn);
        } else {
          Navigator.of(context)
              .pushNamedAndRemoveUntil("login", (route) => false);
        }
      },
      child: Container(
        margin: EdgeInsets.only(top: 90.h, left: 25.w, right: 25.w),
        width: 325.w,
        height: 50.h,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(15.w),
        ),
        child: Center(
            child: Text(
          buttonName,
          style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.normal),
        )),
      ),
    ),
  ]);
}
