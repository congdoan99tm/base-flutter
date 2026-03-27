import 'dart:io';
import 'package:mason/mason.dart';

void run(HookContext context) {
  final featureName = context.vars['name'] as String;
  final dir = Directory('lib/features/$featureName');

  if (dir.existsSync()) {
    context.logger.err(
      'Feature "$featureName" already exists. Generation aborted.',
    );
    exit(1); // dừng luôn, không hỏi overwrite
  }
}
