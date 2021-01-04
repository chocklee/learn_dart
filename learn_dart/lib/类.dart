import 'dart:math';

/// 每个对象都是一个类的实例，所有的类都继承于 Object
/// 基于 Mixin继承 意味着每个类（除 Object 外） 都只有一个超类，一个类中的代码可以在其他多个继承类中重复使用。
///
/// 此章节相关文件有：Person.dart，Point.dart，Logger.dart

import 'Logger.dart';

// 使用类的成员变量
// 使用 . 来引用实例对象的变量和方法
void aClass() {
  // 通过 构造函数 创建对象。
  // 在 Dart 2 中 new 关键字变成了可选的。
  var p = Point(2, 2);
  var p1 = new Point(2, 2);

  // 获取变量 x 的值
  print(p.x);

  // 调用 p 的 distanceTo() 方法。
  p.distanceTo(Point(4, 4));

  // 使用 ?. 来代替 . ， 可以避免因为左边对象可能为 null ， 导致的异常：
  print(p?.y);

  // 一些类提供了常量构造函数。 使用常量构造函数，在构造函数名之前加 const 关键字，来创建编译时常量时
  var p2 = const ImmutablePoint(2, 2);

  // 构造两个相同的编译时常量会产生一个唯一的， 标准的实例
  var a = const ImmutablePoint(1, 1);
  var b = const ImmutablePoint(1, 1);

  assert(identical(a, b)); // 它们是同一个实例。

  // 在 常量上下文 中， 构造函数或者字面量前的 const 可以省略。
  // 这里有很多的 const 关键字。
  const pointAndLine = const {
    'point': const [const ImmutablePoint(0, 0)],
    'line': const [const ImmutablePoint(1, 10), const ImmutablePoint(-2, 11)],
  };
  // 保留第一个 const 关键字，其余的全部省略
  // 仅有一个 const ，由该 const 建立常量上下文。
  const pointAndLine1 = {
    'point': [ImmutablePoint(0, 0)],
    'line': [ImmutablePoint(1, 10), ImmutablePoint(-2, 11)],
  };
}

void getRuntimeType() {
  var p = Point(2, 2);

  // 获取对象的类型
  // 使用对象的 runtimeType 属性， 可以在运行时获取对象的类型， runtimeType 属性回返回一个 Type 对象。
  print('The type of p is ${p.runtimeType}');
}

class Point {
  // 未初始化实例变量的默认值为 “null” 。
  // 所有实例变量都生成隐式 getter 方法。 非 final 的实例变量同样会生成隐式 setter 方法。
  num x;
  num y;

  // 构造函数
  // 通过创建一个与其类同名的函数来声明构造函数
  // 使用 this 关键字引用当前实例
  // 当存在命名冲突时，使用 this 关键字。 否则，按照 Dart 风格应该省略 this 。
  // Point(num x, num y) {
  //   this.x = x;
  //   this.y = y;
  // }

  // 在构造函数体执行前，语法糖已经设置了变量 x 和 y。
  Point(this.x, this.y);

  // 默认构造函数
  // 在没有声明构造函数的情况下， Dart 会提供一个默认的构造函数。 默认构造函数没有参数并会调用父类的无参构造函数。

  // 构造函数不被继承
  // 子类不会继承父类的构造函数。 子类不声明构造函数，那么它就只有默认构造函数 (匿名，没有参数) 。

  // 命名构造函数
  // 使用命名构造函数可为一个类实现多个构造函数， 也可以使用命名构造函数来更清晰的表明函数意图
  Point.origin() {
    x = 0;
    y = 0;
  }

  // 调用父类非默认构造函数 见：Person.dart

  // 初始化列表
  // 可以在构造函数体执行之前初始化实例变量。 各参数的初始化用逗号分隔。
  // 初始化程序的右侧无法访问 this
  Point.fromJson(Map<String, num> json)
      : x = json['x'],
        y = json['y'] {
    print('In Point.fromJson(): ($x, $y)');
  }

  // 在开发期间，可以使用 assert 来验证输入的初始化列表
  Point.withAssert(this.x, this.y) : assert(x >= 0) {
    print('In Point.withAssert(): ($x, $y)');
  }

  // 重定向构造函数
  // 有时构造函数的唯一目的是重定向到同一个类中的另一个构造函数。 重定向构造函数的函数体为空， 构造函数的调用在冒号 (:) 之后。
  Point.alongXAxis(num x) : this(x, 0);

  // 实例方法
  // 对象的实例方法可以访问 this 和实例变量
  num distanceTo(Point other) {
    var dx = x - other.x;
    var dy = y - other.y;
    return sqrt(dx * dx + dy * dy);
  }
}

// 常量构造函数
// 如果该类生成的对象是固定不变的， 那么就可以把这些对象定义为编译时常量。
// 为此，需要定义一个 const 构造函数， 并且声明所有实例变量为 final。
class ImmutablePoint {
  static final ImmutablePoint origin = const ImmutablePoint(0, 0);

  final num x, y;

  const ImmutablePoint(this.x, this.y);
}

void main(List<String> args) {
  getRuntimeType();

  // 工厂构造函的调用方式与其他构造函数一样
  var logger = Logger('UI');
  logger.log('Button clicked');
}
