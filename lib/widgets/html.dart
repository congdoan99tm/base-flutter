import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../utils/helpers/url_launcher.dart';

class CustomHtml extends StatelessWidget {
  const CustomHtml({required this.html, super.key});
  final String html;
  @override
  Widget build(BuildContext context) {
    return Html(
      data: html,
      style: {'body': Style.fromTextStyle(const TextStyle(height: 1.4))},
      onLinkTap: (url, attributes, element) {
        LaunchUtil.launch(url);
      },
    );
  }
}
