/// 通过实现类的 call() 方法， 能够让类像函数一样被调用

class WannabeFunction {
  call(String a, String b, String c) => '$a $b $c';
}

void main() {
  var wf = WannabeFunction();
  var out = wf('Hi', 'there', 'gang');
  print('$out');
}
