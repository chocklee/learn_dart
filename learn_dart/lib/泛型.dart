/// 泛型
/// 通常情况下，使用一个字母来代表类型参数， 例如 E, T, S, K, 和 V 等
///
/// 为什么使用泛型
/// 正确指定泛型类型可以提高代码质量
/// 使用泛型可以减少重复的代码
/// 泛型可以在多种类型之间定义同一个实现， 同时还可以继续使用检查模式和静态分析工具提供的代码分析功能

abstract class Cache<T> {
  T getByKey(String key);
  void setByKey(String key, T value);
}

/// 限制泛型类型
/// 使用泛型类型的时候， 可以使用 extends 实现参数类型的限制

class SomeBaseClass {}

class Foo<T extends SomeBaseClass> {
  String toString() => "Instance of 'Foo<$T>'";
}

class Extender extends SomeBaseClass {}

/// 使用泛型函数
/// 这里的 first (<T>) 泛型可以在如下地方使用参数 T ：
/// 函数的返回值类型 (T)
/// 参数的类型 (List<T>)
/// 局部变量的类型 (T tmp)

T first<T>(List<T> ts) {
  T tmp = ts[0];
  return tmp;
}

void main(List<String> args) {
  // 使用集合字面量
  var names = <String>['Seth', 'Kathy', 'Lars'];
  var uniqueNames = <String>{'Seth', 'Kathy', 'Lars'}; // Set
  var pages = <String, String>{
    'index.html': 'Homepage',
    'robots.txt': 'Hints for web robots',
    'humans.txt': 'We are people, not machines'
  };

  // 使用泛型类型的构造函数
  var nemaSet = Set<String>.from(names);
  // var views = Map<int, View>();

  // 运行时中的泛型集合
  // Dart 中泛型类型是 固化的，也就是说它们在运行时是携带着类型信息的
  var aNames = List<String>();
  aNames.addAll(['Seth', 'Kathy', 'Lars']);
  print(aNames is List<String>);

  var someBaseClassFoo = Foo<SomeBaseClass>();
  var extenderFoo = Foo<Extender>();
  // 可以不指定泛型参数
  var foo = Foo();
  print(foo.runtimeType); // Foo<SomeBaseClass>
}
