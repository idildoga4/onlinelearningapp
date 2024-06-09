import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/appblocs.dart';
import 'package:ulearning/appevents.dart';
import 'package:ulearning/appstates.dart';
import 'package:ulearning/pages/sign/sign_in.dart';
import 'package:ulearning/pages/welcome/bloc/welcome.dart';
import 'package:ulearning/pages/welcome/bloc/welcome_bloc.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
    
    providers: [
        BlocProvider(create: (context)=> WelcomeBloc()),
        BlocProvider(create: (context)=>AppBlocs()),
      ],
      child: ScreenUtilInit(builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme:ThemeData(
          appBarTheme: const AppBarTheme(
            elevation: 0,
            backgroundColor:Colors.white
          )
        ),
        home: const Welcome(),
        routes: {
          "myHomePage":(context)=>const MyHomePage(),
          "signIn":(context)=> const SignIn(),
        }
      ) ),
    );
    
  }
}

class MyHomePage extends StatelessWidget{
  const MyHomePage({super.key});
  @override 

  Widget build(BuildContext context) {
    
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
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
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
