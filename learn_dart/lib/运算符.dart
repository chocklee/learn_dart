/**
 * Description                Operator
 * unary postfix	            expr++    expr--    ()    []    .    ?.
 * unary prefix	              -expr    !expr    ~expr    ++expr    --expr   
 * multiplicative	            *    /    %  ~/
 * additive	                  +    -
 * shift	                    <<    >>    >>>
 * bitwise AND	              &
 * bitwise XOR	              ^
 * bitwise OR	                |
 * relational and type test	  >=    >    <=    <    as    is    is!
 * equality	                  ==    !=   
 * logical AND	              &&
 * logical OR	                ||
 * if null	                  ??
 * conditional	              expr1 ? expr2 : expr3
 * cascade	                  ..
 * assignment                 =    *=    /=   +=   -=   &=   ^=   etc.
 */
// 在 运算符表 中， 每一行的运算符优先级，由上到下依次排列，第一行优先级最高，最后一行优先级最低。
// 例如 % 运算符优先级高于 == ， 而 == 高于 &&。
void aOperator() {
  var n = 12;
  var d = 20;
  var i = 4;

  // 括号可以提高可读性。
  if ((n % i == 0) && (d % i == 0)) {}

  // 可读性差，但是是等效的。
  if (n % i == 0 && d % i == 0) {}

  // ~/ 除，返回一个整数结果
  assert(5 ~/ 2 == 2);

  var a, b;
  a = 0;
  b = ++a; // a自加后赋值给b。
  assert(a == b); // 1 == 1

  a = 0;
  b = a++; // a先赋值给b后，a自加。
  assert(a != b); // 1 != 0

  a = 0;
  b = --a; // a自减后赋值给b。
  assert(a == b); // -1 == -1

  a = 0;
  b = a--; // a先赋值给b后，a自减。
  assert(a != b); // -1 != 0

  // 类型判定运算符
  // as， is， 和 is! 运算符用于在运行时处理类型检查：
  // 使用 as 运算符将对象强制转换为特定类型。 通常，可以认为是 is 类型判定后，被判定对象调用函数的一种缩写形式
  // if (emp is Person) {
  //   // Type check
  //   emp.firstName = 'Bob';
  // }

  // 使用 as 运算符进行缩写
  // (emp as Person).firstName = 'Bob';
  // 以上代码并不是等价的。 如果 emp 为 null 或者不是 Person 对象， 那么第一个 is 的示例，后面将不回执行； 第二个 as 的示例会抛出异常。

  // 赋值运算符
  // 使用 ??= 运算符时，只有当被赋值的变量为 null 时才会赋值给它
  // 如果b为空时，将变量赋值给b，否则，b的值保持不变。
  b ??= 3;

  // 按位和移位运算符
  // ~expr 0 -> 1, 1 -> 0
  // ^ 异或
  final value = 0x22; // 00100010
  final bitmask = 0x0f; // 00001111   ~bitmask = 11110000

  assert((value & bitmask) == 0x02); // AND 00000010
  assert((value & ~bitmask) == 0x20); // AND NOT 00100000
  assert((value | bitmask) == 0x2f); // OR 00101111
  assert((value ^ bitmask) == 0x2d); // XOR 00101101
  assert((value << 4) == 0x220); // Shift left  001000100000
  assert((value >> 4) == 0x02); // Shift right  00000010

  // 级联运算符 (..)
  // 级联运算符 (..) 可以实现对同一个对像进行一系列的操作。
  // 除了调用函数，还可以访问同一对象上的字段属性。这通常可以节省创建临时变量的步骤，同时编写出更流畅的代码。

  // 第一句调用函数 querySelector() ，返回获取到的对象。 获取的对象依次执行级联运算符后面的代码， 代码执行后的返回值会被忽略。
  querySelector('#confirm') // 获取对象。
    ..text = 'Confirm' // 调用成员变量。
    ..classes.add('important')
    ..onClick.listen((e) => window.alert('Confirmed!'));
  // 上面的代码等价于：
  var button = querySelector('#confirm');
  button.text = 'Confirm';
  button.classes.add('important');
  button.onClick.listen((e) => window.alert('Confirmed!'));

  // 级联运算符可以嵌套
  final addressBook = (AddressBookBuilder()
        ..name = 'jenny'
        ..email = 'jenny@example.com'
        ..phone = (PhoneNumberBuilder()
              ..number = '415-555-0100'
              ..label = 'home')
            .build())
      .build();
}
