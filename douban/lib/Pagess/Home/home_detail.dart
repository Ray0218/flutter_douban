import 'package:flutter/material.dart';

class KLDetailPage extends StatelessWidget {
  final String message;

  const KLDetailPage({Key key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routmessage = ModalRoute.of(context).settings.arguments as String;


    return WillPopScope(
        child: Scaffold(
            appBar: AppBar(title: Text("详情页")),
            body: Center(
                child: RaisedButton(
                    child: Text("$message   $routmessage"),
                    onPressed: () {
                      // Navigator.pop(context);
                      Navigator.of(context).pop("我是详情页回传的值");
                    }))),
        onWillPop: () {
          Navigator.of(context).pop();

          return Future.value(false); //false 自行写返回  true执行系统返回
        });
  }
}


extension KLDetailPage1 on KLDetailPage{

}