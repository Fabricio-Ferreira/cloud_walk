import 'package:cloud_walk_test/app/pages/apod_details/arguments/apod_details_arguments.dart';
import 'package:cloud_walk_test/app/pages/apod_details/view_model/apod_details_view_model.dart';

class ApodDetailsAdapter {
  ApodDetailsAdapter._();

  static ApodDetailsViewModel toModel(ApodDetailsArguments args) => ApodDetailsViewModel(
        title: args.title,
        date: args.date,
        explanation: args.explanation,
        imageUrl: args.imageUrl,
      );
}
