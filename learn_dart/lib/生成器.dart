import 'dart:async';

/// 当需要延时生成一系列值时，可以考虑使用 生成器函数
/// Dart内置两种生成器函数：
/// Synchronous 生成器： 返回一个 Iterable 对象。
/// Asynchronous 生成器： 返回一个 Stream 对象。

// 通过在函数体标记 sync*， 可以实现一个同步生成器函数。 使用 yield 语句来传递值
Iterable<int> naturalsTo(int n) sync* {
  print('start');
  var k = 0;
  while (k < n) {
    // yield 会等待 moveNext 指令，然后再执行下一步
    yield k++;
  }
  print('end');
}

// 通过在函数体标记 async*， 可以实现一个异步生成器函数。 使用 yield 语句来传递值
Stream<int> asynchronousNaturalsTo(int n) async* {
  print('start');
  var k = 0;
  while (k < n) {
    yield k++;
  }
  print('end');
}

// 如果生成器是递归的，可以使用 yield* 来提高其性能
Iterable<int> naturalsDownFrom(int n) sync* {
  if (n > 0) {
    yield n;
    yield* naturalsDownFrom(n - 1);
  }
}

void main(List<String> args) {
  // var it = naturalsTo(5).iterator;
  // while (it.moveNext()) {
  //   print(it.current);
  // }

  // 流监听
  // asynchronousNaturalsTo(5).listen((data) {
  //   print(data);
  // });

  // 流监听 StreamSubscription 对象
  // StreamSubscription subscription = asynchronousNaturalsTo(5).listen(null);
  // subscription.onData((value) {
  //   print(value);
  //   // subscription.pause();
  // });

  var it = naturalsDownFrom(5).iterator;
  while (it.moveNext()) {
    print(it.current);
  }
}
