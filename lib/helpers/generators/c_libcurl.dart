import 'dart:convert';
import 'dart:core';

import 'package:html_unescape/html_unescape.dart';

class CLibcurlCodegen {
  String? url;
  String? pathName;
  String? queryString;
  String? auth;
  String? httpUser;
  String? httpPassword;
  String? method;
  bool? rawInput = false;
  String? rawParams = "";
  String? rawRequestBody = "";
  String? bearerToken;
  Map<String, dynamic>? headers;
  dynamic contentType;
  CLibcurlCodegen({
    this.url,
    this.pathName,
    this.queryString,
    this.auth,
    this.httpUser,
    this.httpPassword,
    this.method,
    this.rawInput,
    this.rawParams,
    this.rawRequestBody,
    this.bearerToken,
    this.headers,
    this.contentType,
  });

  String generator() {
    final requestString = [];

    requestString.add('CURL *hnd = curl_easy_init();');
    requestString
        .add('curl_easy_setopt(hnd, CURLOPT_CUSTOMREQUEST, "$method");');
    requestString.add(
        'curl_easy_setopt(hnd, CURLOPT_URL, "$url$pathName$queryString");');
    requestString.add('struct curl_slist *headers = NULL;');

    headers!.forEach((key, value) => {
          // ignore: unnecessary_null_comparison
          if (key != null)
            requestString
                .add('headers = curl_slist_append(headers, "$key: $value");')
        });

    if (auth == "Basic Auth") {
      final unescape = HtmlUnescape();
      final basic = '$httpUser:$httpPassword';
      requestString.add(
          'headers = curl_slist_append(headers, "Authorization: Basic ${base64Encode(utf8.encode(unescape.convert(Uri.encodeFull(basic))))}");');
    } else if (auth == "Bearer Token" || auth == "OAuth 2.0") {
      requestString.add(
          'headers = curl_slist_append(headers, "Authorization: Bearer $bearerToken");');
    }

    if (["POST", "PUT", "PATCH", "DELETE"].contains(method)) {
      var requestBody = rawInput! ? rawParams : rawRequestBody;

      if (contentType.includes("x-www-form-urlencoded")) {
        requestBody = '"$requestBody"';
      } else
        requestBody = json.encode(requestBody);

      requestString.add(
          'headers = curl_slist_append(headers, "Content-Type: $contentType");');
      requestString.add("curl_easy_setopt(hnd, CURLOPT_HTTPHEADER, headers);");
      requestString
          .add('curl_easy_setopt(hnd, CURLOPT_POSTFIELDS, $requestBody);');
    } else
      requestString.add("curl_easy_setopt(hnd, CURLOPT_HTTPHEADER, headers);");

    requestString.add('CURLcode ret = curl_easy_perform(hnd);');
    return requestString.join("\n");
  }
}
