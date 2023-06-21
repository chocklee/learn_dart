// Dart 中的所有异常是非检查异常。 方法不会声明它们抛出的异常， 也不要求捕获任何异常。
// Dart 提供了 Exception 和 Error 类型， 以及一些子类型。
import 'dart:math';

void exception() {
  // Catch
  // 捕获异常可以避免异常继续传递（除非重新抛出（ rethrow ）异常）。
  try {
    // ...
  } on FormatException {
    // ...
  }

  // 通过指定多个 catch 语句，可以处理可能抛出多种类型异常的代码。
  try {
    // ...
  } on FormatException {
    // 一个特殊的异常
    // ...
  } on Exception catch (e) {
    // 其他任何异常
    print('Unknown exception: $e');
  } catch (e) {
    // 没有指定的类型，处理所有异常
    print('Something really unknown: $e');
  }

  // 捕获语句中可以同时使用 on 和 catch ，也可以单独分开使用。 使用 on 来指定异常类型， 使用 catch 来捕获异常对象。
  // catch() 函数可以指定1到2个参数， 第一个参数为抛出的异常对象， 第二个为堆栈信息
  try {
    // ···
  } on Exception catch (e) {
    print('Exception details:\n $e');
  } catch (e, s) {
    print('Exception details:\n $e');
    print('Stack trace:\n $s');
  }

  // finally
  // 不管是否抛出异常， finally 中的代码都会被执行。 如果 catch 没有匹配到异常， 异常会在 finally 执行完成后，再次被抛出
  try {
    // ...
  } finally {
    // ...
  }

  // 任何匹配的 catch 执行完成后，再执行 finally
  try {
    // ...
  } catch (e) {
    print('Error: $e'); // Handle the exception first.
  } finally {
    // ...
  }

  throw FormatException('Expected at least 1 section');
}

void distanceTo(Point other) => throw UnimplementedError();

// 如果仅需要部分处理异常，可以使用关键字 rethrow 将异常重新抛出
void misbehave() {
  try {
    dynamic foo = true;
    print(foo++); // 运行时错误
  } catch (e) {
    print('misbehave() partially handled ${e.runtimeType}.');
    rethrow; // Allow callers to see the exception.
  }
}

void main(List<String> args) {
  try {
    misbehave();
  } catch (e) {
    print('misbehave() partially handled ${e.runtimeType}.');
  }
}
