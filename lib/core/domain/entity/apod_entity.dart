import 'package:equatable/equatable.dart';

class ApodEntity extends Equatable {
  final String imageUrl;
  final String title;
  final String explanation;
  final String date;

  const ApodEntity({
    required this.imageUrl,
    required this.title,
    required this.explanation,
    required this.date,
  });

  @override
  List<Object> get props => [
        imageUrl,
        title,
        explanation,
        date,
      ];
}
