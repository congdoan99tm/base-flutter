import 'package:intl/intl.dart';

import 'extension.dart';

extension StringExtension on String? {
  bool isHtml() {
    if (this == null) return false;
    final regex = RegExp(
      r'<[^>]*>',
      multiLine: true,
      caseSensitive: true,
    );
    return regex.hasMatch(this!);
  }

  String formatPhone() {
    if (this == null) return '';

    if (this!.length < 7) return this!;

    return '${this!.substring(0, 4)} ${this!.substring(4, 7)} ${this!.substring(7, this!.length)}';
  }

  DateTime toDate() {
    if (this == null) return DateTime.now();
    return DateFormat('dd-MM-yyyy hh:mm:ss').parse(this!);
  }

  // String toCurrency() {
  //   if (this == 'VND') {
  //     return 'đ';
  //   }
  //   return '\\\$';
  // }

  String priceFormat() {
    if (emptyOrNull()) return '';
    final l = this!.split('.').first;
    return NumberFormat('#,##0').format(int.tryParse(l));
  }

  bool isNumeric() {
    if (emptyOrNull()) return false;
    return double.tryParse(this!) != null;
  }

  bool isInt() {
    if (emptyOrNull()) return false;
    return int.tryParse(this!) != null;
  }

  bool isNumericWithoutDot() {
    if (emptyOrNull()) return false;
    if (this!.contains(',') || this!.contains('.')) return false;
    return double.tryParse(this!) != null;
  }

  bool notContainsNonVietnameseCharacters() {
    if (this == null) return false;

    for (int i = 0; i < this!.length; i++) {
      // Kiểm tra xem ký tự có phải là ký tự tiếng Việt không
      if (this!.codeUnitAt(i) > 127) {
        return false;
      }
    }
    return true;
  }

  // String cvCurrency() {
  //   if (this == null) return '';
  //   return this! == 'VND' ? 'đ' : this!;
  // }

  String convertToTitleCase() {
    if (this == null) return '';

    final List<String> words = this!.parseHtmlString().split('.');
    if (int.tryParse(words.first) != null) {
      words.removeAt(0);
    }
    final List<String> titleCaseWords = words.map((String word) {
      if (word.isEmpty) return word;
      word = word.trim();
      return word[0].toUpperCase() + word.substring(1).toLowerCase();
    }).toList();

    final String titleCase = titleCaseWords.join(' ');
    return titleCase;
  }

  String rmSpaceWhenEmpty() {
    if (emptyOrNull()) {
      return '';
    }
    return '$this ';
  }

  bool emptyOrNull() => this?.trim().isEmpty ?? true;

  String removeDiacritics() {
    const vietnameseMap = {
      'a': 'áàảãạâấầẩẫậăắằẳẵặ',
      'A': 'ÁÀẢÃẠÂẤẦẨẪẬĂẮẰẲẴẶ',
      'e': 'éèẻẽẹêếềểễệ',
      'E': 'ÉÈẺẼẸÊẾỀỂỄỆ',
      'i': 'íìỉĩị',
      'I': 'ÍÌỈĨỊ',
      'o': 'óòỏõọôốồổỗộơớờởỡợ',
      'O': 'ÓÒỎÕỌÔỐỒỔỖỘƠỚỜỞỠỢ',
      'u': 'úùủũụưứừửữự',
      'U': 'ÚÙỦŨỤƯỨỪỬỮỰ',
      'y': 'ýỳỷỹỵ',
      'Y': 'ÝỲỶỸỴ',
      'd': 'đ',
      'D': 'Đ'
    };

    String result = this ?? '';
    vietnameseMap.forEach((key, value) {
      for (int i = 0; i < value.length; i++) {
        result = result.replaceAll(value[i], key);
      }
    });
    return result;
  }
}
