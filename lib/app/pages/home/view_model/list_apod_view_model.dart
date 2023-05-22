// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class ListApodViewModel extends Equatable {
  final List<ApodModel> listApods;

  const ListApodViewModel({
    required this.listApods,
  });

  @override
  List<Object> get props => [listApods];

  ListApodViewModel copyWith({
    List<ApodModel>? listApods,
  }) =>
      ListApodViewModel(
        listApods: listApods ?? this.listApods,
      );
}

class ApodModel {
  final String imageUrl;
  final String title;
  final String explanation;
  final String date;

  ApodModel({
    required this.imageUrl,
    required this.title,
    required this.explanation,
    required this.date,
  });
}
