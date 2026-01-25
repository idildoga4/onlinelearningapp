import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/pages/home/bloc/home_page_blocs.dart';
import 'package:ulearning/pages/home/bloc/home_page_states.dart';
import 'package:ulearning/pages/home/widgets/home_page_widgets.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: BlocBuilder<HomePageBlocs, HomePageStates>(
        builder : (context, state){
        return Container(
        margin: EdgeInsets.symmetric(vertical:0, horizontal: 25.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          homePageText("hello",
            color: const Color.fromARGB(150, 152, 126, 192),
            top: 5,
          ),
          homePageText("İdil",
            color: const Color.fromARGB(255, 16, 3, 36),
            top: 5,
          ),
          const SizedBox(height: 20,),
          searchView(),
          slidersView(context,state),
          menuView(),
        ],
    ),);
        }
      ));
    
  }
}