 import 'package:flutter/material.dart';
 import 'package:provider/provider.dart';

import 'CusConfig/device_info.dart';
import 'Learn/model_learn.dart';
import 'projectDemo/core/router/router.dart';
import 'projectDemo/ui/shared/theme_config.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => KLCounterModel(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
//初始化设备信息
    KLSizeFit.initialize();

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

          // brightness: Brightness.dark, //暗黑/普通 模式
          // primarySwatch: Colors.green, //主题色
          primaryColor: Colors.green,
          accentColor: Colors.red, //设置类似floattingbutton/switch

          visualDensity: VisualDensity.adaptivePlatformDensity,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent, //删除高亮效果，

          buttonTheme: ButtonThemeData(
              minWidth: 10,
              buttonColor: Colors.purple,
              hoverColor: Colors.orange),
          cardTheme: CardTheme(color: Colors.blue),
          textTheme: TextTheme(bodyText1: TextStyle(color: Colors.black))),
      darkTheme: KLAppTheme.darkTheme,
      // home: KLRootWidget(),
      routes: KLRouter.rRouters,
      initialRoute: KLRouter.rInitialRoute,
      onGenerateRoute: KLRouter.rOnGenerateRoute,
      onUnknownRoute: KLRouter.rOnUnknownRoute,

      //MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
