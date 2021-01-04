/*
    Dart 语言支持以下内建类型：
    Number
    String
    Boolean
    List
    Map
    Set
    Rune
    Symbol
  */
void number() {
  // Number有两种类型：
  // int：整数值不大于64位
  // double：64位（双精度）浮点数
  // int 和 double 都是 num 的亚类型。 num 类型包括基本运算 +， -， /， 和 *， 以及 abs()， ceil()， 和 floor()， 等函数方法。
  var x = 1;
  var hex = 0xDEADBEEF;

  var y = 1.1;
  var exponents = 1.42e5;
  // 必要的时候 int 字面量会自动转换成 double 类型
  double z = 1; // 相当于 double z = 1.0

  // 字符串转数字
  // String -> int
  var one = int.parse('1');
  assert(one == 1);
  // String -> double
  var onePointOne = double.parse('1.1');
  assert(onePointOne == 1.1);
  // int -> String
  String oneAsString = 1.toString();
  assert(oneAsString == '1');
  // double -> String
  String piAsString = 3.14159.toStringAsFixed(2);
  assert(piAsString == '3.14');

  // int 特有的传统按位运算操作，移位（<<， >>），按位与（&）以及 按位或（|）
  assert((3 << 1) == 6); // 0011 << 1 == 0110
  assert((3 >> 1) == 1); // 0011 >> 1 == 0001
  assert((3 | 4) == 7); // 0011 | 0100 == 0111

  // 在算术表达式中，只要参与计算的因子是编译时常量， 那么算术表达式的结果也是编译时常量。
  const msPerSecond = 1000;
  const secondsUntilRetry = 5;
  const msUntilRetry = secondsUntilRetry * msPerSecond;
}

void string() {
  // Dart 字符串是一组 UTF-16 单元序列。
  // 字符串通过单引号或者双引号创建
  var s1 = 'Single quotes work well for string literals.';
  var s2 = "Double quotes work just as well.";
  var s3 = 'It\'s easy to escape the string delimiter.';
  var s4 = "It's even easier to use the other delimiter.";

  // 字符串可以通过 ${expression} 的方式内嵌表达式，如果表达式是一个标识符，则 {} 可以省略
  var s = 'string interpolation';
  // == 运算符用来判断两个对象是否相等
  assert('Dart has $s' == 'Dart has string interpolation');
  assert('${s.toUpperCase()} is very handy!' ==
      'STRING INTERPOLATION is very handy!');
  // 可以使用 + 运算符来把多个字符串连接为一个，也可以把多个字面量字符串写在一起来实现字符串连接
  var s5 = 'String '
      'concatenation'
      " works even over line breaks";
  print(s5);

  // 使用连续三个单引号或者三个双引号实现多行字符串对象的创建
  var s6 = '''
  You can create 
  multi-line strings like this one.
  ''';
  print(s6);
  var s7 = """this is also a 
  multi-line string.""";
  print(s7);

  // 使用 r 前缀，可以创建 “原始 raw” 字符串
  var raw_s = r"In a raw string, even \n isn't special.";
  print(raw_s);

  // 一个编译时常量的字面量字符串中，如果存在插值表达式，表达式内容也是编译时常量，那么该字符串依旧是编译时常量。
  // 插入的常量值类型可以是 null，数值，字符串或布尔值。
  const aConstNum = 0;
  const aConstBool = true;
  const aConstString = 'a constant string';

  var aNum = 0;
  var aBool = true;
  var aString = 'a string';
  const aConstList = [1, 2, 3];

  const validConstString = '$aConstNum $aConstBool $aConstString'; // const 类型数据
  // const invalidConstString = '$aNum $aBool $aString $aConstList'; //非 const 类型数据
}

void boolean() {
  // Dart 使用 bool 类型表示布尔值
  // Dart 只有字面量 true and false 是布尔类型，这两个对象都是编译时常量。
  // 检查空字符串。
  var fullName = '';
  assert(fullName.isEmpty);
  // 检查 0 值。
  var hitPoints = 0;
  assert(hitPoints <= 0);
  // 检查 null 值。
  var unicorn;
  assert(unicorn == null);
  // 检查 NaN 。
  var iMeantToDoThis = 0 / 0;
  assert(iMeantToDoThis.isNaN);
}

