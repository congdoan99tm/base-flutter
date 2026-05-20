import 'package:flutter/material.dart';

mixin BaseLifecycleMixin<C> {
  void onInit(BuildContext context, C cubit) {}

  void onReady(BuildContext context, C cubit) {}

  void onDispose(C cubit) {}

  void onInactive() {}

  void onPaused() {}

  void onResumed() {}

  void onDetached() {}

  void onHidden() {}
}

mixin AppLifecycleObserverMixin<Page extends StatefulWidget, C>
    on State<Page>, WidgetsBindingObserver {
  BaseLifecycleMixin<C> get lifecycle;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.inactive:
        lifecycle.onInactive();
        break;
      case AppLifecycleState.paused:
        lifecycle.onPaused();
        break;
      case AppLifecycleState.resumed:
        lifecycle.onResumed();
        break;
      case AppLifecycleState.detached:
        lifecycle.onDetached();
        break;
      case AppLifecycleState.hidden:
        lifecycle.onHidden();
        break;
    }
  }
}
