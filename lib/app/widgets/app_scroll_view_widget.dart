import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppScrollViewWidget extends StatelessWidget {
  final Future<void> Function() onRefresh;
  final ScrollController? scrollController;
  final NullableIndexedWidgetBuilder itemBuilder;
  final EdgeInsetsGeometry? padding;
  final int childCount;
  final List<Widget> otherSlivers;
  final ScrollPhysics physics;

  const AppScrollViewWidget({
    required this.onRefresh,
    required this.itemBuilder,
    required this.childCount,
    Key? key,
    this.scrollController,
    this.otherSlivers = const [],
    this.padding,
    this.physics = const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return RefreshIndicator(
        onRefresh: onRefresh,
        child: _buildSliverList(showIOSRefresh: false),
      );
    } else if (Platform.isIOS) {
      return _buildSliverList(showIOSRefresh: true);
    }
    return const SizedBox();
  }

  Widget _buildSliverList({required bool showIOSRefresh}) {
    final _sliverList = SliverList(
      delegate: SliverChildBuilderDelegate(
        itemBuilder,
        childCount: childCount,
      ),
    );
    final _padding = padding;
    final slivers = <Widget>[];

    if (showIOSRefresh) slivers.add(CupertinoSliverRefreshControl(onRefresh: onRefresh));
    if (_padding != null) {
      slivers.add(SliverPadding(
        padding: _padding,
        sliver: _sliverList,
      ));
    } else {
      slivers.add(_sliverList);
    }

    slivers.addAll(otherSlivers);

    return Scrollbar(
      controller: scrollController,
      child: CustomScrollView(
        controller: scrollController,
        physics: physics,
        slivers: slivers,
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ObjectFlagProperty<VoidCallback>.has('onRefresh', onRefresh));
    properties.add(DiagnosticsProperty<ScrollController?>('scrollController', scrollController));
    properties
        .add(ObjectFlagProperty<NullableIndexedWidgetBuilder>.has('itemBuilder', itemBuilder));
    properties.add(IntProperty('childCount', childCount));
    properties.add(DiagnosticsProperty<EdgeInsetsGeometry?>('padding', padding));
    properties.add(DiagnosticsProperty<ScrollPhysics>('physics', physics));
  }
}