void list() {
  // Dart 推断 list 的类型为 List<int> 。 如果尝试将非整数对象添加到此 List 中， 则分析器或运行时会引发错误。
  var list = [1, 2, 3];
  assert(list.length == 3);
  assert(list[1] == 2);

  list[1] = 1;
  assert(list[1] == 1);

  // 在 List 字面量之前添加 const 关键字，可以定义 List 类型的编译时常量
  var constantList = const [1, 2, 3];
  // constantList[1] = 1; // 编译时报错
  constantList = [4, 5, 6];
  print(constantList);
}

void aSet() {
  // 在 Dart 中 Set 是一个元素唯一且无序的集合。
  var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
  // 要创建一个空集，使用前面带有类型参数的 {} ，或者将 {} 赋值给 Set 类型的变量
  var names = <String>{};
  Set<String> aNames = {};

  // Map 字面量语法同 Set 字面量语法非常相似
  // 因为先有的 Map 字面量语法，所以 {} 默认是 Map 类型。
  var aNamesMap = {}; // 这样会创建一个 Map ，而不是 Set。

  var elements = <String>{};
  elements.add('fluorine');
  elements.addAll(halogens);
  assert(elements.length == 5);

  // 在 Set 字面量前增加 const ，来创建一个编译时 Set 常量
  final constantSet = const {
    'fluorine',
    'chlorine',
    'bromine',
    'iodine',
    'astatine',
  };
  // constantSet.add('helium'); // 编译时报错 Cannot change unmodifiable set
}

void map() {
  // Map 是用来关联 keys 和 values 的对象。keys 和 values 可以是任何类型的对象。在一个 Map 对象中一个 key 只能出现一次。
  var gifts = {
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 'golden rings'
  };

  var nobleGases = {
    2: 'helium',
    10: 'neon',
    18: 'argon',
  };

  // Map构造函数创建
  // 这里为什么只有 Map() ，而不是使用 new Map()。 因为在 Dart 2 中，new 关键字是可选的。
  var aGifts = Map();
  aGifts['first'] = 'partridge';
  aGifts['second'] = 'turtledoves';
  aGifts['fifth'] = 'golden rings';

  var aNobleGases = Map();
  aNobleGases[2] = 'helium';
  aNobleGases[10] = 'neon';
  aNobleGases[18] = 'argon';

  gifts['fourth'] = 'calling birds';
  assert(gifts['fourth'] == 'calling birds');
  assert(gifts['thrid'] == null);
  assert(gifts.length == 4);

  final constantMap = const {
    2: 'helium',
    10: 'neon',
    18: 'argon',
  };
  // constantMap[2] = 'Helium'; // 编译时报错
}

void rune() {
  // Rune 用来表示字符串中的 UTF-32 编码字符
  // 由于 Dart 字符串是一系列 UTF-16 编码单元， 因此要在字符串中表示32位 Unicode 值需要特殊语法支持。

  // String 类有一些属性可以获得 rune 数据。 属性 codeUnitAt 和 codeUnit 返回16位编码数据。 属性 runes 获取字符串中的 Rune 。
  var clapping = '\u{1f44f}';
  print(clapping);
  print(clapping.codeUnits);
  print(clapping.runes.toList());

  Runes input = Runes('\u2665 \u{1f605} \u{1f47b} \u{1f596} \u{1f44d}');
  print(String.fromCharCodes(input));
}

void symbol() {
  // 一个 Symbol 对象表示 Dart 程序中声明的运算符或者标识符。
  // 你也许永远都不需要使用 Symbol ，但要按名称引用标识符的 API 时， Symbol 就非常有用了。
  // 因为代码压缩后会改变标识符的名称，但不会改变标识符的符号。
  // 通过字面量 Symbol ，也就是标识符前面添加一个 # 号，来获取标识符的 Symbol 。
  #radix;
  #bar;
  // Symbol 字面量是编译时常量
}
