import '../../../controller/response_controller.dart';
import 'package:flutter/material.dart';

class UrlTextField extends StatelessWidget {
  const UrlTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 6,
      child: TextField(
        controller: responseController.urlController,
        // autofocus: true,
      ),
    );
  }
}
