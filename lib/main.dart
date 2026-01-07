import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/appblocs.dart';
import 'package:ulearning/appevents.dart';
import 'package:ulearning/appstates.dart';
import 'package:ulearning/pages/bloc_providers.dart';
import 'package:ulearning/pages/register/register.dart';
import 'package:ulearning/pages/sign_in/sign_in.dart';
import 'package:ulearning/pages/welcome/bloc/welcome.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
    
    providers: AppBlocProviders.allBlocProviders,
      child: ScreenUtilInit(builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme:ThemeData(
          appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(
              color: Colors.black
            ),
            elevation: 0,
            backgroundColor:Colors.white
          )
        ),
        home: const Welcome(),
        routes: {
          "signIn":(context)=> const SignIn(),
          "register":(context)=> const Register(),
        }
      ) ),
    );
    
  }
}

class MyHomePage extends StatelessWidget{
  const MyHomePage({super.key});
  @override 

  Widget build(BuildContext context) {
    
    return Scaffold(
      
      body: Center(
       
        child: BlocBuilder<AppBlocs, AppStates>(
          builder: (context,state){
            return Column( 
              mainAxisAlignment: MainAxisAlignment.center,
              children:<Widget>[
                const Text('You have pushed the button this many times: '),
                Text("${BlocProvider.of<AppBlocs>(context).state.counter}",
                style:Theme.of(context).textTheme.headlineMedium)
              ]
              );
          }
        )
        
      ),
      floatingActionButton: Row(
        children: [
          FloatingActionButton(
            heroTag: "heroTag1",
            onPressed:()=> BlocProvider.of<AppBlocs>(context).add(Increment()),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          
          FloatingActionButton(
            heroTag: "heroTag2",
            onPressed: ()=> BlocProvider.of<AppBlocs>(context).add(Decrement()),
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
        ],
      ), 
    );
  }
}
