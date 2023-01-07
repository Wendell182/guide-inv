import 'package:intl/intl.dart';

String parseDateInline(int timestamp) {
  var stamp = timestamp;
  var dt = DateTime.fromMillisecondsSinceEpoch(stamp * 1000);
  return DateFormat('dd/MM/yyyy').format(dt);
}

String parseMoney(String? money) {
  if (money == null) return "R\$ 0,00";

  num amount = double.parse(money);

  NumberFormat formatter =
      NumberFormat.currency(locale: "pt_BR", symbol: "R\$");

  return formatter.format(amount);
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
