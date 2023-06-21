import 'dart:async';

import 'package:dio/dio.dart';

// 异步回调 then
// void main() {
//   var dio = Dio();
//   dio
//       .get('https://wpapi.ducafecat.tech/products/categories')
//       .then((response) => print(response.data));
// }

// 异步等待 await
// async 写在函数定义
// await 写在异步调用前
// void main() async {
//   var dio = Dio();
//   var response =
//       await dio.get('https://wpapi.ducafecat.tech/products/categories');
//   print(response.data);
// }

// 异步返回值
Future<List<dynamic>?> getUrl(String url) async {
  var dio = Dio();
  var response = await dio.get(url);
  return response.data;
}

void main() async {
  var content =
      await getUrl('https://wpapi.ducafecat.tech/products/categories');
  print(content);
}
