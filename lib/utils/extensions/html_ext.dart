// ignore_for_file: depend_on_referenced_packages

import 'package:html/parser.dart';

import 'export.dart';

extension HtmlExtension on String? {
  String parseHtmlToString() {
    if (isNull) return '';
    final document = parse(this);
    final String parsedString =
        parse(document.body!.text).documentElement!.text;

    return parsedString;
  }
}
