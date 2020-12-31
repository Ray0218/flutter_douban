import 'package:flutter/material.dart';
 
 import 'my/myPage.dart';
 import 'Home/homePage.dart';
class KLRootWidget extends StatefulWidget {
  KLRootWidget({Key key}) : super(key: key);

  @override
  _KLRootWidgetState createState() => _KLRootWidgetState();
}

class _KLRootWidgetState extends State<KLRootWidget> {
  var _currentIndex = 0;

  List<Widget> _controls = [
    HomePage(),
    HomePage(),
    HomePage(),
    HomePage(),
    MyPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title:Text("首页")

      ),
      body: IndexedStack(
        children: _controls,
        index: _currentIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [

              _createBarItem("home.png", "home_active.png", "首页"),
                            _createBarItem("subject.png", "subject_active.png", "书影音"),

              _createBarItem("group.png", "group_active.png", "小组"),

              _createBarItem("mall.png", "mall_active.png", "市集"),


              _createBarItem("profile.png", "profile_active.png", "我的")
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        selectedFontSize: 14,
        unselectedFontSize: 14,

      
        selectedItemColor: Colors.green,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

BottomNavigationBarItem _createBarItem(String normal, String select, String title) {
 
return    BottomNavigationBarItem(
              icon: Image.asset("images/tabbar/$normal", width: 32),
              activeIcon: Image.asset(
                "images/tabbar/$select",
                width: 32,
              ),
              title: Text("$title"),
              

              );
}
}
