import 'package:easy_localization/easy_localization.dart';

class Formatter {
  static String number(int num) {
    final formatter = NumberFormat("#,###");
    return formatter.format(num);
  }

  static String options(int num) {
    switch (num) {
      case 1:
        return 'bad'.tr();
      case 2:
        return 'normal'.tr();
      case 3:
        return 'good'.tr();
      case 4:
        return 'verygood'.tr();

      default:
        return 'normal'.tr();
    }
  }
}
