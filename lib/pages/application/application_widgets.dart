import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/pages/home/home_page.dart';

Widget buildPage(int index) {
  List<Widget> widget = [
    HomePage(),
    const Center(child: Text("Search")),
    const Center(child: Text("Course")),
    const Center(child: Text("Chat")),
    const Center(child: Text("Profile")),
  ];
  return widget[index];
}

var bottomTabs = [
  BottomNavigationBarItem(
      label: "home",
      icon: SizedBox(
          width: 15.w,
          height: 15.h,
          child: Image.asset("assets/icons/home.png")),
      activeIcon: SizedBox(
        width: 15.w,
        height: 15.h,
        child: Image.asset(
          "assets/icons/home.png",
          color: const Color.fromARGB(255, 42, 21, 77),
        ),
      )),
  BottomNavigationBarItem(
      label: "search",
      icon: SizedBox(
        width: 15.w,
        height: 15.h,
        child: Image.asset("assets/icons/search2.png"),
      ),
      activeIcon: SizedBox(
        width: 15.w,
        height: 15.h,
        child: Image.asset(
          "assets/icons/search2.png",
          color: const Color.fromARGB(255, 42, 21, 77),
        ),
      )),
  BottomNavigationBarItem(
      label: "course",
      icon: SizedBox(
          width: 15.w,
          height: 15.h,
          child: Image.asset("assets/icons/play-circle1.png")),
      activeIcon: SizedBox(
        width: 15.w,
        height: 15.h,
        child: Image.asset(
          "assets/icons/play-circle1.png",
          color: const Color.fromARGB(255, 42, 21, 77),
        ),
      )),
  BottomNavigationBarItem(
      label: "chat",
      icon: SizedBox(
          width: 15.w,
          height: 15.h,
          child: Image.asset("assets/icons/message-circle.png")),
      activeIcon: SizedBox(
        width: 15.w,
        height: 15.h,
        child: Image.asset(
          "assets/icons/message-circle.png",
          color: const Color.fromARGB(255, 42, 21, 77),
        ),
      )),
  BottomNavigationBarItem(
      label: "profile",
      icon: SizedBox(
          width: 15.w,
          height: 15.h,
          child: Image.asset("assets/icons/person2.png")),
      activeIcon: SizedBox(
        width: 15.w,
        height: 15.h,
        child: Image.asset(
          "assets/icons/person2.png",
          color: const Color.fromARGB(255, 42, 21, 77),
        ),
      )),
];
