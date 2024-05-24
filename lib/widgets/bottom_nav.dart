import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../constant/export.dart';
import '../utils/media_query.dart';

class BottomNavWidget extends StatefulWidget {
  const BottomNavWidget({required this.onTapItem, super.key});
  final void Function(int index) onTapItem;
  @override
  State<BottomNavWidget> createState() => _BottomNavWidgetState();
}

class _BottomNavWidgetState extends State<BottomNavWidget> {
  final bool show = true;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 111),
      height: show ? (mqPadding.bottom + 56.h) : 0.0,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 5,
          blurRadius: 7,
          offset: const Offset(0, 3),
        ),
      ]),
      child: ClipRRect(
          // borderRadius: BorderRadius.only(
          //     topLeft: Radius.circular(12), topRight: Radius.circular(12)),
          child: SalomonBottomBar(
        backgroundColor: Colors.white.withOpacity(0.95),
        currentIndex: 0,
        onTap: widget.onTapItem,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: [
          SalomonBottomBarItem(
            icon: SizedBox(
              width: 24.h,
              child: Assets.svgs.bottomBar.home.svg(fit: BoxFit.cover),
            ),
            activeIcon: SizedBox(
              width: 24.h,
              child: Assets.svgs.bottomBar.home.svg(
                  fit: BoxFit.cover,
                  colorFilter: const ColorFilter.mode(
                      AppColors.primary, BlendMode.srcIn)),
            ),
            title: const Text('Trang chủ'),
            selectedColor: AppColors.primary,
          ),
          SalomonBottomBarItem(
            icon: SizedBox(
              width: 24.h,
              child: Assets.svgs.bottomBar.news.svg(fit: BoxFit.cover),
            ),
            activeIcon: SizedBox(
              width: 24.h,
              child: Assets.svgs.bottomBar.news.svg(
                  fit: BoxFit.cover,
                  colorFilter: const ColorFilter.mode(
                      AppColors.primary, BlendMode.srcIn)),
            ),
            title: const Text('Bản tin'),
          ),
          SalomonBottomBarItem(
            icon: SizedBox(
              width: 24.h,
              child: Assets.svgs.bottomBar.report.svg(fit: BoxFit.cover),
            ),
            activeIcon: SizedBox(
              width: 24.h,
              child: Assets.svgs.bottomBar.report.svg(
                  fit: BoxFit.cover,
                  colorFilter: const ColorFilter.mode(
                      AppColors.primary, BlendMode.srcIn)),
            ),
            title: const Text('Báo cáo'),
          ),
          SalomonBottomBarItem(
            icon: SizedBox(
              width: 24.h,
              child: Assets.svgs.bottomBar.account.svg(fit: BoxFit.cover),
            ),
            activeIcon: SizedBox(
              width: 24.h,
              child: Assets.svgs.bottomBar.account.svg(
                  fit: BoxFit.cover,
                  colorFilter:
                      const ColorFilter.mode(Colors.blue, BlendMode.srcIn)),
            ),
            title: const Text('Tài khoản'),
          ),
        ],
      )),
    );
  }
}
