import 'package:douban/Pagess/Home/unknow_page.dart';
import 'package:douban/Pagess/my/myPage.dart';
import 'package:flutter/material.dart';

import '../../ui/pagges/tabbar.dart';
import '../../../Pagess/Home/home_detail.dart';

class KLRouter {
  // 命名路由
  static final Map<String, WidgetBuilder> rRouters = {
    "kMy": (ctx) => MyPage(),
    "kRoot": (ctx) => KLRootWidget(),
  };

// 初始路由
  static final rInitialRoute = "kRoot";

// 路由拦截 可以传参的，相比于命名路由，可以多做一些相关的拦截
  static final RouteFactory rOnGenerateRoute = (setting) {
    if (setting.name == "kDetail") {
      return MaterialPageRoute(
          settings: setting,
          builder: (ctx) {
            return KLDetailPage(
              message: setting.arguments,
            );
          });
    }
    return null;
  };

//找不到对应的路由名称时跳转
  static final RouteFactory rOnUnknownRoute = (setting) {
    return MaterialPageRoute(builder: (cxt) {
      return KLUnKnowPage();
    });
  };
}
