import 'package:url_launcher/url_launcher.dart';

class LaunchUtil {
  LaunchUtil._internal();
  factory LaunchUtil() {
    return _i;
  }
  static final LaunchUtil _i = LaunchUtil._internal();

  static Future<void> launch(String? url) async {
    if (url == null) return;

    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      if (url.contains('youtube.com')) {
        final uriYoutube = Uri.parse(url.replaceAll('www', 'm'));
        await launchUrl(uriYoutube, mode: LaunchMode.externalApplication);
      } else {
        await launchUrl(uri);
      }
    }
  }
}
