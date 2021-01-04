void controlFlow() {
  // if 和 else
  // else 可选的，if 的判断条件必须是布尔值，不能是其他类型。

  // for 循环
  // 闭包在 Dart 的 for 循环中会捕获循环的 index 索引值
  var callbacks = [];
  for (var i = 0; i < 2; i++) {
    callbacks.add(() => print(i));
  }
  callbacks.forEach((c) => c());

  var collection = [0, 1, 2];
  for (var x in collection) {
    print(x); // 0 1 2
  }

  // while 循环在执行前判断执行条件
  // do-while 循环在执行后判断执行条件

  // 使用 break 停止程序循环
  // 使用 continue 跳转到下一次循环

  // switch 和 case
  // switch 语句使用 == 比较整数，字符串，或者编译时常量。比较的对象必须都是同一个类的实例，类必须没有对 == 重写
  // 在 case 语句中，每个非空的 case 语句结尾需要跟一个 break 语句。 除 break 以外，还有可以使用 continue, throw，者 return。
  // 缺省了 break 语句，会导致错误
  // Dart 支持空 case 语句， 允许程序以 fall-through 的形式执行。

  // assert 的第一个参数可以是解析为布尔值的任何表达式。
  // 如果表达式结果为 true ，则断言成功，并继续执行。如果表达式结果为 false ，则断言失败，并抛出异常 (AssertionError) 。
  // assert 的第二个参数可以为其添加一个字符串消息。
  var urlString = 'https://www.dartcn.com';
  assert(urlString.startsWith('https'),
      'URL ($urlString) should start with "https".');
}

void main(List<String> args) {
  controlFlow();
}
