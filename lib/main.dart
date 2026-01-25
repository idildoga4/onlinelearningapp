import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/global.dart';
import 'package:ulearning/routes/pages.dart';



Future<void> main() async{
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
    
    providers: [...AppPages.allBlocProviders(context)],
      child: ScreenUtilInit(
        designSize: const Size(375,812),
        builder: (context, child) => MaterialApp(
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
        onGenerateRoute: AppPages.generateRouteSettings,
      ) ),
    );
    
  }
}

