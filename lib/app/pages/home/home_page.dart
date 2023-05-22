import 'package:cloud_walk_test/app/pages/home/view_model/list_apod_view_model.dart';
import 'package:cloud_walk_test/app/styles/app_spacing.dart';
import 'package:cloud_walk_test/app/widgets/app_divider_widget.dart';
import 'package:cloud_walk_test/app/widgets/app_scroll_view_widget.dart';
import 'package:cloud_walk_test/app/widgets/card_list_item_apod_widget.dart';
import 'package:cloud_walk_test/app/widgets/resource_widget.dart';
import 'package:cloud_walk_test/app/widgets/search_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue.shade900,
          title: const Text('Astronomy Picture of the Day'),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.search_outlined),
              onPressed: controller.onShowSearchBar,
            ),
          ],
        ),
        body: SafeArea(
          top: false,
          child: Container(
            child: Obx(
              () => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (controller.showSearchBar == true) ...[
                    const SearchInputWidget(),
                    AppDividerWidget(),
                  ],
                  Expanded(
                    child: Obx(
                      () => ResourceWidget(
                        resource: controller.state.value,
                        onLoading: (_) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        onSuccess: _buildSuccess,
                        onError: (error, _) => Center(
                          child: Text(
                            error.description,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Obx(() => controller.isLoading.value == true
            ? SafeArea(
                child: Container(
                  color: Colors.transparent,
                  padding: const EdgeInsets.fromLTRB(
                    AppSpacing.s20,
                    AppSpacing.s12,
                    AppSpacing.s20,
                    AppSpacing.s20,
                  ),
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Center(
                        child: CircularProgressIndicator(),
                      )
                    ],
                  ),
                ),
              )
            : const SizedBox.shrink()),
      );

  Widget _buildSuccess(ListApodViewModel data) => AppScrollViewWidget(
        scrollController: controller.scrollController,
        onRefresh: controller.onRefresh,
        childCount: data.listApods.length,
        itemBuilder: (_, index) => _buildApod(data.listApods[index]),
      );

  Widget _buildApod(ApodModel model) => CardListItemApodWidget(model: model);
}
