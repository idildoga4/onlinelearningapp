import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/pages/register/bloc/register_blocs.dart';
import 'package:ulearning/pages/register/bloc/register_events.dart';
import 'package:ulearning/pages/register/bloc/register_states.dart';
import 'package:ulearning/pages/register/register_controller.dart';
import 'package:ulearning/pages/sign_in/widgets/sign_in_widget.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
   @override
  Widget build(BuildContext context) {
    
        return BlocBuilder<RegisterBlocs, RegisterStates>(builder: (context, state){
          return Container(
                color: Colors.white,
                child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: buildAppBar("Sign Up"),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 40.h),
                    padding: EdgeInsets.only(left: 25.w,right: 25.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20.h),
                        reusableText("Username"),
                        buildTextField("Enter your username", "name","user",
                        (value){
                          context.read<RegisterBlocs>().add(UserNameEvent(value));
                        }),
          
                        reusableText("Email"),
                        buildTextField("Enter your email address", "email","user",
                        (value){
                          context.read<RegisterBlocs>().add(EmailEvent(value));
                        }),
                        reusableText("Password"),
                        
                        buildTextField("Enter your password", "password","lock",
                        (value){
                          context.read<RegisterBlocs>().add(PasswordEvent(value));
                        }),
          
                        reusableText("Re-enter your password"),
                        
                        buildTextField("Re-enter your password to confirm", "password","lock",
                        (value){
                          context.read<RegisterBlocs>().add(RepasswordEvent(value));
                        }),
          
                        Container(
                          margin: EdgeInsets.only(left: 25.w),
                          child:reusableText("Enter your details below and free sign up"),
                        ),
                        
                        
                        buildLogInAndRegButton("Sign Up", "login",(){
                          RegisterController(context:context).handleEmailRegister();
                        }),
                      ],
                    ),
                  )
                ],
              ),
            ),
              
          ),
                ),
          );
          }); }
      }
   
  
