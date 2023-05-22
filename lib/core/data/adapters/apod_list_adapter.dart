import 'package:cloud_walk_test/core/domain/entity/apod_entity.dart';

class ApodListAdapter extends ApodEntity {
  const ApodListAdapter({
    required String date,
    required String explanation,
    required String title,
    required String url,
  }) : super(
          date: date,
          explanation: explanation,
          title: title,
          imageUrl: url,
        );

  factory ApodListAdapter.fromJson(Map<String, dynamic> json) => ApodListAdapter(
        date: json['date'],
        explanation: json['explanation'],
        title: json['title'],
        url: json['url'],
      );
}
