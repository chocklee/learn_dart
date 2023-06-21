void safeNull() {
  // 默认不可空
  var title = 'title';

  // type? 可空
  String? name;

  // value! 值保证不为空，主观上
  String? title1 = 'ducafecat';
  var newTitle = title!;

  // value?. 不为空才执行
  var isEmpty = title1?.isEmpty;

  // value?? 如果空执行
  var newTitle1 = title ?? 'cat';

  // late 声明
  // 延迟加载修饰符
  // 声明一个不可空的变量，并在声明后初始化。
  late String title2;
  title2 = 'title';
  print(title2); // title
}
