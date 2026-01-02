import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInController{
  final BuildContext context;
  const SignInController({
    required this.context
  });

  Future<void> handleSignIn(String type) async {
    try{
      if(type=="email"){
        //BlocProvider.of<SignInBloc>(context).state -> same 
        final state=context.read<SignInBloc>().state;

        String emailAdress=state.email;
        String password= state.password;

        if(emailAdress.isEmpty){

        }
        if(password.isEmpty)
        {

        }
        try{
          final credential= await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailAdress, password:password
          );
          if(credential.user==null)
          {

          }if(credential.user!.emailVerified){

          }
        }catch(e)
        {

        }

      }
    }
    catch(e){

    }
  }
}