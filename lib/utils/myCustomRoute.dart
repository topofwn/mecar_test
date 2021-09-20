import 'package:flutter/material.dart';
import 'package:mecar_test/ui/home/home_page.dart';
import 'package:mecar_test/ui/login/login_page.dart';
import 'package:mecar_test/ui/register/register_page.dart';
import 'package:mecar_test/ui/splash/splash_page.dart';


class MyCustomRoute<T> extends MaterialPageRoute<T> {
  MyCustomRoute({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
//    if (settings.isInitialRoute)
//    return child;
    // Fades between routes. (If you don't want any animation,
    // just return child.)
//    return new SlideTransition(
//        position: Tween<Offset>(
//          begin: const Offset(1, 0),
//          end: Offset.zero,
//        ).animate(
//          CurvedAnimation(
//            parent: animation,
//            curve: Curves.fastOutSlowIn,
//          ),
//        ),
//        child: child);
    return new FadeTransition(opacity: animation, child: child);
  }
}

RouteFactory get myRoute => (RouteSettings settings) {
      switch (settings.name) {
        case SplashScreen.routeName:
          return new MyCustomRoute(
            builder: (_) => SplashScreen(),
            settings: settings,
          );
        case LoginScreen.routeName:
          return new MyCustomRoute(
            builder: (_) => LoginScreen(),
            settings: settings,
          );
        case RegisterScreen.routeName:
          return new MyCustomRoute(
            builder: (_) => RegisterScreen(),
            settings: settings,
          );
        case HomeScreen.routeName:
          return new MyCustomRoute(
            builder: (_) => HomeScreen(),
            settings: settings,
          );
        default:
          return new MyCustomRoute(
            builder: (_) => Container(),
            settings: settings,
          );
      }
    };
