import 'dart:io';

import 'package:app_settings/app_settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/router.dart';
import '../../widgets/export.dart';
import 'export.dart';

class ShowManager {
  const ShowManager._();

  static void showToast(String msg,
      {bool isSuccess = false, bool multiLine = false}) {
    final FToast fToast = FToast().init(MyRouter.context!);
    if (isSuccess) {
      fToast.showToast(
        child: ToastWidget(
          isMultiLine: multiLine,
          text: msg,
          bgColor: Colors.green,
          iconData: Icons.check,
        ),
        gravity: ToastGravity.TOP,
        toastDuration: const Duration(seconds: 3),
      );
    } else {
      fToast.showToast(
        child: ToastWidget(
          text: msg,
          isMultiLine: multiLine,
        ),
        gravity: ToastGravity.TOP,
        toastDuration: const Duration(seconds: 3),
      );
    }
  }

  static void showSnackBar(String content,
      {BuildContext? context, void Function()? onPressed, String? label}) {
    final snackBar = SnackBar(
      backgroundColor: Colors.blue,
      behavior: SnackBarBehavior.floating,
      content: Text(content),
      duration: const Duration(seconds: 4),
      action: onPressed == null
          ? null
          : SnackBarAction(
              label: label ?? '',
              onPressed: onPressed,
              textColor: Colors.white,
            ),
    );
    ScaffoldMessenger.of(context ?? MyRouter.context!).showSnackBar(snackBar);
  }

  static Future<void> showImageActionSheet({
    required Function(File file) onPicked,
    String title = '',
    BuildContext? context,
  }) async {
    showCupertinoModalPopup<void>(
      context: context ?? MyRouter.context!,
      builder: (BuildContext context) => CupertinoTheme(
        data: const CupertinoThemeData(
            brightness: Brightness.light,
            scaffoldBackgroundColor: Colors.white),
        child: CupertinoActionSheet(
          // message: title.isEmpty ? null : Text(title, style: inter500.grey600),
          actions: <CupertinoActionSheetAction>[
            CupertinoActionSheetAction(
              onPressed: () async {
                final access =
                    await PickerUtil.permissionCamera(ImageSource.camera);
                if (!access) {
                  showActionAlertDialog(
                    title: 'Thông báo',
                    content: 'Vui lòng cấp phép trong cài đặt điện thoại',
                    actionTxt: 'Cài đặt',
                    onPressed: () {
                      AppSettings.openAppSettings(
                          type: AppSettingsType.settings);
                    },
                  );
                  return;
                }
                await PickerUtil.getImage(ImageSource.camera, (file) {
                  onPicked(file);
                });
                pop();
              },
              child: const Text(
                'Camera',
              ),
            ),
            CupertinoActionSheetAction(
              onPressed: () async {
                final access =
                    await PickerUtil.permissionCamera(ImageSource.gallery);
                if (!access) {
                  showActionAlertDialog(
                    title: 'Thông báo',
                    content: 'Vui lòng cấp phép trong cài đặt điện thoại',
                    actionTxt: 'Cài đặt',
                    onPressed: () {
                      AppSettings.openAppSettings(
                          type: AppSettingsType.settings);
                    },
                  );
                  return;
                }
                await PickerUtil.getImage(ImageSource.gallery, (file) {
                  onPicked(file);
                });
                pop();
              },
              child: const Text(
                'Thư viện',
              ),
            ),
          ],
          cancelButton: const CupertinoActionSheetAction(
            onPressed: pop,
            child: Text('Huỷ'),
          ),
        ),
      ),
    );
  }

  static Future<void> showPickImageDialog({
    required Function(File file) onPicked,
    String title = 'Chọn ảnh từ',
    BuildContext? context,
  }) async {
    showCupertinoDialog<void>(
      context: context ?? MyRouter.context!,
      useRootNavigator: false,
      builder: (BuildContext context) => CupertinoAlertDialog(
        // message: title.isEmpty ? null : Text(title, style: inter500.grey600),
        title: Text(title),
        // content: ,
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            onPressed: () async {
              final access =
                  await PickerUtil.permissionCamera(ImageSource.camera);
              if (!access) {
                showActionAlertDialog(
                  title: 'Thông báo',
                  content: 'Vui lòng cấp phép trong cài đặt điện thoại',
                  actionTxt: 'Cài đặt',
                  onPressed: () {
                    AppSettings.openAppSettings(type: AppSettingsType.settings);
                  },
                );
                return;
              }
              await PickerUtil.getImage(ImageSource.camera, (file) {
                onPicked(file);
              });
              pop();
            },
            child: const Text('Camera'),
          ),
          CupertinoDialogAction(
            onPressed: () async {
              final access =
                  await PickerUtil.permissionCamera(ImageSource.gallery);
              if (!access) {
                showActionAlertDialog(
                  title: 'Thông báo',
                  content: 'Vui lòng cấp phép trong cài đặt điện thoại',
                  actionTxt: 'Cài đặt',
                  onPressed: () {
                    AppSettings.openAppSettings(type: AppSettingsType.settings);
                  },
                );
                return;
              }
              await PickerUtil.getImage(ImageSource.gallery, (file) {
                onPicked(file);
              });
              pop();
            },
            child: const Text('Thư viện'),
          ),
          const CupertinoDialogAction(
            onPressed: pop,
            child: Text('Huỷ'),
          )
        ],
      ),
    );
  }

  static void showAlertDialog({
    required String title,
    required String content,
    BuildContext? context,
  }) {
    showCupertinoDialog<void>(
      // useRootNavigator: true,
      context: context ?? MyRouter.context!,
      // barrierColor: Colors.black.withOpacity(0.2),
      builder: (BuildContext context) => Theme(
        data: ThemeData.light(),
        child: CupertinoAlertDialog(
          title: Text(title),
          content: Text(content),
          actions: const <CupertinoDialogAction>[
            CupertinoDialogAction(
              isDestructiveAction: true,
              onPressed: pop,
              child: Text('Đóng'),
            ),
          ],
        ),
      ),
    );
  }

  static void showActionAlertDialog({
    required String title,
    required String content,
    required String actionTxt,
    void Function() onPressed = pop,
    BuildContext? context,
    bool barrierDismissible = true,
  }) {
    showCupertinoDialog<void>(
      // useRootNavigator: true,
      barrierDismissible: barrierDismissible,
      context: context ?? MyRouter.context!,
      // barrierColor: Colors.black.withOpacity(0.2),
      builder: (BuildContext _) => Theme(
        data: ThemeData.light(),
        child: CupertinoAlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <CupertinoDialogAction>[
            const CupertinoDialogAction(
              isDestructiveAction: true,
              onPressed: pop,
              child: Text('Huỷ'),
            ),
            CupertinoDialogAction(
              isDestructiveAction: false,
              onPressed: onPressed,
              child: Text(
                actionTxt,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
