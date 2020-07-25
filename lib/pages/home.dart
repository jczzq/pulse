import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    getHttp();
    return Scaffold(
      body: Center(
        child: Text('Pulse 首页'),
      ),
    );
  }

  void getHttp() async {
    try {
      Response res;
      res = await Dio().get('https://baidu.com');
      return print(res);
    } catch (e) {
      return print(e);
    } finally {}
  }
}
