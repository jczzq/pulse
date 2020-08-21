import 'package:flutter/material.dart';
import './browser.dart';

class PostPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
                return new Browser(url: "http://192.168.0.101:3000/", title: "百度");
              }));
            },
            child: Text('选择完毕'),
          ),
        ],
      )),
    );
  }
}
