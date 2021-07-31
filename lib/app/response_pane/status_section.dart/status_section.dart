import 'package:flutter/material.dart';

import 'package:dest/controller/response_controller.dart';

class StatusSection extends StatelessWidget {
  const StatusSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 9,
      fit: FlexFit.tight,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: responseController.ob(
              () => (responseController.responseModel != null)
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                          RichWidget(
                            mainLabel: 'Status: ',
                            responseLabel:
                                '${responseController.responseModel?.statusCode} OK',
                          ),
                          RichWidget(
                            mainLabel: 'Size: ',
                            responseLabel:
                                '${responseController.responseModel?.contentSize.toStringAsFixed(2)} KB',
                          ),
                          RichWidget(
                            mainLabel: 'Time: ',
                            responseLabel:
                                '${responseController.responseModel?.stopwatch.elapsed.inMilliseconds} ms',
                          ),
                        ])
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                          RichWidget(mainLabel: 'Status: '),
                          RichWidget(mainLabel: 'Size: '),
                          RichWidget(mainLabel: 'Time: '),
                        ]),
              memo: () => [responseController.responseModel]),
        ),
      ),
    );
  }
}

class RichWidget extends StatelessWidget {
  final String _mainLabel;
  final String _responseLabel;
  const RichWidget({
    Key? key,
    required String mainLabel,
    String? responseLabel,
  })  : _mainLabel = mainLabel,
        _responseLabel = responseLabel ?? '',
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        // style: TextStyle(color: Colors.black, fontSize: 36),
        children: <TextSpan>[
          TextSpan(text: _mainLabel),
          TextSpan(
              text: _responseLabel,
              style: TextStyle(
                  color: Color.alphaBlend(
                      Colors.white70, Theme.of(context).backgroundColor))),
        ],
      ),
    );
  }
}
