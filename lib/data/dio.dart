import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart' as d;
import 'package:dio/dio.dart';
import 'package:themeal/home_page.dart';
import 'package:themeal/model/app/singelton_model.dart';
import 'package:themeal/tool/helper.dart';

class Dio {
  late d.Dio _dio;
  late Helper _helper;

  Dio({Map<String, dynamic>? headers}) {
    _dio = d.Dio();
    _helper = Helper();
    _dio.interceptors.add(
      d.InterceptorsWrapper(
          onRequest: (d.RequestOptions o, d.RequestInterceptorHandler h) =>
              h.next(o),
          onResponse: (d.Response r, d.ResponseInterceptorHandler h) =>
              h.next(r),
          onError: (d.DioError e, d.ErrorInterceptorHandler h) async {
            if (e.response?.statusCode == 401) {
              _helper.backToRootPage(SingletonModel.shared.context!);
              _helper.moveToPage(
                SingletonModel.shared.context!,
                page: HomePage(),
              );
            }
            return h.next(e);
          }),
    );
  }

  Future put({
    required String url,
    dynamic body,
    Map<String, dynamic>? param,
  }) async {
    try {
      return await _dio.put(
        url,
        queryParameters: param,
        data: body,
      );
    } on TimeoutException catch (e) {
      print(e);
      return Future.error(e);
    } on SocketException catch (e) {
      print(e);
      return Future.error(e);
    } on d.DioError catch (e) {
      print(e);
      return Future.error(e);
    }
  }

  Future post({
    required String url,
    dynamic body,
    Map<String, dynamic>? param,
  }) async {
    try {
      return await _dio.post(
        url,
        queryParameters: param,
        data: body,
      );
    } on TimeoutException catch (e) {
      print(e);
      return Future.error(e);
    } on SocketException catch (e) {
      print(e);
      return Future.error(e);
    } on d.DioError catch (e) {
      print(e);
      return Future.error(e);
    }
  }

  Future get({
    required String url,
    Map<String, dynamic>? param,
  }) async {
    try {
      return await _dio.get(
        url,
        queryParameters: param,
      );
    } on TimeoutException catch (e) {
      print(e);
      return Future.error(e);
    } on SocketException catch (e) {
      print(e);
      return Future.error(e);
    } on d.DioError catch (e) {
      print(e);
      return Future.error(e);
    }
  }

  Future delete({
    required String url,
    Map<String, dynamic>? param,
  }) async {
    try {
      return await _dio.delete(
        url,
        queryParameters: param,
      );
    } on TimeoutException catch (e) {
      print(e);
      return Future.error(e);
    } on SocketException catch (e) {
      print(e);
      return Future.error(e);
    } on d.DioError catch (e) {
      print(e);
      return Future.error(e);
    }
  }
}