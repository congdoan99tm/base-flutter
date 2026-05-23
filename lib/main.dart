import 'package:base_flutter_2/app/application.dart';
import 'package:base_flutter_2/app/bootstrap.dart';

Future<void> main() async {
  await bootstrap(() => const Application());
}
