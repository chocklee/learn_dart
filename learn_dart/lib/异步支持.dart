/// Dart 库中包含许多返回 Future 或 Stream 对象的函数.
/// 这些函数在设置完耗时任务（例如 I/O 曹组）后， 就立即返回了，不会等待耗任务完成。
/// 使用 async 和 await 关键字实现异步编程。 可以让你像编写同步代码一样实现异步操作。

// 处理 Future
// 获得 Future 执行完成的结果: 使用 async 和 await； 使用 Future API
// 使用 async 和 await 关键字的代码是异步的
// 要使用 await ， 代码必须在 异步函数（使用 async 标记的函数）中
Future checkVersion() async {
  var version = await lookUpVersion();
  print(version);
  // 使用 try， catch， 和 finally 来处理代码中使用 await 导致的错误
  // try {
  //   version = await lookUpVersion();
  // } catch (e) {
  //   // ...
  // }
}
// 虽然异步函数可能会执行耗时的操作， 但它不会等待这些操作。
// 相反，异步函数只有在遇到第一个 await 表达式时才会执行。 也就是说，它返回一个 Future 对象，仅在await表达式完成后才恢复执行。

// 在 await 表达式中， 表达式的值通常是一个 Future 对象； 如果不是，这时表达式的值会被自动包装成一个 Future 对象。
// Future 对象指明返回一个对象的承诺（promise）。
// await 表达式执行的结果为这个返回的对象。
// await 表达式会阻塞代码的执行，直到需要的对象返回为止。

// 如果在使用 await 导致编译时错误， 确认 await 是否在一个异步函数中。
// 例如，在应用的 main() 函数中使用 await ， main() 函数的函数体必须被标记为 async
Future main() async {
  await checkVersion();
  print('In main: version is ${await lookUpVersion()}');

  // await for (var request in requestServer) {
  //   handleRequest(request);
  // }
}

/// 声明异步函数
/// 函数体被 async 标示符标记的函数，即是一个异步函数
/// 将 async 关键字添加到函数使其返回Future

// 函数体不需要使用Future API。 如有必要， Dart 会创建 Future 对象。
// 如果函数没有返回有效值，需要设置其返回类型为 Future<void> 。
Future<String> lookUpVersion() async => '1.0.0';

/// 处理 Stream
/// 当需要从 Stream 中获取数据值时， 可以通过一下两种方式:
/// 使用 async 和 一个 异步循环 （await for）
/// 使用 Stream API

// 异步for循环的使用形式:
void asyncFor() {
  // await for (varOrType identifier in expression) {}

  // 上面 expression 返回的值必须是 Stream 类型。 执行流程如下：
  // 等待，直到流发出一个值
  // 执行 for 循环体，将变量设置为该发出的值
  // 重复1和2，直到关闭流。
}

/// 使用 break 或者 return 语句可以停止接收 stream 的数据， 这样就跳出了 for 循环， 并且从 stream 上取消注册。
/// **如果在实现异步 for 循环时遇到编译时错误， 请检查确保 await for 处于异步函数中。**
/// 例如，要在应用程序的 main() 函数中使用异步 for 循环， main() 函数体必须标记为 async
