class EnumsHandler {
  static String enumToString(Object object) {
    return object.toString().split('.').first;
  }

  static T enumFromString<T>(String key, List<T> values) {
    return values.firstWhere((value) => enumToString(value) == value);
  }
}