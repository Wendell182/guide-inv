import 'package:intl/intl.dart';

String parseDateInline(int timestamp) {
  var stamp = timestamp;
  var dt = DateTime.fromMillisecondsSinceEpoch(stamp * 1000);
  return DateFormat('dd/MM/yyyy').format(dt);
}

String parseDateWithTime(int timestamp) {
  var stamp = timestamp;
  var dt = DateTime.fromMillisecondsSinceEpoch(stamp * 1000);
  return DateFormat('dd/MM - hh:mm').format(dt);
}

extension Strings on String {
  static String safe({String? old, String defaultVal = ""}) {
    String newString;
    if (old == null) {
      newString = defaultVal;
    } else {
      newString = old;
    }
    return newString;
  }
}

extension Doubles on double {
  static double safe({double? old, double defaultVal = 0.0}) {
    double value;
    if (old == null) {
      value = defaultVal;
    } else {
      value = old;
    }
    return value;
  }
}
