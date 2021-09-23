import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:voltro_task/screens/ui/bottom_navigation.dart';
import 'package:voltro_task/screens/ui/detail_screen.dart';
import 'package:voltro_task/screens/ui/home_screen.dart';
import 'package:voltro_task/screens/ui/search_screen.dart';

class Routes {
  static final String splash = '/';
  static final String home = '/home';
  static final String search = '/search';
  static final String detail = '/detail';

  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    final args = routeSettings.arguments;
    print(routeSettings.name);

    switch (routeSettings.name) {
      case '/':
        return PageTransition(
          child: BottomNavigationScreen(),
          duration: Duration(milliseconds: 400),
          type: PageTransitionType.fade,
        );

      case '/home':
        return PageTransition(
          child: HomeScreen(),
          duration: Duration(milliseconds: 400),
          type: PageTransitionType.fade,
        );
      case '/search':
        return PageTransition(
          child: SearchScreen(),
          duration: Duration(milliseconds: 400),
          type: PageTransitionType.fade,
        );
      case '/detail':
        return PageTransition(
          child: DetailScreen(
            countries: args,
          ),
          duration: Duration(milliseconds: 400),
          type: PageTransitionType.fade,
        );

      default:
        return PageTransition(
          child: BottomNavigationScreen(),
          duration: Duration(milliseconds: 400),
          type: PageTransitionType.fade,
        );
    }
  }
}
