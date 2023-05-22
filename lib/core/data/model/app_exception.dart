import 'package:equatable/equatable.dart';

class AppException<E> extends Equatable implements Exception {
  final String title;
  final String description;
  final E? exception;
  final dynamic data;

  const AppException({
    String? title,
    String? description,
    this.exception,
    this.data,
  })  : title = title ?? '',
        description = description ?? '';

  factory AppException.generic({E? exception}) => AppException(
        title: 'Ops, algo deu errado!',
        description: 'Por favor, tente novamente mais tarde.',
        exception: exception,
      );

  @override
  String toString() => title;

  @override
  List<Object?> get props => [title, description, exception, data];
}
