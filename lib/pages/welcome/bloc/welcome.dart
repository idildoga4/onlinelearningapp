import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:ulearning/common/values/constant.dart';
import 'package:ulearning/global.dart';
import 'package:ulearning/pages/welcome/bloc/welcome_bloc.dart';
import 'package:ulearning/pages/welcome/bloc/welcome_events.dart';
import 'package:ulearning/pages/welcome/bloc/welcome_states.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => WelcomeBloc(),
      child: const _WelcomeView(),
    );
  }
}

class _WelcomeView extends StatefulWidget {
  const _WelcomeView({super.key});

  @override
  State<_WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<_WelcomeView> {
  final PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<WelcomeBloc, WelcomeState>(
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
                    context
                        .read<WelcomeBloc>()
                        .add(WelcomePageChanged(index));
                  },
                  children: [
                    _page(
                      0,
                      context,
                      "Next",
                      "First see learning",
                      "Forget about a fpr of paper all knowledge is on learning",
                      "assets/images/reading.png",
                    ),
                    _page(
                      1,
                      context,
                      "Next",
                      "Connect with everyone",
                      "Always keep in touch with your tutor & friend.",
                      "assets/images/boy.png",
                    ),
                    _page(
                      2,
                      context,
                      "Get Started",
                      "Always Fascinated Learning",
                      "Anywhere, anytime.",
                      "assets/images/man.png",
                    ),
                  ],
                ),
                Positioned(
                  bottom: 100.h,
                  child: DotsIndicator(
                    dotsCount: 3,
                    position: state.page.toInt(),
                    decorator: const DotsDecorator(
                      color: Colors.grey,
                      activeColor: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _page(
    int index,
    BuildContext context,
    String buttonName,
    String title,
    String subTitle,
    String imagePath,
  ) {
    return Column(
      children: [
        SizedBox(
          width: 345.w,
          height: 345.w,
          child: Image.asset(imagePath, fit: BoxFit.cover),
        ),
        Text(
          title,
          style: TextStyle(fontSize: 24.sp, color: Colors.black),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Text(
            subTitle,
            style: TextStyle(fontSize: 14.sp, color: Colors.black54),
            textAlign: TextAlign.center,
          ),
        ),
        GestureDetector(
          onTap: () {
            if (index < 2) {
              pageController.animateToPage(
                index + 1,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut,
              );
            } else {
              Global.storageService.setBool(
                AppConstants.STORAGE_DEVICE_OPEN_FIRST_TIME,
                true,
              );
              Navigator.of(context)
                  .pushNamedAndRemoveUntil("/sign_in", (r) => false);
            }
          },
          child: Container(
            margin: EdgeInsets.only(top: 80.h),
            width: 325.w,
            height: 50.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(15.w),
            ),
            child: Text(
              buttonName,
              style: TextStyle(color: Colors.white, fontSize: 16.sp),
            ),
          ),
        ),
      ],
    );
  }
}
