

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:movies_db/core/networking/api_error_model.dart';

extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this)
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(String routeName,
      {Object? arguments, required RoutePredicate predicate}) {
    return Navigator.of(this)
        .pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  }

  void pop() => Navigator.of(this).pop();
}

extension StringExtension on String? {
  bool isNullOrEmpty() => this == null || this == "";
}

extension ListExtension<T> on List<T>? {
  bool isNullOrEmpty() => this == null || this!.isEmpty;
}



extension DioExceptionTypeExtension on DioException {
  ApiErrorModel when({
    required ApiErrorModel Function() connectionError,
    required ApiErrorModel Function() connectionTimeout,
    required ApiErrorModel Function() sendTimeout,
    required ApiErrorModel Function() receiveTimeout,
    required ApiErrorModel Function() badCertificate,
    required ApiErrorModel Function() badResponse,
    required ApiErrorModel Function() cancel,
    required ApiErrorModel Function() unknown,
  }) {
    if (type == DioExceptionType.connectionError) {
      return connectionError();
    } else if (type == DioExceptionType.connectionTimeout) {
      return connectionTimeout();
    } else if (type == DioExceptionType.sendTimeout) {
      return sendTimeout();
    } else if (type == DioExceptionType.receiveTimeout) {
      return receiveTimeout();
    } else if (type == DioExceptionType.badCertificate) {
      return badCertificate();
    } else if (type == DioExceptionType.badResponse) {
      return badResponse();
    } else if (type == DioExceptionType.cancel) {
      return cancel();
    } else {
      return unknown();
    }
  }
}