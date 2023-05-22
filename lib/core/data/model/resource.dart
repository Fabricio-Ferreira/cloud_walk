import 'package:cloud_walk_test/core/data/enum/status.dart';
import 'package:cloud_walk_test/core/data/model/app_exception.dart';
import 'package:equatable/equatable.dart';

class Resource<T> extends Equatable {
  final Status status;
  final T? data;
  final AppException? error;

  const Resource({
    required this.status,
    this.data,
    this.error,
  });

  const Resource.loading({
    this.data,
    this.error,
  }) : status = Status.loading;

  const Resource.success({
    this.data,
    this.error,
  }) : status = Status.success;

  const Resource.failed({
    this.error,
    this.data,
  }) : status = Status.failed;

  bool get isLoading => status == Status.loading;

  Resource<T> copyWith({
    Status? status,
    T? data,
    AppException? error,
  }) =>
      Resource<T>(
        status: status ?? this.status,
        data: data ?? this.data,
        error: error ?? this.error,
      );

  @override
  List<Object?> get props => [status, data, error];
}
