import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import './home.dart';
import './user.dart';
import './shop.dart';
import './post.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), title: Text('首页')),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.search), title: Text('文章')),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.car_detailed), title: Text('惊喜')),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.share), title: Text('我的')),
  ];

  final List tabContents = [
    HomePage(),
    PostPage(),
    ShopPage(),
    UserPage(),
  ];

  int currentIndex = 0;
  var currentPage;

  @override
  void initState() {
    currentPage = tabContents[currentIndex];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 245, 245, 1),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        items: bottomTabs,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            currentPage = tabContents[currentIndex];
          });
        },
      ),
      body: currentPage,
    );
  }
}
