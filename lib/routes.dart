import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'app/home.dart';

const home = '/home';

class RoutesObs extends VxObserver {
  @override
  void didChangeRoute(Uri route, Page page, String pushOrPop) {
    print("${route.path} - $pushOrPop");
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    print('Pushed a route');
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    print('Popped a route');
  }
}

final navigator = VxNavigator(
  notFoundPage: (uri, params) => MaterialPage(
    key: ValueKey('not-found-page'),
    child: Builder(
      builder: (context) => Scaffold(
        body: Center(
          child: Text('Page ${uri.path} not found'),
        ),
      ),
    ),
  ),
  observers: [RoutesObs()],
  routes: {
    "/": (uri, param) => VxRoutePage(
          pageName: home,
          child: Home(),
          transition: (animation, child) => ScaleTransition(
            alignment: Alignment.bottomLeft,
            scale: Tween(
              begin: 0.0,
              end: 1.0,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.easeInOut,
              ),
            ),
            child: child,
          ),
        ),
  },
);

var vxInformationParser = VxInformationParser();
