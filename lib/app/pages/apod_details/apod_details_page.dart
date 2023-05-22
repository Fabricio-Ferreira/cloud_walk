import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_walk_test/app/pages/apod_details/arguments/apod_details_arguments.dart';
import 'package:cloud_walk_test/app/pages/apod_details/view_model/apod_details_view_model.dart';
import 'package:cloud_walk_test/app/pages/apod_details/widgets/apod_details_view_widget.dart';
import 'package:cloud_walk_test/app/routes/app_routes_enum.dart';
import 'package:cloud_walk_test/app/styles/app_spacing.dart';
import 'package:cloud_walk_test/app/widgets/resource_widget.dart';
import 'package:cloud_walk_test/core/data/model/app_exception.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './apod_details_controller.dart';

class ApodDetailsPage extends GetView<ApodDetailsController> {
  const ApodDetailsPage({Key? key}) : super(key: key);

  static Future? navigateWith({required ApodDetailsArguments? arguments}) => Get.toNamed(
        AppRoutes.details.path,
        arguments: arguments,
      );

  @override
  Widget build(BuildContext context) => Obx(
        () => ResourceWidget(
          resource: controller.state.value,
          onLoading: (_) => _buildLoading(),
          onSuccess: _buildSuccess,
          onError: (error, _) => _buildError(error),
        ),
      );

  Widget _buildSuccess(ApodDetailsViewModel data) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue.shade900,
          centerTitle: true,
          title: FittedBox(
            child: AutoSizeText(data.title),
          ),
        ),
        body: SafeArea(
          top: false,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.s12,
              vertical: AppSpacing.s8,
            ),
            child: ApodDetailsViewWidget(model: data),
          ),
        ),
      );

  Widget _buildLoading() => const Center(
        child: CircularProgressIndicator(),
      );

  Widget _buildError(AppException error) => Center(
        child: Text(
          error.description,
        ),
      );
}
