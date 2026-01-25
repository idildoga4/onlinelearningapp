import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/entities/colors.dart';
import 'package:ulearning/pages/home/bloc/home_page_blocs.dart';
import 'package:ulearning/pages/home/bloc/home_page_events.dart';
import 'package:ulearning/pages/home/bloc/home_page_states.dart';

AppBar buildAppBar(){
  return AppBar(
    title: Container(
      margin: EdgeInsets.only(left: 7.w, right: 7.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        SizedBox(
          child: Container(
            width:15.w,
            height:12.h,
            child: Image.asset("assets/icons/menu.png"),
          ),
        ),
        GestureDetector(
          child: Container(
            width: 40.w,
            height: 40.h,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/icons/person.png")
              ),
            )
          )
        )
      ],)
    ),
  );
}

Widget homePageText(String text, {Color color=const Color.fromARGB(255, 16, 3, 36), int top=20}){
 return Container(
        margin: EdgeInsets.only(top:top.h),
        child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top:20.h),
            child: Text("İdil",
            style:TextStyle(color:color,
            fontSize:24.sp,
            fontWeight: FontWeight.bold))
          )]));
}

Widget searchView(){
  return Row(
    children: [
      Container(
        width:280.w,
        height: 40.h,
        color: Colors.red,
        decoration: BoxDecoration(
          color: const Color.fromARGB(137, 236, 236, 236),
          borderRadius: BorderRadius.circular(15.h),
          border: Border.all(color: const Color.fromARGB(94, 0, 0, 0))
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 17.w),
              child: SizedBox(width: 16.w,
              height:16.w,
              child: Image.asset("assets/,cons/search.png")),
            ),
            Container(
              width: 240.w,
              height: 40.h,
              child: TextField(
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              contentPadding:const EdgeInsets.fromLTRB(5, 5, 0, 5),
              hintText: "Search",
              border: const OutlineInputBorder(
                borderSide:BorderSide(color: Colors.transparent)
              ),
              enabledBorder:const OutlineInputBorder(
                borderSide:BorderSide(
                color:Colors.transparent,
              ),
              
              
              ),
              disabledBorder:const OutlineInputBorder(
                borderSide:BorderSide(
                color:Colors.transparent,
              ),
              ),
              focusedBorder:const OutlineInputBorder(
                borderSide:BorderSide(
                color:Colors.transparent,
              ),
              ),
              hintStyle:TextStyle(
                color:Colors.grey.withOpacity(0.5),
              ),
              
            ),
            style:TextStyle(
              color:Colors.black,
              fontFamily:"Avenir",
              fontWeight:FontWeight.normal,fontSize:14.sp
            ),
            autocorrect: false,
            obscureText: false,
          )
            )
          ],
        )
      ),
      GestureDetector(
        child:Container(
          width: 40.w,
          height: 40.h,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 16, 3, 36),
            borderRadius: BorderRadius.all(Radius.circular(13.w)),
            border: Border.all(color: const Color.fromARGB(137, 236, 236, 236)),

          ),
          child:Image.asset("assets/icons/options.png")
        )
      )
    ],
  );
}

Widget slidersView(BuildContext context, HomePageStates state)
{
  return Column(
    children: [
      Container(
        margin: const EdgeInsets.only(top:20),
        width: 325.w,
        height: 160.h,
      child: PageView(
        onPageChanged:(value){
          context.read<HomePageBlocs>().add(HomePageDots(value));
        },
        children: [ _slidersContainer(path: "assets/icons/art.png"),
      _slidersContainer(path: "assets/icons/image_1.png"),
      _slidersContainer(path: "assets/icons/image_2.png"),
     ] )),
       Container(
        child: DotsIndicator(
          dotsCount: 3,
          position: state.index,
          decorator:  DotsDecorator(
            color: AppColors.dotInactive,
            activeColor: AppColors.dotActive,
            size:  const Size.square(5.0),
            activeSize: const Size(17.0,5.0),
            activeShape:RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            )
          )
        )
       )
          ],
          
        );
      
}

Widget _slidersContainer({String path= "assets/icons/art.png"})
{
return Container(
        margin: const EdgeInsets.only(top:20),
        width: 325.w,
        height: 160.h,
        child: PageView(
          children: [
            Container(
              width: 325.w,
              height: 160.h,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                image:DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(path))
              ),
            )
          ],
        )
      );
}

Widget menuView() {
  return Column(
    children: [
      Container(
        width: 325.w,
        margin: EdgeInsets.only(top: 15.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _reusableSubTitleText("Choose your course"),
            GestureDetector(
              child: _reusableSubTitleText(
                "See all",
                color: AppColors.textHint,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
      SizedBox(height: 10.h),
      Row(
        children: [
          _reusableMenuText("All"),
          SizedBox(width: 10.w),
          _reusableMenuText("Popular"),
        ],
      )
    ],
  );
}

Widget _reusableSubTitleText(String text, {Color color= AppColors.textPrimary, int fontSize= 16}){
    return Container(
            child: Text(text,
            style: TextStyle(
            color: color,
            fontWeight: FontWeight.bold,
            fontSize: fontSize.sp
            )),
          );
}

Widget _reusableMenuText(String text){
  return Container(
  decoration: BoxDecoration(
    color: AppColors.dotActive,
    borderRadius: BorderRadius.circular(7.w),
    border: Border.all(color: AppColors.dotActive),),
    padding: EdgeInsets.only(
      left: 15.w,
      right: 15.w,
      top: 5.h,
      bottom: 5.h
    ),
    child: _reusableSubTitleText("All",
    color: AppColors.textPrimary,
    fontSize:11),
  );

}