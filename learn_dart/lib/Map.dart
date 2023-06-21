void map() {
  var a = {'name': 'ducafecat', 'web': 'www.ducafecat.tech'};
  print(a); // {name: ducafecat, web: www.ducafecat.tech}

  // 松散
  var b = Map(); // Map<Object, Object>
  b['name'] = 'ducafecat';
  b['web'] = 'www.ducafecat.tech';
  b[0] = 'abc';
  b[0] = '123123';
  b[0] = 123;
  print(b);

  // 强类型
  var c = Map<int, String>();
  c[0] = 'java';
  c[1] = 'dart';
  print(c);

  // Map 的属性
  print(a.isEmpty); // false
  print(a.isNotEmpty); // true
  print(a.keys); // (name, web)
  print(a.values); // (ducafecat, www.ducafecat.tech)
  print(a.length); // 2
  print(a
      .entries); // (MapEntry(name: ducafecat), MapEntry(web: www.ducafecat.tech))

  // 常用方法
  // addAll
  b.addAll({'first': 'java', 'second': 'dart'});

  // addEntries
  b.addEntries(a.entries);
  print(b);

  // containsKey
  print(a.containsKey('name')); // true

  // containsValue
  print(a.containsValue('java')); // false

  // clear
  b.clear();
  print(b); // {}

  // remove
  a.remove('name');
  print(a); // {web: www.ducafecat.tech}

  // removeWhere
  a.removeWhere((key, value) => key == 'web');
  print(a); // {}

  // update
  a.update('name', (value) => 'ducafecat');
  print(a); // {name: ducafecat}

  // updateAll
  a.updateAll((key, value) => '--$value--');
  print(a); // {name: --ducafecat--}
}

void main(List<String> args) {
  map();
}
