import 'dart:async';

import 'package:cloud_walk_test/app/helper/date_time_helper.dart';
import 'package:cloud_walk_test/app/mixin/base_bloc.dart';
import 'package:cloud_walk_test/app/pages/apod_details/apod_details_page.dart';
import 'package:cloud_walk_test/app/pages/apod_details/arguments/apod_details_arguments.dart';
import 'package:cloud_walk_test/app/pages/home/adapter/home_adapter.dart';
import 'package:cloud_walk_test/app/pages/home/params/get_list_apod_params.dart';
import 'package:cloud_walk_test/app/pages/home/view_model/list_apod_view_model.dart';
import 'package:cloud_walk_test/app/utils/widget_utils.dart';
import 'package:cloud_walk_test/core/data/model/app_exception.dart';
import 'package:cloud_walk_test/core/data/model/resource.dart';
import 'package:cloud_walk_test/core/domain/entity/apod_entity.dart';
import 'package:cloud_walk_test/core/domain/usecase/apod/get_list_apod_usecase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class HomeController extends AppGetXController {
  final GetListApodUsecase _getListApodUsecase;

  HomeController(this._getListApodUsecase);

  final state = const Resource<ListApodViewModel>.loading().obs;
  final scrollController = ScrollController();
  final textEditingController = TextEditingController();
  final dateInitialEditingController = TextEditingController();
  final dateFinalEditingController = TextEditingController();
  final dateMaskFormatter = MaskTextInputFormatter(
    mask: '##/##/####',
    filter: {'#': RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );
  final int requestCount = 100;
  int requestOffset = 10;
  bool didFetchAllItems = false;
  final isLoading = false.obs;
  final _showSearchBar = false.obs;
  Timer? _debounce;

  @override
  Future<void> onInit() async {
    super.onInit();
    scrollController.addListener(_didScrollToBottom);
    await _getList();
  }

  bool get showSearchBar => _showSearchBar.value;

  void onShowSearchBar() => _showSearchBar.toggle();

  Future _getList({bool reset = false}) async {
    if (reset) {
      state.value = state.value.copyWith(data: const ListApodViewModel(listApods: []));
      state.value = const Resource.loading();
    }

    final validateDateInitial =
        DateTimeHelper.validatorCalendarDate(date: dateInitialEditingController.text);

    final validateDateFinal =
        DateTimeHelper.validatorCalendarDate(date: dateFinalEditingController.text);

    if (validateDateInitial != null || validateDateFinal != null) {
      final err = AppException(
        title: 'Erro',
        description: validateDateInitial ?? validateDateFinal,
      );
      state.value = Resource.failed(error: err);
      return;
    }

    final params = GetListApodParams(
      count: requestCount,
      offset: requestOffset,
      title: textEditingController.text,
      dateInitial: dateInitialEditingController.text.isNotEmpty
          ? DateTimeHelper.converterDate(
              date: dateInitialEditingController.text,
            )
          : null,
      dateFinal: dateFinalEditingController.text.isNotEmpty
          ? DateTimeHelper.converterDate(
              date: dateFinalEditingController.text,
            )
          : null,
    );
    final result = await _getListApodUsecase(params);
    result.fold(_handleError, (list) => _handleSuccess(list, reset: reset));
  }

  void _handleError(Exception error) {
    final err = AppException(
      title: 'Erro',
      description: error.toString(),
    );

    _reset();
    state.value = Resource.failed(error: err);
  }

  void _handleSuccess(List<ApodEntity> list, {required bool reset}) {
    if (list.isEmpty) {
      _reset();
      return;
    }

    final models = reset ? <ApodModel>[] : state.value.data?.listApods ?? [];

    final model = HomeAdapter.toviewModel(list);
    state.value = Resource.success(data: ListApodViewModel(listApods: models + model.listApods));
    isLoading.value = false;
    if (list.length == requestCount) {
      requestOffset += requestCount;
    } else {
      didFetchAllItems = true;
    }
  }

  Future<void> onRefresh() async {
    _reset();
    await _getList(reset: true);
  }

  Future<void> onSearch() async {
    await _getList(reset: true);
  }

  void onReset() => _reset();

  void _didScrollToBottom() {
    WidgetUtils.hideKeyboard(Get.context);
    _showSearchBar.value = false;
    if (scrollController.position.atEdge) {
      if (scrollController.position.pixels > 0) {
        isLoading.value = true;
        _getList();
      }
    }
  }

  void _reset() {
    requestOffset = 0;
    didFetchAllItems = false;
    _showSearchBar.value = false;
    dateFinalEditingController.clear();
    dateInitialEditingController.clear();
    textEditingController.clear();
  }

  void onSearchDebounce(String text) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(
      const Duration(milliseconds: 1000),
      () {
        if (text.isEmpty || text.length <= 1) {
          return;
        } else {
          _searchApods(text);
        }
      },
    );
  }

  Future<void> _searchApods(String text) async {
    await _getList(reset: true);
  }

  void onTapModel(ApodModel model) {
    final args = ApodDetailsArguments(
      date: model.date,
      title: model.title,
      explanation: model.explanation,
      imageUrl: model.imageUrl,
    );

    ApodDetailsPage.navigateWith(arguments: args);
  }
}
