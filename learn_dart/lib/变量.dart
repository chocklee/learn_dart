void variable() {
  // 变量
  var name = 'Bob'; // 变量仅存储对象引用，name变量的类型被推断为String
  // 如果对象不限定为单个类型，可以指定为 对象类型 或 动态类型
  Object obj = 'Bob';
  obj = 123;
  obj = [1, 2, 3];
  // 编译阶段检查类型
  // obj 为 Object 类型，没有 f() 方法，编译时报错
  // obj.f();

  dynamic name1 = 'Bob';
  name1 = 123;
  name1 = [1, 2, 3];
  // 运行时检查类型, 运行时报错, 编译时不报错
  name1.f();
  // 显示声明, 指定类型
  String name2 = 'Bob';

  // 常见类型
  // num	数字
  // int	整型
  // double	浮点
  // bool	布尔
  // String	字符串
  // StringBuffer	字符串 buffer
  // DateTime	时间日期
  // Duration	时间区间
  // List	列表
  // Sets	无重复队列
  // Maps	kv 容器
  // enum	枚举

  // 默认值 未初始化的变量默认值为null，即使变量是数字类型默认值也是 null，因为在 Dart 中一切都是对象
  int lineCount;
  // 在生产环境代码中 assert() 函数会被忽略，不会被调用。在开发过程中, assert(condition) 会在非 true 的条件下抛出异常
  assert(lineCount == null);

  var map = <String, dynamic>{}; // Map<String, Object>
  map['image'] = 'images';
}

// 常量
void constant() {
  // Final 和 Const 使用过程中从来不会被修改的变量，可以使用 final 或 const
  // Final 变量的值只能被设置一次；Const 变量在编译时就已经固定(Const变量是隐式Final的类型.)
  // 实例变量可以是 final 类型但不能是 const 类型。
  // 必须在构造函数体执行之前初始化 final 实例变量 —— 在变量声明中，参数构造函数中或构造函数的初始化列表中进行初始化。
  final name3 = 'Bob';
  final String nickname = 'Bobby';

  const name = 'Bob';
  const String nickname1 = 'Bobby';

  // name3 = 'Alice'; // Error: 一个 final 变量只能被设置一次。
  // name = 'Alice'; // Error: 一个 const 变量只能被设置一次。

  // 不能和 var 同时使用
  // final var a = 'a';
  // const var b = 'b';

  final dt = DateTime.now();
  // const dt1 = const DateTime.now(); // const 变量必须使用 const 构造函数初始化

  final List ls = [11, 22, 33];
  ls[1] = 44; // final 变量的值可以被修改

  const List ls1 = [11, 22, 33];
  // ls1[1] = 44; // const 变量的值不能被修改, 运行时报错

  // 内存中重复创建
  final a1 = [11, 22];
  final a2 = [11, 22];
  // print(identical(a1, a2)); // false

  const a3 = [11, 22];
  const a4 = [11, 22];
  // identical 通过比较两个引用的是否是同一个对象判断是否相等
  print(identical(a3, a4)); // true

  // 如果需要在编译时就固定变量的值，可以使用 const 类型变量
  // 如果 Const 变量是类级别的，需要标记为 static const。
  const bar = 1000000;
  const double atm = 1.01325 * bar;
  // Const 关键字不仅可以用于声明常量变量。 还可以用来创建常量值，以及声明创建常量值的构造函数。
  // 任何变量都可以拥有常量值。
  var foo = const [];
  final bar1 = const [];
  // 声明 const 的初始化表达式中 const 可以被省略
  const baz = []; // Equivalent to `const []`

  // 非 Final ， 非 const 的变量是可以被修改的，即使这些变量 曾经引用过 const 值。
  foo = [1, 2, 3];
  // baz = [42]; // Error: 常量变量不能赋值修改。
}
