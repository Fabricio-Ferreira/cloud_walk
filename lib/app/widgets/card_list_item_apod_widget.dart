import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_walk_test/app/pages/home/view_model/list_apod_view_model.dart';
import 'package:cloud_walk_test/app/styles/app_color_scheme.dart';
import 'package:cloud_walk_test/app/styles/app_spacing.dart';
import 'package:cloud_walk_test/app/styles/app_text_style.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CardListItemApodWidget extends StatelessWidget {
  final ApodModel model;

  const CardListItemApodWidget({
    required this.model,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AutoSizeText(
              model.title,
              style: AppTextStyle.headlineLarge(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.s12),
              child: AutoSizeText(
                model.date,
                style: AppTextStyle.subHeadlineMedium(),
              ),
            ),
            AspectRatio(
              aspectRatio: 0.75 / 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl: model.imageUrl,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => Icon(
                    Icons.error_outline,
                    color: AppColorScheme.negativeText,
                  ),
                  fit: BoxFit.fitHeight,
                  filterQuality: FilterQuality.high,
                ),
              ),
            ),
          ],
        ),
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<ApodModel>('model', model));
  }
}
