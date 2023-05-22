import 'package:equatable/equatable.dart';

class ApodDetailsViewModel extends Equatable {
  final String title;
  final String date;
  final String explanation;
  final String imageUrl;

  const ApodDetailsViewModel({
    required this.title,
    required this.date,
    required this.explanation,
    required this.imageUrl,
  });

  ApodDetailsViewModel copyWith({
    String? title,
    String? date,
    String? explanation,
    String? imageUrl,
  }) =>
      ApodDetailsViewModel(
        title: title ?? this.title,
        date: date ?? this.date,
        explanation: explanation ?? this.explanation,
        imageUrl: imageUrl ?? this.imageUrl,
      );

  @override
  List<Object> get props => [title, date, explanation, imageUrl];
}
