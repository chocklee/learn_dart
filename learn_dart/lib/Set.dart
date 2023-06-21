void test() {
  var a = Set();
  a.add('java');
  a.add('php');
  a.add('python');
  a.add('java');
  a.add('sql');
  a.add('swift');
  a.add('dart');
  print(a); // {java, php, python, sql, swift, dart}

  var b = Set<String>();
  b.addAll(['dart', 'c#', 'j#', 'e#']);
  print(b); // {dart, c#, j#, e#}

  // 去重 转List
  var ls = ['dart', 'java', 'c#', 'j#', 'e#', 'java'];
  var tags = Set();
  tags.addAll(ls);
  print(tags); // {dart, java, c#, j#, e#}
  print(tags.toList()); // [dart, java, c#, j#, e#]

  b.addAll(['dart', 'c#', 'j#', 'e#']);
  print(b.contains('dart')); // true
  print(b.containsAll(['dart', 'swift'])); // false
  print('b => $b'); // b => {dart, c#, j#, e#}
  print(a.difference(b)); // {php, python, sql}
  print(a.intersection(b)); // {dart}
  print(b.lookup('dart')); // dart
  print(b.union(a)); // {dart, c#, j#, e#, java, php, python, sql, swift}
  b.remove('dart');
  b.removeAll(['dart', 'c#']);
  b.clear();
  print(b.firstWhere((it) => it == 'c#')); // c#
  print(b.lastWhere((it) => it == 'c#')); // c#
  b.removeWhere((it) => it == 'c#');
  print(b); // {j#, e#}
  b.retainAll(['e#']);
  b.retainWhere((it) => it == 'e#');
  b.retainWhere((it) {
    bool ret = it == 'e#';
    return ret;
  });
  print(b); // {e#}

  // 交集
  var fd = <String>{
    "js",
    "node",
    "dart",
    "css",
    "html",
    "macos",
    "docker",
    "git"
  };
  var ed = <String>{
    "linux",
    "docker",
    "git",
    "go",
    "python",
    "sql",
    "node",
    "js",
    "aws"
  };

  print(fd.intersection(ed)); // {js, node, docker, git}

  // 联合
  fd = <String>{"js", "node", "dart", "css", "html", "macos", "docker", "git"};
  ed = <String>{
    "linux",
    "docker",
    "git",
    "go",
    "python",
    "sql",
    "node",
    "js",
    "aws"
  };

  print(fd.union(
      ed)); // {js, node, dart, css, html, macos, docker, git, linux, go, python, sql, aws}
}
