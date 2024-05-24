import 'package:cupertino_back_gesture/cupertino_back_gesture.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'constant/export.dart';
import 'core/router.dart';
import 'utils/helpers/remove_scroll_glow.dart';
import 'utils/media_query.dart';

class Application extends StatefulWidget {
  const Application(this.initialRoute, {super.key});
  final String initialRoute;
  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> with WidgetsBindingObserver {
  AppLifecycleState previousState = AppLifecycleState.resumed;
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      if (previousState == AppLifecycleState.paused) {}
    } else {}
    if (state != AppLifecycleState.inactive) {
      previousState = state;
    }
  }

  @override
  void initState() {
    setSystemUIOverlay();
    super.initState();
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  Future<void> setSystemUIOverlay() async {
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    await SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [
        SystemUiOverlay.top,
        SystemUiOverlay.bottom,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryConfig.setMq(context);
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => BackGestureWidthTheme(
        backGestureWidth: BackGestureWidth.fraction(1 / 2),
        child: MaterialApp(
          navigatorKey: MyRouter.navKey,
          title: Strings.kAppName,
          scrollBehavior: const CustomScrollBehavior(),
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          debugShowCheckedModeBanner: true,
          // initialRoute: widget.initialRoute,
          onGenerateRoute: MyRouter.onGenerateRoutes,
          builder: (context, child) => Overlay(
            initialEntries: [
              if (child != null) OverlayEntry(builder: (context) => child),
            ],
          ),
          home: const Scaffold(),
        ),
      ),
    );
  }
}
