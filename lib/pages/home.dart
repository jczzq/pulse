import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController typeController = TextEditingController();

  String showText = '欢迎您来到没好人间';

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: AppBar(title: Text('煤电')),
      body: Container(
        child: Column(children: <Widget>[
          TextField(
            controller: typeController,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10.0),
                labelText: '类型',
                helperText: '请输入你喜欢的类型'),
            autofocus: false,
          ),
          RaisedButton(
            onPressed: _chooseAction,
            child: Text('选择完毕'),
          ),
          Text(
            showText,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          )
        ]),
      ),
    ));
  }

  void _chooseAction() {
    if (typeController.text.toString() == '') {
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(title: Text('类型不能为空')));
    } else {
      getHttp(typeController.text.toString()).then((val) => {
            setState(() {
              showText = val.toString();
            })
          });
    }
  }

  Future getHttp(String typeText) async {
    print('开始请求...');
    try {
      Response res;
      var data = {'name': typeText};
      res = await new Dio().get('https://baidu.com', queryParameters: data);
      print('请求结束');
      print(res);
      return res.data;
    } catch (e) {
      return print(e);
    } finally {}
  }
}

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     getHttp();
//     return Scaffold(
//       body: Center(
//         child: Text('Pulse 首页'),
//       ),
//     );
//   }

//   void getHttp() async {
//     try {
//       Response res;
//       res = await Dio().get('https://baidu.com');
//       return print(res);
//     } catch (e) {
//       return print(e);
//     } finally {}
//   }
// }
