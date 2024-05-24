extension StringExtension on String {
  String capitalize() {
    return (length > 0) ? '${this[0].toUpperCase()}${substring(1)}' : this;
  }

  String truncateTo(int maxLength) {
    return (length <= maxLength) ? this : '${substring(0, maxLength)}...';
  }

  bool isHtml() {
    final regex = RegExp(
      r'<[^>]*>',
      multiLine: true,
      caseSensitive: true,
    );
    return regex.hasMatch(this);
  }

  bool isValidEmail() {
    if (isEmpty) return false;
    return RegExp(r'^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
        .hasMatch(this);
  }

  String validEmail() {
    if (isEmpty) return 'Vui lòng nhập Email';
    if (!isValidEmail()) {
      return 'Email không đúng định dạng';
    }
    return '';
  }

  bool isValidPassword() {
    if (length < 8) return false;

    final RegExp regex = RegExp(
      r'^(?=.*[A-Za-z\d@$!%^&*()_+{}\[\]:;<>,.?~\\-])[A-Za-z\d@$!%^&*()_+{}\[\]:;<>,.?~\\-]{8,}$',
    );
    // RegExp regex = RegExp(r'^[a-zA-Z0-9]+$');

    return regex.hasMatch(this) && isNotEmpty;
  }

  String validPassword() {
    if (length < 8) return 'Mật khẩu có độ dài từ 8 ký tự';
    if (!isValidPassword()) {
      return 'Mật khẩu sai định dạng';
    }
    return '';
  }

  String validPhoneNumber() {
    if (isEmpty) return 'Vui lòng nhập số điện thoại';
    if (length < 9 || length > 12) {
      return 'Số điện thoại có độ dài từ 9 -> 12';
    }
    if (int.tryParse(this) == null) {
      return 'Số điện thoại sai định dạng';
    }
    return '';
  }

  String formatPhone() {
    if (length < 7) return this;
    return '${substring(0, 4)} ${substring(4, 7)} ${substring(7, length)}';
  }

  bool isNumeric() {
    if (isEmpty) return false;
    return double.tryParse(this) != null;
  }

  bool isNumericWithoutDot() {
    if (isEmpty) return false;
    if (contains(',') || contains('.')) return false;
    return double.tryParse(this) != null;
  }

  bool notContainsNonVietnameseCharacters() {
    for (int i = 0; i < length; i++) {
      // Kiểm tra xem ký tự có phải là ký tự tiếng Việt không
      if (codeUnitAt(i) > 127) {
        return false;
      }
    }
    return true;
  }
}

enum PathType { user, offers, billing }
