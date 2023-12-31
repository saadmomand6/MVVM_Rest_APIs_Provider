import 'package:flutter/material.dart';
import 'package:mmvm_rest_apis_provider/utilities/routes/route_names.dart';
import 'package:mmvm_rest_apis_provider/view/home_screen.dart';
import 'package:mmvm_rest_apis_provider/view/login_screen.dart';
import 'package:mmvm_rest_apis_provider/view/signup_screen.dart';

import '../../view/splash_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case RoutesNames.home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case RoutesNames.login:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case RoutesNames.signup:
        return MaterialPageRoute(builder: (context) => const SignUpScreen());
      case RoutesNames.splash:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      default:
        return MaterialPageRoute(builder: (context) {
          return const Scaffold(
            body: Column(
              children: [
                Center(
                  child: Text('no route defined'),
                )
              ],
            ),
          );
        });
    }
  }
}
