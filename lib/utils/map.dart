import 'dart:convert';

class MapUtil {
  MapUtil._();

  static Map<String, dynamic> removeEmptyValues(Map<String, dynamic> inputMap) {
    final Map<String, dynamic> resultMap = Map.from(inputMap);
    resultMap.removeWhere((key, value) => value == null || value == '');
    return resultMap;
  }

  static Map<String, dynamic> jsonStringToMap(String? jsonString) {
    if (jsonString == null) return {};
    final List<dynamic> jsonList = jsonDecode(jsonString);
    final Map<String, String> resultMap = {};

    for (var jsonItem in jsonList) {
      final String key = jsonItem['key'];
      final String value = jsonItem['value'] as String;
      resultMap[key] = value;
    }
    return resultMap;
  }
}
