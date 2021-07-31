// import 'package:dest/widgets/drop_down2.dart';

import 'package:dest/widgets/drop_down2.dart';

import '../../../controller/response_controller.dart';
import '../../../utils/constants.dart';
// import '../../../widgets/dropdown.dart';
import 'package:flutter/material.dart';

class MethodDropDown extends StatelessWidget {
  const MethodDropDown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonDropdown<String>(
      child: Flexible(
        child: Text(responseController.methodDropDownController.value!),
      ),
      onChange: (String value, int index) => {
        responseController.methodDropDownController.value = value,
        print(responseController.methodDropDownController.value)
      },
      dropdownButtonStyle: DropdownButtonStyle(
        width: 120,
        height: 40,
        elevation: 1,
        backgroundColor: Theme.of(context).backgroundColor.withOpacity(.1),
        primaryColor: Theme.of(context).primaryColor,
      ),
      dropdownStyle: DropdownStyle(
        borderRadius: BorderRadius.circular(4),
        elevation: 3,
        padding: const EdgeInsets.all(8),
      ),
      items: HTTP_METHODS
          .map(
            (e) => DropdownItem<String>(
              value: e,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(e),
              ),
            ),
          )
          .toList(),
    );

    // return Flexible(
    //   flex: 1,
    //   child: Padding(
    //     padding: const EdgeInsets.all(8.0),
    //     child: DropdownFormField<String>(
    //       controller: responseController.methodDropDownController,
    //       onEmptyActionPressed: () async {},
    //       decoration: InputDecoration(
    //         suffixIcon: Icon(Icons.arrow_drop_down_rounded),
    //       ),
    //       onSaved: (dynamic str) {},
    //       dropdownHeight: 300,
    //       onChanged: (dynamic str) {},
    //       validator: (dynamic str) {},
    //       dropdownColor: Color.alphaBlend(
    //         Theme.of(context).accentColor.withOpacity(0.1),
    //         Theme.of(context).backgroundColor,
    //       ),
    //       displayItemFn: (dynamic item) => Text(
    //         item,
    //       ),
    //       findFn: (dynamic str) async => HTTP_METHODS,
    //       filterFn: (dynamic item, str) =>
    //           item.toLowerCase().indexOf(str.toLowerCase()) >= 0,
    //       dropdownItemFn: (dynamic item, position, focused,
    //               dynamic lastSelectedItem, onTap) =>
    //           ListTile(
    //         title: Text(item),
    //         tileColor:
    //             focused ? Theme.of(context).accentColor : Colors.transparent,
    //         onTap: onTap,
    //         autofocus: true,
    //       ),
    //     ),
    //   ),
    // );
    // return Flexible(
    //   flex: 1,
    //   child: Padding(
    //     padding: const EdgeInsets.all(8.0),
    //     child: DropdownField<String>(
    //       // controller: responseController.methodDropDownController,
    //       // onEmptyActionPressed: () async {},
    //       decoration: InputDecoration(
    //         suffixIcon: Icon(Icons.arrow_drop_down_rounded),
    //       ),
    //       // onSaved: (dynamic str) {},
    //       // dropdownHeight: 300,
    //       // onChanged: (dynamic str) {},
    //       // validator: (dynamic str) {},
    //       dropdownColor: Color.alphaBlend(
    //         Theme.of(context).accentColor.withOpacity(0.1),
    //         Theme.of(context).backgroundColor,
    //       ),
    //       displayItemFn: (dynamic item) => Text(
    //         item,
    //       ),
    //       findFn: (dynamic str) async => HTTP_METHODS,
    //       // filterFn: (dynamic item, str) =>
    //       //     item.toLowerCase().indexOf(str.toLowerCase()) >= 0,
    //       dropdownItemFn: (dynamic item, position, focused,
    //               dynamic lastSelectedItem, onTap) =>
    //           ListTile(
    //         title: Text(item),
    //         tileColor:
    //             focused ? Theme.of(context).accentColor : Colors.transparent,
    //         onTap: onTap,
    //         autofocus: true,
    //       ),
    //     ),
    //   ),
    // );
  }
}
