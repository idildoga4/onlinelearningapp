import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning/common/services/storage_service.dart';
import 'package:ulearning/global.dart';
import 'package:ulearning/pages/application/application_page.dart';
import 'package:ulearning/pages/application/bloc/app_blocs.dart';
import 'package:ulearning/pages/home/bloc/home_page_blocs.dart';
import 'package:ulearning/pages/home/home_page.dart';
import 'package:ulearning/pages/register/bloc/register_blocs.dart';
import 'package:ulearning/pages/register/register.dart';
import 'package:ulearning/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:ulearning/pages/sign_in/sign_in.dart';
import 'package:ulearning/pages/welcome/bloc/welcome.dart';
import 'package:ulearning/pages/welcome/bloc/welcome_bloc.dart';
import 'package:ulearning/routes/names.dart';

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
        route: AppRoutes.INITIAL,
        page: const Welcome(),
        bloc: BlocProvider(create: (_) => WelcomeBloc()),
      ),
      PageEntity(
        route: AppRoutes.SIGN_IN,
        page: const SignIn(),
        bloc: BlocProvider(create: (_) => SignInBloc()),
      ),
      PageEntity(
        route: AppRoutes.REGISTER,
        page: const Register(),
        bloc: BlocProvider(create: (_) => RegisterBlocs()),
      ),
      PageEntity(
        route: AppRoutes.APPLICATION,
        page: const ApplicationPage(),
        bloc: BlocProvider(create: (_) => AppBlocs()),
      ),
      PageEntity(
        route: AppRoutes.HOME_PAGE,
        page: const HomePage(),
        bloc: BlocProvider(create: (_) => HomePageBlocs()),
      ),
    ];
  }

  static List<BlocProvider> allBlocProviders(BuildContext context) {
    List<BlocProvider> blocProviders = [];
    for (var bloc in routes()) {
      if (bloc.bloc != null) {
        blocProviders.add(bloc.bloc!);
      }
    }
    return blocProviders;
  }

  static MaterialPageRoute generateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      var result = routes().where((element) => element.route == settings.name);
      if (result.isNotEmpty && result.first.page != null) {
        bool deviceFirstOpen = Global.storageService.getDeviceFirstOpen();
        if(result.first.route==AppRoutes.INITIAL&&deviceFirstOpen){
          bool isLoggedIn = Global.storageService.getIsLoggedIn();
          if(isLoggedIn)
          {
            return MaterialPageRoute(builder: (_)=> const ApplicationPage(), settings:settings);
          }
          return MaterialPageRoute(builder: (_)=>SignIn(),settings:settings);
        }
        return MaterialPageRoute(
          builder: (_) => result.first.page!,
          settings: settings,
        );
      }
    }
    return MaterialPageRoute(
      builder: (_) => const SignIn(),
      settings: settings,
    );
  }
}

class PageEntity {
  String? route;
  Widget? page;
  BlocProvider? bloc;

  PageEntity({
    this.route,
    this.page,
    this.bloc,
  });
}