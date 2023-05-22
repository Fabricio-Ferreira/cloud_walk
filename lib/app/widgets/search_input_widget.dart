import 'package:cloud_walk_test/app/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchInputWidget extends GetView<HomeController> {
  const SearchInputWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: _buildContent(),
      );

  Widget _buildContent() => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: controller.textEditingController,
            onChanged: (value) => controller.onSearchDebounce(value),
            decoration: const InputDecoration(
              hintText: 'Digite o titulo do Apod',
              suffixIcon: Icon(Icons.search_outlined),
            ),
          ),
          TextField(
            controller: controller.dateInitialEditingController,
            inputFormatters: [controller.dateMaskFormatter],
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(
              hintText: 'Escolha uma data inicial',
              suffixIcon: Icon(Icons.calendar_month_outlined),
            ),
          ),
          TextField(
            controller: controller.dateFinalEditingController,
            inputFormatters: [controller.dateMaskFormatter],
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(
              hintText: 'Escollha uma data final',
              suffixIcon: Icon(Icons.calendar_month_outlined),
            ),
          ),
        ],
      );
}
