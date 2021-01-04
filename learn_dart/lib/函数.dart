/* 
Dart 是一门真正面向对象的语言，甚至其中的函数也是对象，并且有它的类型 Function 
这也意味着函数可以被赋值给变量或者作为参数传递给其他函数。
也可以把 Dart 类的实例当做方法来调用。
*/

import 'dart:ffi';

void test() {
  var afun = AFunctions();
  afun.enableFlags(bold: true, hidden: false);

  var result = afun.say('lee', 'learn flutter', 'macOS');
  print(result);

  afun.enableOtherFlags(bold: true);

  var aResult = afun.sayDefault('lee', 'learn flutter');
  print(aResult);

  afun.doStuff();

  var list = [1, 2, 3];
  // 将 printElement 函数作为参数传递。
  list.forEach(afun.printElement);

  print(afun.loudify('hello'));
}

class AFunctions {
  final _nobleGases = {1: 'noble'};

  // bool isNoble(int atomicNumber) {
  //   return _nobleGases[atomicNumber] != null;
  // }

  // 函数中只有一句表达式，可以使用简写语法
  // => expr 语法是 { return expr; } 的简写。 => 符号有时也被称为箭头语法
  // 在箭头 (=>) 和分号 (;) 之间只能使用一个 表达式 ，不能是 语句 。 例如：不能使用 if 语句 ，但是可以是用 条件表达式.
  bool isNoble(int atomicNumber) => _nobleGases[atomicNumber] != null;

  // 函数有两种参数类型: required 和 optional。
  // required 类型参数在参数最前面， 随后是 optional 类型参数。 命名的可选参数也可以标记为 “@ required”

  // 可选参数可以是命名参数或者位置参数，但一个参数只能选择其中一种方式修饰。
  // 命名可选参数：调用函数时，可以使用指定命名参数 paramName: value
  void enableFlags({bool bold, bool hidden}) {
    print('$bold and $hidden');
  }

  // 使用 @required 注释表示参数是 required 性质的命名参数
  // const Scrollbar({Key key, @required Widget child})
  // Scrollbar 是一个构造函数， 当 child 参数缺少时，分析器会提示错误。

  // 位置可选参数：将参数放到 [] 中来标记参数是可选的
  String say(String from, String msg, [String device]) {
    var result = '$from says $msg';
    if (device != null) {
      result = '$result with a $device';
    }
    return result;
  }

  // 默认参数值
  // 在定义方法的时候，可以使用 = 来定义可选参数的默认值。默认值只能是编译时常量。 如果没有提供默认值，则默认值为 null。
  void enableOtherFlags({bool bold = false, bool hidden = false}) {
    print('$bold and $hidden');
  }

  String sayDefault(String from, String msg,
      [String device = 'carrier pigeon', String mood]) {
    var result = '$from says $msg';
    if (device != null) {
      result = '$result with a $device';
    }
    if (mood != null) {
      result = '$result (in a $mood mood)';
    }
    return result;
  }

  // list 或 map 可以作为默认值传递。
  void doStuff(
      {List<int> list = const [1, 2, 3],
      Map<String, String> gifts = const {
        'first': 'paper',
        'second': 'cotton',
        'third': 'leather'
      }}) {
    print('list:  $list');
    print('gifts: $gifts');
  }

  // main() 函数
  // 任何应用都必须有一个顶级 main() 函数，作为应用服务的入口。 main() 函数返回值为空，参数为一个可选的 List<String>
  // web 应用的 main() 函数
  // void main() {
  //   querySelector('#sample_text_id')
  //     ..text = 'Click me!'
  //     ..onClick.listen(reverseText);
  // }
  //  .. 语法为级联调用（cascade）使用级联调用，可以简化在一个对象上执行的多个操作

  // 函数是一等对象
  // 一个函数可以作为另一个函数的参数。
  void printElement(int element) {
    print(element);
  }

  // 同样可以将一个函数赋值给一个变量
  // 此例中使用到了匿名函数
  var loudify = (msg) => '!!! ${msg.toUpperCase()} !!!';

  // 词法作用域
  // Dart 是一门词法作用域的编程语言，就意味着变量的作用域是固定的， 简单说变量的作用域在编写代码的时候就已经确定了。
  // {}内的是变量可见的作用域。

  // 词法闭包
  // 闭包即一个函数对象，即使函数对象的调用在它原始作用域之外， 依然能够访问在它词法作用域内的变量。

}

// 匿名函数
// 创建没有名字的函数，这种函数被称为 匿名函数，有时候也被称为 lambda 或者 closure，匿名函数可以赋值到一个变量中
// 匿名函数和命名函数看起来类似— 在括号之间可以定义一些参数或可选参数，参数使用逗号分割。
// ([[Type] param1[, …]]) {
//   codeBlock;
// };
void anonymousFunc() {
  var list = ['apples', 'banans', 'oranges'];
  list.forEach((item) {
    print('${list.indexOf(item)}: $item');
  });
  // 箭头语法简写
  list.forEach((item) => print('${list.indexOf(item)}: $item'));
}

void main(List<String> args) {
  // test();
  // anonymousFunc();
}
