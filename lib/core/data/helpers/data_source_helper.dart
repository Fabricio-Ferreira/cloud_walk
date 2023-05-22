import 'package:cloud_walk_test/app/helper/date_time_helper.dart';
import 'package:cloud_walk_test/app/pages/home/params/get_list_apod_params.dart';
import 'package:intl/intl.dart';

class DataSourceHelper {
  DataSourceHelper._();

  static Map<String, dynamic> getQuertyParameters(GetListApodParams params) {
    final Map<String, dynamic> queryParameters = {};
    if (params.dateInitial != null && params.dateFinal == null) {
      final endDate = DateTimeHelper.fromDateStringToString(
        date: DateTime.now().toString(),
        dateFormat: DateFormat('yyyy-MM-dd'),
      );
      final startDate = DateTimeHelper.fromDateStringToString(
        date: params.dateInitial.toString(),
        dateFormat: DateFormat('yyyy-MM-dd'),
      );
      queryParameters.addAll({'start_date': startDate, 'end_date': endDate});
      return queryParameters;
    } else if (params.dateFinal != null && params.dateInitial != null) {
      queryParameters.addAll({'start_date': params.dateInitial, 'end_date': params.dateInitial});
      return queryParameters;
    } else if (params.count != null && params.title.isEmpty) {
      queryParameters.addAll({'count': 10});
      return queryParameters;
    } else {
      queryParameters.addAll({'count': 100});
      return queryParameters;
    }
  }
}
