void nums() {
  // int: 整数值，其取值通常位于 -253 和 253 之间。

  // double: 64-bit (双精度) 浮点数，符合 IEEE 754 标准。

  // num: int 和 double 的父类。

  // 十进制、十六进制
  int a = 1001;
  int b = 0xF;
  print([a, b]); // [1001, 15]

  // 科学计数法
  num c = 1.2e5;
  print(c); // 120000.0

  // 数值转换
  // String -> int
  int d = int.parse('123');
  // String -> double
  double e = double.parse('123.456');

  // int -> String
  String f = 123.toString();
  // double -> String
  String g = 123.456.toString();

  // double -> int
  int h = 123.456.toInt();

  // int -> double
  double i = 123.toDouble();

  // 位运算
  // & 与运算
  var j = 10 & 2; // 1010 & 0010 = 0010
  print(j); // 2

  // | 或运算
  var k = 10 | 2; // 1010 | 0010 = 1010
  print(k); // 10

  // 可以用在常量组合
  const USE_LEFT = 0x1; // 0001
  const USE_TOP = 0x2; // 0010
  const USE_LEFT_TOP = USE_LEFT | USE_TOP;
  var result = USE_LEFT | USE_TOP;
  print(result);
  assert(USE_LEFT_TOP == result);

  // ~ 非运算
  // 二进制数逐位进行逻辑非运算
  var l = 9; // 1001
  // 补码 00110
  // 取反 11001
  // 加1 11010 = -10
  print(~l); // -10

  // ^ 异或运算
  // 不相同的才出 1
  var m = 10 ^ 2; // 1010 ^ 0010 = 1000
  print(m); // 8

  // << 左移运算
  var n = 1 << 2; // 0001 -> 0100
  print(n); // 4

  // >> 右移运算
  var o = 4 >> 2; // 0100 -> 0001
  print(o); // 1
}
