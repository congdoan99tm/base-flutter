import 'package:flutter/material.dart';

import '../constant/export.dart';
import 'appbars/sliver_appbar.dart';

class SliverDivider extends StatelessWidget {
  const SliverDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      floating: false,
      pinned: false,
      delegate: SliverAppBarDelegate(
        minHeight: 8,
        maxHeight: 8,
        child: Container(
          height: 8,
          width: double.maxFinite,
          color: AppColors.grey100,
        ),
      ),
    );
  }
}

class MyDivider extends StatelessWidget {
  const MyDivider({super.key, this.height = 8});
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.maxFinite,
      color: AppColors.grey100,
    );
  }
}
