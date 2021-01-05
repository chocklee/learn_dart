import 'dart:math';
import 'Logger.dart';

/// 每个对象都是一个类的实例，所有的类都继承于 Object
/// 基于 Mixin继承 意味着每个类（除 Object 外） 都只有一个超类，一个类中的代码可以在其他多个继承类中重复使用。
///
/// 此章节相关文件有：Person.dart，Point.dart，Logger.dart，Rectangle.dart

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

/// Getter 和 Setter 是用于对象属性读和写的特殊方法。
/// 每个实例变量都有一个隐式 Getter ，通常情况下还会有一个 Setter （非 final 实例变量）。
/// 使用 get 和 set 关键字实现 Getter 和 Setter ，能够为实例创建额外的属性。
class Rectangle {
  num left, top, width, height;

  Rectangle(this.left, this.top, this.width, this.height);

  // 定义两个计算属性： right 和 bottom。
  num get right => left + width;
  set right(num value) => left = value - width;
  num get bottom => top + height;
  set bottom(num value) => top = value - height;
}

/// 抽象类
/// 使用 abstract 修饰符来定义 抽象类 — 抽象类不能实例化。
/// 抽象类通常用来定义接口，以及部分实现。

/// 抽象方法
/// 实例方法， getter 和 setter 方法可以是抽象的，只定义接口不进行实现，而是留给其他类去实现。
/// 抽象方法只存在于 抽象类 中
abstract class Doer {
  // 定义实例变量和方法 ...
  String name;

  void doSomething();
}

class EffectiveDoer extends Doer {
  @override
  // TODO: implement name
  String get name => super.name;

  @override
  set name(String _name) {
    // TODO: implement name
    super.name = _name;
  }

  @override
  void doSomething() {
    // TODO: implement doSomething
  }
}

/// 隐式接口
/// 每个类都隐式的定义了一个接口，接口包含了该类所有的实例成员及其实现的接口。
/// 一个类可以通过 implements 关键字来实现一个或者多个接口， 并实现每个接口要求的 API
/// 一个类实现多个接口时使用 , 分隔开

// person类 隐式接口里面包含了 greet() 方法声明。
class Person {
  // 包含在接口里，但只在当前库中可见。
  final _name;

  // 不包含在接口里，因为这是一个构造函数。
  Person(this._name);

  // 包含在接口里。
  String greet(String who) => 'Hello, $who. I am $_name.';
}

// person 接口的实现
class Impostor implements Person {
  @override
  get _name => '';

  @override
  String greet(String who) => 'Hi $who. Do you know who I am?';
}

String greetBob(Person person) => person.greet('Bob');

/// 扩展类（继承）
/// 使用 extends 关键字来创建子类， 使用 super 关键字来引用父类
class Television {
  void _illuminateDisplay() {}
  void _activateIrSensor() {}
  void turnOn() {
    _illuminateDisplay();
    _activateIrSensor();
  }
}

class SmartTelevision extends Television {
  void _bootNetworkInterface() {}
  void _initializeMemory() {}
  void _upgradeApps() {}

  // 重写类成员
  // 子类可以重写实例方法，getter 和 setter
  // 使用 @override 注解
  @override
  void turnOn() {
    super.turnOn();
    _bootNetworkInterface();
    _initializeMemory();
    _upgradeApps();
  }
}

/// 重写运算符
class Vector {
  final int x, y;
  Vector(this.x, this.y);
  Vector operator +(Vector v) => Vector(x + v.x, y + v.y);
  Vector operator -(Vector v) => Vector(x - v.x, y - v.y);

  // 如果要重写 == 操作符，需要重写对象的 hashCode getter 方法。 重写 == 和 hashCode 的实例

  // 当代码尝试使用不存在的方法或实例变量时， 通过重写 noSuchMethod() 方法，来实现检测和应对处理
  @override
  void noSuchMethod(Invocation invocation) {
    print('You tried to use a non-existent member: ${invocation.memberName}');
  }
}

/// 枚举类型
/// 是一种特殊的类，用于表示数量固定的常量值
/// 枚举中的每个值都有一个 index getter 方法，该方法返回值所在枚举类型定义中的位置（从 0 开始）
/// 使用枚举的 values 常量， 获取所有枚举值列表（ list ）
/// 枚举类型具有以下限制：
/// 枚举不能被子类化，混合或实现
/// 枚举不能被显式实例化
enum Color { red, green, blue }

/// 类的变量和方法
/// 使用 static 关键字实现类范围的变量和方法
class Queue {
  // 静态变量只到它们被使用的时候才会初始化
  static const initialCapacity = 16;

  // 静态方法
  // 见：Point.dart
  // 对于常见或广泛使用的工具和函数， 应该考虑使用顶级函数而不是静态方法
  // 静态函数可以当做编译时常量使用， 可以将静态方法作为参数传递给常量构造函数
}

/// 为类添加功能： Mixin
/// Mixin 是复用类代码的一种途径， 复用的类可以在不同层级，之间可以不存在继承关系
/// 通过 with 后面跟一个或多个混入的名称，来 使用 Mixin
class Musician extends Performer with Musical {
  // ...
}

class Maestro extends Person with Musical, Aggressive, Demented {
  Maestro(String maestroName) {
    name = maestroName;
    canConduct = true;
  }
}

/// 通过创建一个继承自 Object 且没有构造函数的类，来实现一个 Mixin
/// 如果 Mixin 不希望作为常规类被使用，使用关键字 mixin 替换 class
mixin Musical {
  bool canPlayPiano = false;
  bool canCompose = false;
  bool canConduct = false;

  void entertainMe() {
    if (canPlayPiano) {
      print('Playing piano');
    } else if (canConduct) {
      print('Waving hands');
    } else {
      print('Humming to self');
    }
  }
}

/// 指定只有某些类型可以使用的 Mixin
/// 比如， Mixin 可以调用 Mixin 自身没有定义的方法 - 使用 on 来指定可以使用 Mixin 的父类类型
mixin MusicalPerformer on Musician { //... }

void main(List<String> args) {
  getRuntimeType();

  // 工厂构造函的调用方式与其他构造函数一样
  var logger = Logger('UI');
  logger.log('Button clicked');

  var rect = Rectangle(3, 4, 20, 15);
  assert(rect.left == 3);
  rect.right = 12;
  assert(rect.left == -8);

  print(greetBob(Person('Kathy')));
  print(greetBob(Impostor()));

  final v = Vector(2, 3);
  final w = Vector(2, 2);
  assert((v + w).x == Vector(4, 5).x);
  assert((v - w).y == Vector(0, 1).y);

  assert(Color.red.index == 0);
  assert(Color.green.index == 1);
  assert(Color.blue.index == 2);

  List<Color> colors = Color.values;
  assert(colors[2] == Color.blue);
}
