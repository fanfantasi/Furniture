import 'package:intl/intl.dart';

class Formatter {
  static String number(int num) {
    final formatter = NumberFormat("#,###");
    return formatter.format(num);
  }
}
