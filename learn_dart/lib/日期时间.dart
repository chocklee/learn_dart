void timeDate() {
  var now = DateTime.now();
  print(now);

  var d = DateTime(2019, 11, 9); // 2019-11-09 00:00:00.000
  print(d);

  // 创建 utc 时间
  var utc = DateTime.utc(2019, 11, 9, 9, 30); // 2019-11-09 09:30:00.000Z
  print(utc);

  // 解析时间 IOS 8601
  var d1 = DateTime.parse('2018-10-10 09:30:30Z');
  print(d1);

  var d2 = DateTime.parse('2018-10-10 09:30:30+0800');
  print(d2); // 2018-10-10 01:30:30.000Z

  // 时间增减量
  var d3 = DateTime.now();
  print(d3.add(Duration(minutes: 5))); // 5 分钟后
  print(d3.add(Duration(minutes: -5))); // 5 分钟前

  // 比较时间
  var d4 = DateTime(2023, 6, 15);
  var d5 = DateTime(2023, 6, 16);
  print(d4.isAfter(d5)); // false
  print(d4.isBefore(d5)); // true

  var d6 = DateTime.now();
  var d7 = d1.add(Duration(milliseconds: 5));
  print(d6.isAtSameMomentAs(d7)); // false

  // 时间差
  var d8 = DateTime(2018, 10, 1);
  var d9 = DateTime(2018, 10, 10);
  var difference = d8.difference(d9);
  print([difference.inDays, difference.inHours]); // [-9, -216]

  // 时间戳
  var d10 = DateTime.now();
  print(d10.millisecondsSinceEpoch); // 1573269200000
  print(d10.microsecondsSinceEpoch); // 1573269200000000
}
