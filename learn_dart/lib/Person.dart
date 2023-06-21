/// 调用父类非默认构造函数
/// 默认情况下，子类的构造函数会自动调用父类的默认构造函数（匿名，无参数）
/// 父类的构造函数在子类构造函数体开始执行的位置被调用。
/// 如果提供了一个 initializer list （初始化参数列表）， 则初始化参数列表在父类构造函数执行之前执行。 总之，执行顺序如下：
/// 1. initializer list （初始化参数列表）
/// 2. superclass’s no-arg constructor （父类的无参构造函数）
/// 3. main class’s no-arg constructor （主类的无参构造函数）
/// 如果父类中没有匿名无参的构造函数， 则需要手工调用父类的其他构造函数。 在当前构造函数冒号 (:) 之后，函数体之前，声明调用父类构造函数。

class Person {
  String firstName;

  // 命名构造函数
  Person.fromJson(Map data) {
    print('in Person');
  }
}

class Employee extends Person {
  Employee.fromJson(Map data) : super.fromJson(data) {
    print('in Employee');
  }
}

void main(List<String> args) {
  var emp = Employee.fromJson({});

  // Prints:
  // in Person
  // in Employee
  if (emp is Person) {
    emp.firstName = 'Bob';
  }
  (emp).firstName = 'Bob';
}
