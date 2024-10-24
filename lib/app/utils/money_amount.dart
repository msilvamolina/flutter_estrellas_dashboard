import 'package:intl/intl.dart';

class MoneyAmount {
  MoneyAmount();

  static String convertMoneyString(double price, {bool withDecimal = false}) {
    String symbol = "\$";

    final oCcy = NumberFormat(withDecimal ? "#,##0.00" : "#,##0", "es_AR");

    String finalPrice = oCcy.format(price);
    return '$symbol$finalPrice';
  }
}
