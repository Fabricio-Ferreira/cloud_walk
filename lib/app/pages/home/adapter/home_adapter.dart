import 'package:cloud_walk_test/app/helper/date_time_helper.dart';
import 'package:cloud_walk_test/app/pages/home/view_model/list_apod_view_model.dart';
import 'package:cloud_walk_test/core/domain/entity/apod_entity.dart';
import 'package:intl/intl.dart';

class HomeAdapter {
  HomeAdapter._();

  static ListApodViewModel toviewModel(List<ApodEntity> list) {
    if (list.isEmpty) return const ListApodViewModel(listApods: []);

    final listModel = list
        .map(
          (e) => ApodModel(
            imageUrl: e.imageUrl,
            title: e.title,
            explanation: e.explanation,
            date: DateTimeHelper.fromDateStringToString(
              date: e.date,
              dateFormat: DateFormat('dd/MM/yyyy'),
            ),
          ),
        )
        .toList();

    return ListApodViewModel(listApods: listModel);
  }
}
