import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignIn extends StatefulWidget{
  const SignIn({Key? key}):super(key:key);
  @override 
  State<SignIn> createState()=> _SignState();
 }

 class _SignState extends State<SignIn> {
  @override 
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white, 
      child:SafeArea(
        child: Scaffold(
          appBar: AppBar(

            bottom: PreferredSize(preferredSize: const Size.fromHeight(1.0),
            child:Container(
              color:Colors.grey.withOpacity(0.5),
              height: 1.0,
            )),
            title: Text("Log In",
            style: TextStyle(
              color:Colors.black,
              fontSize:16.sp,
              fontWeight: FontWeight.normal,
            ))
          )
        )
      )
    );
  }
 }