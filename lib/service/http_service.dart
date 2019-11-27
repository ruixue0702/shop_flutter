import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';
import '../config/index.dart';

Future request(url, {formData})async{
  print('request url');
  print(url);
  print('request formData');
  print(formData);
  try {
    Response response;
    Dio dio = new Dio();
    dio.options.contentType = ContentType.parse("application/x-www-form-urlencoded");
    if (formData == null) {
      response = await dio.post(servicePath[url]);
    } else {
      response = await dio.post(servicePath[url], data: formData);
    }
    print('response');
    print(response);
    print('formData');
    print(formData);
    print('response.statusCode');
    print(response.statusCode);
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception("后端接口异常，请检查测试代码和服务器运行情况...");
    }
  } catch(e) {
    return print(e);
  }
}