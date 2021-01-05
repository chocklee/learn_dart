/// 使用 typedef ，或者 function-type alias 为函数起一个别名， 别名可以用来声明字段及返回值类型。
/// 当函数类型分配给变量时，typedef会保留类型信息。

typedef Compare<T> = int Function(T a, T b);

class SortedCollection {
  Compare<int> compare;

  SortedCollection(this.compare);
}

int sort(int a, int b) => a - b;

void main(List<String> args) {
  SortedCollection coll = SortedCollection(sort);

  assert(coll.compare is Function);
  assert(coll.compare is Compare);

  assert(sort is Compare<int>);
}
