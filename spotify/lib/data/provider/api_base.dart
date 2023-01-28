import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// The Base class for api calls.
abstract class ApiBase extends GetConnect {
  @override
  @mustCallSuper
  void onInit() {
    super.onInit();

    /// Base url
    // httpClient.baseUrl = 'http://127.0.0.1:5000/api/';
    httpClient.baseUrl = 'http://192.168.1.95:5000/api/';

    /// Allow self singed certificates for local dev servers.
    allowAutoSignedCert = true;

    /// Extend timeout for local dev servers.
    httpClient.timeout = const Duration(seconds: 40);
  }

  @override
  Future<Response<T>> delete<T>(String url,
      {Map<String, String>? headers,
        String? contentType,
        Map<String, dynamic>? body,
        Map<String, dynamic>? query,
        Decoder<T>? decoder}) {
    return request(
        url,
        'delete',
        headers: headers,
        contentType: contentType,
        query: query,
        body: body,
        decoder: decoder);
  }
}
