import '../routes.dart';
import '../utils/theme.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: vxInformationParser,
      routerDelegate: navigator,
      theme: AppTheme.darkThemeData,
      themeMode: ThemeMode.dark,
    );
  }
}
