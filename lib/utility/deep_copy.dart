dynamic deepCopy(dynamic origin) {
  /// Map
  if (origin is Map) {
    final copiedMap = {};
    for (final key in origin.keys) {
      final value = origin[key];
      copiedMap[key] = deepCopy(value);
    }
    return copiedMap;
  }

  /// List
  if (origin is List) {
    final copiedList = [];
    for (final element in origin) {
      copiedList.add(deepCopy(element));
    }
    return copiedList;
  }

  /// Other
  return origin;
}