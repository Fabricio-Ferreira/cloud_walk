import 'package:cloud_walk_test/core/data/enum/status.dart';
import 'package:cloud_walk_test/core/data/model/app_exception.dart';
import 'package:cloud_walk_test/core/data/model/resource.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

typedef OnResourceSuccess<T> = Widget Function(T data);
typedef OnResourceFailed<T> = Widget Function(AppException error, T? data);
typedef OnResourceLoading<T> = Widget Function(T? data);

class ResourceWidget<T> extends StatelessWidget {
  final Resource<T> resource;
  final OnResourceSuccess<T> onSuccess;
  final OnResourceLoading<T> onLoading;
  final OnResourceFailed onError;
  final bool considerLoadingWithDataAsSuccess;
  final bool Function(T)? isLoadingPredicate;

  const ResourceWidget({
    required this.resource,
    required this.onLoading,
    required this.onSuccess,
    required this.onError,
    this.considerLoadingWithDataAsSuccess = false,
    this.isLoadingPredicate,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = resource.data;
    final status = resource.status;
    final error = resource.error;

    switch (status) {
      case Status.loading:
        if (considerLoadingWithDataAsSuccess &&
            data != null &&
            isLoadingPredicate?.call(data) != true) {
          return onSuccess(data);
        }
        return onLoading(data);
      case Status.success:
        if (data == null) return onError(error ?? AppException.generic(), data);
        return onSuccess(data);
      case Status.failed:
        return onError(error ?? AppException.generic(), data);
    }
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<Resource<T>>('resource', resource));
    properties.add(ObjectFlagProperty<OnResourceSuccess<T>>.has('onSuccess', onSuccess));
    properties.add(ObjectFlagProperty<OnResourceLoading<T>>.has('onLoading', onLoading));
    properties.add(ObjectFlagProperty<OnResourceFailed>.has('onError', onError));
    properties.add(DiagnosticsProperty<bool>(
        'considerLoadingWithDataAsSuccess', considerLoadingWithDataAsSuccess));
    properties.add(
        ObjectFlagProperty<bool Function(T p1)?>.has('isLoadingPredicate', isLoadingPredicate));
  }
}
