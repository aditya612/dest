import 'dart:io';

import 'package:flutter/material.dart';
import 'package:window_size/window_size.dart';
// import 'package:velocity_x/velocity_x.dart';
// import 'package:bitsdojo_window/bitsdojo_window.dart';

import 'app/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Vx.setPathUrlStrategy();
  runApp(App());
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowFrame(Rect.fromLTWH(100.0, 200.0, 1300.0, 700.0));
    // setWindowMinSize(Size(720, 540));
  }
  // doWhenWindowReady(() {
  //   const initialSize = Size(600, 450);
  //   appWindow.minSize = initialSize;
  //   appWindow.size = initialSize;
  //   appWindow.alignment = Alignment.center;
  //   appWindow.title = "Dest";
  //   appWindow.show();
  // });
}
