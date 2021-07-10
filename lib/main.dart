import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Vx.setPathUrlStrategy();
  runApp(App());
}
