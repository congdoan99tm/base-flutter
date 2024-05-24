// import 'dart:io';

// // ignore: depend_on_referenced_packages
// import 'package:html/dom.dart';
// import 'package:package_info_plus/package_info_plus.dart';
// import 'package:upgrader/upgrader.dart';

// import '../utils/extensions/export.dart';
// import '../utils/extensions/obj_extension.dart';
// import '../utils/helpers/export.dart';
// import '../utils/helpers/url_launcher.dart';
// import '../utils/view/show_manager.dart';

// class AppVersionService {
//   Future<String?> getStoreVersion() async {
//     String? storeVersion;
//     final String bundleId =
//         Platform.isAndroid ? 'com.dinos.app' : 'com.dinos.dinosapp';
//     if (Platform.isAndroid) {
//       final PlayStoreSearchAPI playStoreSearchAPI = PlayStoreSearchAPI();
//       final Document? result =
//           await playStoreSearchAPI.lookupById(bundleId, country: 'US');
//       if (result != null) storeVersion = playStoreSearchAPI.version(result);
//     } else if (Platform.isIOS) {
//       final ITunesSearchAPI iTunesSearchAPI = ITunesSearchAPI();
//       final Map<dynamic, dynamic>? result =
//           await iTunesSearchAPI.lookupByBundleId(bundleId, country: 'US');
//       if (result != null) storeVersion = iTunesSearchAPI.version(result);
//     } else {
//       storeVersion = null;
//     }
//     return storeVersion;
//   }

//   Future<void> checkVersion() async {
//     if (!Platform.isAndroid && !Platform.isIOS) return;
//     try {
//       final String? storeVersion = await getStoreVersion();
//       if (storeVersion == null) return;

//       final PackageInfo packageInfo = await PackageInfo.fromPlatform();
//       final List<String> stores = storeVersion.split('.');
//       final List<String> cur = packageInfo.version.split('.');
//       final appId = Platform.isAndroid ? packageInfo.packageName : '6478364014';
//       final url = Platform.isAndroid
//           ? 'market://details?id=$appId'
//           : 'https://apps.apple.com/app/id$appId';

//       if (int.parse(stores[1]) > int.parse(cur[1])) {
//         ShowManager.showActionAlertDialog(
//           title: 'Đã có phiên bản mới',
//           content: 'Cập nhật ngay để có trải nghiệm tốt hơn',
//           actionTxt: 'Cập nhật',
//           onPressed: () => LaunchUtil.launch(url),
//           barrierDismissible: false,
//         );
//       } else if (int.parse(stores.last) > int.parse(cur.last)) {
//         ShowManager.showSnackBar(
//           'Đã có phiên bản mới',
//           onPressed: () => LaunchUtil.launch(url),
//           label: 'Cập nhật',
//         );
//       }
//     } catch (e) {
//       e.logE('check Version');
//     }
//   }
// }
