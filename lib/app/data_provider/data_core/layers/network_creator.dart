import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../interfaces/request_protocol.dart';

class NetworkCreator {
  static var shared = NetworkCreator();
  final Dio _client = Dio();

  Future<Response> request(RequestProtocol route) {
    var options = RequestOptions(
      baseUrl: route.baseURL,
      method: route.method,
      path: route.path,
      queryParameters: route.params,
      data: !route.isFormDataBody
          ? route.body
          : FormData.fromMap(route.body ?? {}),
      followRedirects: false,
      headers: route.header,
      responseType: ResponseType.json,
    );

    (_client.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    try {
      return _client.fetch(options);
    } catch (e, stk) {
      debugPrintStack(stackTrace: stk);
      rethrow;
    }
  }
}
