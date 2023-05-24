import 'package:flutter/material.dart';

import '../../view/auth/login_view.dart';
import '../../view/auth/signup_view.dart';
import '../../view/auth/welcome_view.dart';
import '../../view/home/home_view.dart';

import '../constantroute.dart';

class RouteGenerator {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstants.welcomeRoute:
        return MaterialPageRoute(builder: (_) => const WelcomeView());

      case RouteConstants.signupRoute:
        return MaterialPageRoute(builder: (_) => RegisterScreen());

      case RouteConstants.loginRoute:
        return MaterialPageRoute(builder: (_) => LoginView());
      case RouteConstants.homeRoute:
        return MaterialPageRoute(builder: (_) => CategoriesScreen());

      default:
        return unDefineRoute();
    }
  }

  static Route<dynamic> unDefineRoute() => MaterialPageRoute(
      builder: (_) => const Scaffold(
            body: Text("AppStrings.noRouteFound"),
          ));
}
