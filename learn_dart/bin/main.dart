import 'package:learn_dart/元数据.dart';
// import 'package:learn_dart/变量.dart';
// import 'package:learn_dart/数值.dart';
// import 'package:learn_dart/日期时间.dart';
// import 'package:learn_dart/列表.dart';

void main(List<String> arguments) {
  print(arguments);

  var number = 42;
  printInteger(number);
}

void printInteger(int aNumber) {
  print('the number is $aNumber');
}

// 自定义元数据注解
@Todo('seth', 'make this do something')
void doSomething() {
  print('do something');
}

/// Isolates
/// 所有 Dart 代码都在隔离区（ isolates ）内运行，而不是线程。
/// 每个隔离区都有自己的内存堆，确保每个隔离区的状态都不会被其他隔离区访问。
