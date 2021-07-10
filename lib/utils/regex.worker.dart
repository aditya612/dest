List<RegExp> generateREForProtocol(String protocol) {
  return [
    RegExp(
        '$protocol(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]).){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])'),
    RegExp(
        '$protocol(([a-zA-Z0-9]|[a-zA-Z0-9][a-zA-Z0-9-]*[a-zA-Z0-9]).)*([A-Za-z0-9]|[A-Za-z0-9][A-Za-z0-9-]*[A-Za-z0-9/])'),
  ];
}

List<RegExp> ws = generateREForProtocol("^(wss?:\\/\\/)?");
List<RegExp> sse = generateREForProtocol("^(https?:\\/\\/)?");
List<RegExp> socketio =
    generateREForProtocol("^((wss?:\\/\\/)|(https?:\\/\\/))?");
enum regex { ws, sse, socketio }

// type = ws/sse/socketio
//  validator(type, url) async {
//   time('validator $url');
//   const [res1, res2] = await Future.all([
//     regex[type][0].test(url),
//     regex[type][1].test(url),
//   ]);
//   timeEnd(`validator ${url}`)
//   return res1 || res2;
// }

// onmessage ( data ) async{
  // var type = data.type;
  // var url = data.url;
  // var result = await validator(type, url);
  // postMessage({ type, url, result });
// }
