import 'package:dest/routes.dart';
import 'package:dest/utils/theme.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: vxInformationParser,
      routerDelegate: navigator,
      theme: AppTheme.light,
      themeMode: ThemeMode.dark,
    );
  }
}
