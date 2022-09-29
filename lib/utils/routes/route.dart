
import 'package:cupid_knot_practise/utils/routes/route_name.dart';
import 'package:cupid_knot_practise/view/home_view.dart';
import 'package:cupid_knot_practise/view/login_view.dart';
import 'package:cupid_knot_practise/view/register_view.dart';
import 'package:cupid_knot_practise/view/splash_view.dart';
import 'package:flutter/material.dart';

class Routes{
  static Route<dynamic>  generateRoute(RouteSettings settings){
    switch(settings.name){
      case RouteNames.home:
        return MaterialPageRoute(builder: (context)=> HomeView());
      case RouteNames.login:
        return MaterialPageRoute(builder: (context)=> LoginView());
      case RouteNames.splash:
        return MaterialPageRoute(builder: (context)=> SplashView());
      case RouteNames.register:
        return MaterialPageRoute(builder: (context)=> RegisterView());
      default:
        return MaterialPageRoute(builder: (_){
          return Scaffold(
            body: Center(
              child: Text('No route Defined'),
            ),
          );
        });
    }
  }
}