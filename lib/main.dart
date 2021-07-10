import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
// import 'package:bitsdojo_window/bitsdojo_window.dart';

import 'app/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Vx.setPathUrlStrategy();
  runApp(App());
  // doWhenWindowReady(() {
  //   const initialSize = Size(600, 450);
  //   appWindow.minSize = initialSize;
  //   appWindow.size = initialSize;
  //   appWindow.alignment = Alignment.center;
  //   appWindow.title = "Dest";
  //   appWindow.show();
  // });
}
