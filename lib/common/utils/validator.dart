import 'package:base_flutter_2/common/extensions/string.dart';
import 'package:flutter/material.dart';
import 'package:base_flutter_2/l10n/generated/app_localizations.dart';

String? emailValidator(String? email, [BuildContext? context]) {
  if (email.emptyOrNull()) {
    return _localizedMessage(
      context,
      fallbackVi: 'Email không được để trống',
      resolve: (l10n) => l10n.emailEmptyInvalid,
    );
  }

  final regex = RegExp(
    r"^(?![.-])(?!.*[_.]{2})[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$",
  );
  return regex.hasMatch(email!) ? null : _localizedMessage(
    context,
    fallbackVi: 'Email không hợp lệ',
    resolve: (l10n) => l10n.emailInvalid,
  );
}

String? passwordValidator(String? password, [BuildContext? context]) {
  if (password.emptyOrNull()) {
    return _localizedMessage(
      context,
      fallbackVi: 'Mật khẩu không được để trống',
      resolve: (l10n) => l10n.passEmptyInvalid,
    );
  }

  if (password!.length < 6) {
    return _localizedMessage(
      context,
      fallbackVi: 'Mật khẩu phải có ít nhất 6 ký tự',
      resolve: (l10n) => l10n.passLengthInvalid,
    );
  }

  final regex = RegExp(
    r'^(?=.*[A-Za-z\d@$!%^&*()_+{}\[\]:;<>,.?~\\-])[A-Za-z\d@$!%^&*()_+{}\[\]:;<>,.?~\\-]{6,}$',
  );
  return regex.hasMatch(password) ? null : _localizedMessage(
    context,
    fallbackVi: 'Mật khẩu không hợp lệ',
    resolve: (l10n) => l10n.passInvalid,
  );
}

String? emptyValidator(String? value, {String? msg, BuildContext? context}) {
  if (value.emptyOrNull()) {
    return msg ??
        _localizedMessage(
          context,
          fallbackVi: 'Trường này không được để trống',
          resolve: (l10n) => l10n.emptyValid,
        );
  }
  return null;
}

String? phoneValidator(String? v, [BuildContext? context]) {
  if (v.emptyOrNull()) {
    return _localizedMessage(
      context,
      fallbackVi: 'Số điện thoại không được để trống',
      resolve: (l10n) => l10n.phoneEmptyInvalid,
    );
  }

  if (v!.length < 9 || v.length > 12) {
    return _localizedMessage(
      context,
      fallbackVi: 'Số điện thoại phải có từ 9 đến 12 chữ số',
      resolve: (l10n) => l10n.phoneLengthInvalid,
    );
  }

  if (int.tryParse(v) == null) {
    return _localizedMessage(
      context,
      fallbackVi: 'Số điện thoại không hợp lệ',
      resolve: (l10n) => l10n.phoneInvalid,
    );
  }
  return null;
}

String? otpValidate(String? v, [BuildContext? context]) {
  if (v.emptyOrNull()) {
    return _localizedMessage(
      context,
      fallbackVi: 'Mã OTP không được để trống',
      resolve: (l10n) => l10n.otpEmptyInvalid,
    );
  }

  if (int.tryParse(v ?? '') == null) {
    return _localizedMessage(
      context,
      fallbackVi: 'Mã OTP không hợp lệ',
      resolve: (l10n) => l10n.otpInvalid,
    );
  }

  if (v!.length < 4) {
    return _localizedMessage(
      context,
      fallbackVi: 'Mã OTP có độ dài 4 ký tự',
      resolve: (l10n) => l10n.otpLengthInvalid,
    );
  }
  return null;
}

bool isValidate(GlobalKey<FormState> key) {
  return key.currentState?.validate() ?? false;
}

String _localizedMessage(
  BuildContext? context, {
  required String fallbackVi,
  required String Function(AppLocalizations l10n) resolve,
}) {
  if (context == null) return fallbackVi;
  final l10n = AppLocalizations.of(context);
  if (l10n == null) return fallbackVi;
  return resolve(l10n);
}
