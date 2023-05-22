import 'package:cloud_walk_test/app/mixin/base_bloc.dart';
import 'package:cloud_walk_test/app/pages/apod_details/adapter/apod_details_adapter.dart';
import 'package:cloud_walk_test/app/pages/apod_details/arguments/apod_details_arguments.dart';
import 'package:cloud_walk_test/app/pages/apod_details/view_model/apod_details_view_model.dart';
import 'package:cloud_walk_test/app/utils/try_cast.dart';
import 'package:cloud_walk_test/core/data/model/resource.dart';
import 'package:get/get.dart';

class ApodDetailsController extends AppGetXController {
  final state = const Resource<ApodDetailsViewModel>.loading().obs;

  late ApodDetailsArguments arguments;

  @override
  Future<void> onInit() async {
    super.onInit();
    final _args = tryCast<ApodDetailsArguments>(Get.arguments);
    if (_args != null) {
      arguments = _args;
      final model = ApodDetailsAdapter.toModel(arguments);
      state.value = Resource.success(data: model);
    } else {
      state.value = const Resource.failed();
    }
  }
}
