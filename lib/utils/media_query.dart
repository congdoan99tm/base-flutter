import 'package:flutter/material.dart';

class MediaQueryConfig {
  static late Size _size;
  static late EdgeInsets _padding;

  static void setMq(BuildContext context) {
    _size = MediaQuery.sizeOf(context);
    _padding = MediaQuery.paddingOf(context);
  }
}

Size get mqSize => MediaQueryConfig._size;
EdgeInsets get mqPadding => MediaQueryConfig._padding;