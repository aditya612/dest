// import 'dart:convert';

import 'dart:convert';

import 'package:dest/app/request_pane/url_section.dart';
import 'package:dest/controller/response_controller.dart';
import 'package:dest/widgets/split_view.dart';

import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    responseController.urlController.text =
        'https://reqres.in/api/users?page=2';
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: SplitView(
            children: [
              UrlSection(),
              responseController.ob(
                () => Text(
                  json.encode(responseController.responseModel?.body),
                ),
              ),
            ],
            initialFractions: [0.4, 0.6],
          ),
        ),
      ),
    );
  }
}
