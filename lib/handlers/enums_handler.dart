import 'package:intl/intl.dart';

class EnumsHandler {
  static String enumToString(Object object) {
    return toBeginningOfSentenceCase(object.toString().toLowerCase().split('.').last);
  }

  static T enumFromString<T>(String key, List<T> values) {
    return values.firstWhere((value) => enumToString(value).toUpperCase() == key);
  }
}
