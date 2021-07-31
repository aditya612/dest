// import 'dart:convert';

import 'dart:convert';

import 'package:dest/app/request_pane/url_section/url_section.dart';
import 'package:dest/app/response_pane/status_section.dart/status_section.dart';
import 'package:dest/controller/response_controller.dart';
// import 'package:dest/widgets/split_view.dart';

import 'package:flutter/material.dart';
import 'package:split_view/split_view.dart';

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
            children: [UrlSection(), Res()],
            initialFractions: [0.5, 0.5],
          ),
        ),
      ),
    );
  }
}

class Res extends StatelessWidget {
  const Res({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          StatusSection(),
          Spacer(),
          responseController.ob(
            () => Text(
              json.encode(responseController.responseModel?.body),
            ),
          ),
        ],
      ),
    );
  }
}
