import '../../../controller/response_controller.dart';
import '../../../widgets/buttons.dart';
import 'package:flutter/material.dart';

class SendButton extends StatelessWidget {
  const SendButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FocusableIconButton(
      onPressed: () {
        responseController.fetchRequest();
        print(responseController.responseModel?.body);
      },
      icon: Icons.send_rounded,
      label: 'send',
      color: Colors.greenAccent,
    );
  }
}
