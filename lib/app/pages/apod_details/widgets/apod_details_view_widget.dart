import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_walk_test/app/pages/apod_details/view_model/apod_details_view_model.dart';
import 'package:cloud_walk_test/app/styles/app_spacing.dart';
import 'package:cloud_walk_test/app/styles/app_text_style.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApodDetailsViewWidget extends StatelessWidget {
  final ApodDetailsViewModel model;

  const ApodDetailsViewWidget({
    required this.model,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.s16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: Get.height * 0.35,
              child: CachedNetworkImage(
                imageUrl: model.imageUrl,
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
              ),
            ),
            const SizedBox(height: AppSpacing.s8),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.s16,
                    vertical: AppSpacing.s8,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        model.title,
                        style: AppTextStyle.headlineLarge(),
                      ),
                      const SizedBox(height: AppSpacing.s8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            model.date,
                            style: AppTextStyle.subHeadlineMedium(),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppSpacing.s8),
                      Text(
                        model.explanation,
                        style: AppTextStyle.bodyTextLarge(),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<ApodDetailsViewModel>('model', model));
  }
}
