import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/router.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final String title;
  final Color bgColor;
  final List<Widget> actions;
  final Widget? leading;
  const DefaultAppBar({
    super.key,
    this.title = '',
    this.height = kToolbarHeight,
    this.bgColor = Colors.white,
    this.actions = const [],
    this.leading,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: bgColor,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      elevation: 0,
      leading: leading ??
          GestureDetector(
              onTap: pop,
              child: Container(
                color: Colors.transparent,
                padding: const EdgeInsets.all(12),
                child: const Icon(Icons.arrow_back_ios),
              )),
      centerTitle: true,
      actions: actions,
      title: Text(title),
    );
  }
}
