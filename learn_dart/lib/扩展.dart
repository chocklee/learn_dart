import 'package:intl/intl.dart';

extension ExDateTime on DateTime {
  /// 方法，格式化日期 yyyy-MM-dd
  String toDateString({String format = 'yyyy-MM-dd'}) =>
      DateFormat(format).format(this);

  // 属性
  int get nowTicket => microsecondsSinceEpoch;
}

void main() {
  var now = DateTime.now();
  print(now.toDateString());
  print(now.nowTicket);
}
