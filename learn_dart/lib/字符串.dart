void string() {
  final a = 'Bob\'s dog';
  final b = "a \"quoted\" string";

  final c = "Bob's dog";
  final d = 'a "quoted" string';

  final value = '"quoted"';
  final e = "a $value string";

  var f = 123;
  var g = 'li: ${f}';
  print(g); // li: 123

  // 字符串连接
  var h = 'hello' + ' ' + 'world';
  var h1 = 'hello' ' ' 'world';
  var h2 = 'hello'
      ' '
      'world';

  var h3 = '''
  hello world
  this is multi line string
  ''';

  var h4 = """
  hello world
  this is mulit line string
  """;

  // 转义符号
  var h5 = 'hello word \n this is multi line';
  print(h5);

  // 取消转义
  var h6 = r'hello word \n this is multi line';
  print(h6); // hello word \n this is multi line

  var j = 'web site ducafecat.tech';
  print(j.contains('ducafecat')); // true
  print(j.startsWith('web')); // true
  print(j.endsWith('tech')); // true
  print(j.indexOf('site')); // 4
  print(j.substring(0, 5)); // web s
  var k = j.split(' ');
  print(k); // [web, site, ducafecat.tech]

  // 大小写转换
  print(j.toLowerCase()); // web site ducafecat.tech
  print(j.toUpperCase()); // WEB SITE DUCAFECAT.TECH

  print('   hello world   '.trim()); // hello world
  print(''.isEmpty); // true

  print(
      'hello world world!'.replaceFirst('world', 'dart')); // hello dart world!

  // 字符串创建
  var sb = StringBuffer();
  sb
    ..write('hello world!')
    ..write(' ')
    ..write('my')
    ..write(' ')
    ..writeAll(['web', 'site', 'https://ducafecat.tech']);
  print(sb.toString()); // hello world! my web site https://ducafecat.tech
}
