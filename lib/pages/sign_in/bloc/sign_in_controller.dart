import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning/common/values/constant.dart';
import 'package:ulearning/common/widgets/flutter_toast.dart';
import 'package:ulearning/global.dart';
import 'package:ulearning/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInController {
  final BuildContext context;
  const SignInController({required this.context});

  Future<void> handleSignIn(String type) async {
    try {
      if (type == "email") {
        final state = context.read<SignInBloc>().state;

        String emailAddress = state.email;
        String password = state.password;

        if (emailAddress.isEmpty) {
          toastInfo(msg: "You need to fill email address");
          return;
        }
        if (password.isEmpty) {
          toastInfo(msg: "You need a password");
          return;
        }

        try {
          final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailAddress,
            password: password,
          );

          if (credential.user == null) {
            toastInfo(msg: "User not exist");
            return;
          }

          if (!credential.user!.emailVerified) {
            toastInfo(msg: "Verify your email");
            return;
          }
          var user =credential.user;
          if(user!=null){
          print("user-exist");
          Global.storageService.setString(AppConstants.STORAGE_USER_TOKEN_KEY, "12345678");
          
      }
        } on FirebaseAuthException catch (e) { 
         
          if (e.code == 'user-not-found') {
            print('No user found for that email');
            toastInfo(msg: "No user found for that email");
          } else if (e.code == 'wrong-password') { 
            print("Wrong password provided for that user");
            toastInfo(msg: "Wrong password provided for that user");
          } else if (e.code == 'invalid-email') {
            print("Your email is invalid");
            
          } else {
             print("Firebase Error: ${e.code}");
          }
        } catch (e) {
         
          print("$e");
        }
      }
    } catch (e) {
      print(" $e");
    }
  }
}