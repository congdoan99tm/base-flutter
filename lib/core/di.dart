import 'package:get_it/get_it.dart';

import 'dio.dart';

final getIt = GetIt.instance;

//* Register Service before Repo.

Future<void> registerDependencies() async {
  _registerHiveTypeAdapters();
  getIt.registerSingleton(DioRequest());
}

void _registerHiveTypeAdapters() {}
