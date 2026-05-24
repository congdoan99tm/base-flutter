extension MapExtension on Map<String, dynamic>? {
  Map<String, dynamic>? trimFields() {
    if (this == null) return null;
    return this!.map((key, value) {
      if (value is String) {
        return MapEntry(key, value.trim());
      }
      return MapEntry(key, value);
    });
  }

  Map<String, dynamic>? removeEmptyValues() {
    if (this == null) return null;
    final Map<String, dynamic> resultMap = Map.from(this!);
    resultMap.removeWhere((key, value) => value == null || value == '');
    return resultMap;
  }
}
