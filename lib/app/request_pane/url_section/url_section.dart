import 'package:flutter/material.dart';

import 'method_drop_down.dart';
import 'send_button.dart';
import 'url_text_field.dart';

class UrlSection extends StatelessWidget {
  const UrlSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MethodDropDown(),
          UrlTextField(),
          SendButton(),
        ],
      ),
    );
  }
}
