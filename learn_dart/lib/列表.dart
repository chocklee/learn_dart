void list() {
  // 初始化
  var list = [1, 2, 3];
  print(list);

  List<int> list1 = [];
  list1..add(1)..add(2)..add(3);
  print(list1);

  // 固定长度
  var list2 = List<int>.filled(3, 0);
  print(list2); // [0, 0, 0]
  list2[0] = 1;
  list2[1] = 2;
  list2[2] = 3;
  // list2[3] = 4; // RangeError (index): Invalid value: Not in range 0..2, inclusive: 3

  // 生成数据
  List<int> list3 = List.generate(10, (index) => index);
  print(list3); // [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

  print(list.first); // 1
  print(list.last); // 3
  print(list.length); // 3
  print(list.isEmpty); // false
  print(list.isNotEmpty); // true
  print(list.reversed); // (3, 2, 1)

  // 添加
  List<int> l = [];
  l
    ..add(1)
    ..addAll([2, 3, 4, 5])
    ..insert(0, 6)
    ..insertAll(0, [7, 8, 9]);
  print(l); // [7, 8, 9, 6, 1, 2, 3, 4, 5]

  // 查询
  print(l.indexOf(5)); // 8
  var index = l.indexWhere((element) {
    return element == 4;
  });
  print(index); // 7

  // 删除
  l.remove(6);
  print(l); // [7, 8, 9, 1, 2, 3, 4, 5]

  l.removeAt(0);
  print(l); // [8, 9, 1, 2, 3, 4, 5]

  // Range
  l.fillRange(1, 3, 6);
  print(l); // [8, 6, 6, 2, 3, 4, 5]
  print(l.getRange(0, 5)); // (8, 6, 6, 2, 3)

  // 洗牌
  l.shuffle();
  print(l); // [6, 6, 8, 2, 3, 4, 5]

  // 排序
  l.sort(); // 默认升序
  print(l); // [2, 3, 4, 5, 6, 6, 8]

  List<DateTime> dtList = [];
  dtList.addAll([
    DateTime.now(),
    DateTime.now().add(Duration(days: -12)),
    DateTime.now().add(Duration(days: -2))
  ]);
  print(dtList);
  dtList.sort((a, b) => a.compareTo(b));
  print(
      dtList); // [2021-07-28 16:00:00.000, 2021-07-16 16:00:00.000, 2021-07-26 16:00:00.000]

  // 复制子列表
  var subList = l.sublist(0, 3);
  print(subList); // [2, 3, 4]

  // 操作符
  // +	连接
  var l1 = [1, 2, 3];
  var l2 = [4, 5, 6];
  print(l1 + l2); // [1, 2, 3, 4, 5, 6]
  l1[2] = 9;
  print(l1[2]); // 9
}
