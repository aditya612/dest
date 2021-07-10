import 'package:dest/controller/response_controller.dart';
import 'package:dest/widgets/buttons.dart';
import 'package:flutter/material.dart';

class UrlSection extends StatelessWidget {
  const UrlSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        // mainAxisSize: MainAxisSize.max,
        children: [
          urlTextField,
          focusableIconButton,
        ],
      ),
    );
  }
}

var urlTextField = Flexible(
  flex: 6,
  child: TextFormField(
    controller: responseController.urlController,
  ),
);

var focusableIconButton = FocusableIconButton(
  onPressed: () {
    responseController.fetchRequest();
    print(responseController.responseModel?.body);
  },
  icon: Icons.send_rounded,
  label: 'send',
  color: Colors.greenAccent,
);
