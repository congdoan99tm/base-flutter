import 'dart:io';

import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../extensions/export.dart';

class PickerUtil {
  PickerUtil._();

  static Future getImage(ImageSource source, Function(File file) cb) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imageTemporary = File(image.path);
      cb(imageTemporary);
    } on PlatformException catch (e) {
      e.logE('Failed to pick image');
    }
  }

  static Future<bool> permissionCamera(ImageSource imageSource) async {
    final permission = await ((imageSource == ImageSource.camera)
            ? Permission.camera
            : Platform.isIOS
                ? Permission.photos
                : Permission.mediaLibrary)
        .request();
    return permission.isGranted || permission.isLimited;
  }
}
