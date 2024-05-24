// ignore_for_file: unused_element

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyRouter {
  static final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();
  static NavigatorState? get state => navKey.currentState;
  static BuildContext? get context => navKey.currentContext;

  static Route? onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      default:
    }
    return null;
  }

  static Route<dynamic> _materialRoute(Widget view, RouteSettings? settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => view,
    );
  }

  static Route<dynamic> _cupertinoRoute(Widget view, RouteSettings? settings) {
    return CupertinoPageRoute(
      settings: settings,
      builder: (_) => view,
    );
  }
}

Future? pushName({required String routeName, Object? arg}) =>
    MyRouter.state?.pushNamed(routeName, arguments: arg);

Future? contextPush(Widget view, BuildContext context) =>
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => view));

Future? pushNamedAndRemoveUntil({required String routeName, Object? arg}) =>
    MyRouter.state!.pushNamedAndRemoveUntil(
      routeName,
      (Route<dynamic> route) => false,
      arguments: arg,
    );

void pop() => MyRouter.state?.pop();

void popUtil() => MyRouter.state?.popUntil((route) => route.isFirst);
