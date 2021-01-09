import 'dart:ui';

import 'package:douban/Common/dash_line.dart';
import 'package:douban/CusConfig/device_info.dart';
import 'package:douban/Learn/global_event.dart';
import 'package:flutter/material.dart';
import 'package:douban/Common/start_rate.dart';

import '../../Net/home_request.dart';
import 'home_detail.dart';
import "../../Common/color_extension.dart" ;

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>  with SingleTickerProviderStateMixin{


  AnimationController _rControler ;
  @override
  void initState() {



 
 
    super.initState();

    _rControler = AnimationController(vsync: this) ;
    _rControler.addListener(() {
      
    }) ;

    KLHomeRequest.rGetMovieList(0);

    eventBus.on().listen((event) {
      print("######接收到事件#######");

      print(event);
    });
  }

  @override
  Widget build(BuildContext context) {


print("导航栏高度1:") ;

print(MediaQuery.of(context).padding.top) ;
print("导航栏高度2: ") ;

print(KLSizeFit.statusHeight) ;


 
    return Scaffold(
      appBar: AppBar(title: Text("首页")),
      body: Container(
        color: Colors.grey,
        child: ListView.builder(
          itemCount: 30,
          itemBuilder: (BuildContext context, int index) {
            return createListCell(index);
          },
        ),
      ),
    );
  }

  Widget createListCell(int index) {
    return GestureDetector(
        onTap: () {
          print("context:  $context");

          // Navigator.of(context)
          //     .pushNamed("kDetail", arguments: "$index")
          //     .then((value) {
          //   print(value);
          // });

//自定义转场动画
          Navigator.of(context).push(PageRouteBuilder(
            transitionDuration: Duration(seconds: 3),
            pageBuilder: (context, animation, secondaryAnimation) {

            
              return FadeTransition(
                  opacity: animation,
                  child: KLDetailPage(
                    message: "$index",
                  ));
            },
          ));

          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         fullscreenDialog: true, //modePresent方式
          //         builder: (ctx) {
          //           return KLDetailPage(
          //             message: "$index",
          //           );
          //         }));
        },
        child: Container(
          color: Colors.white,
          margin: EdgeInsets.only(bottom: 10),
          padding: EdgeInsets.only(left: 10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Card(
              child: Padding(
                padding: EdgeInsets.fromLTRB(6, 4, 6, 4),
                child: Text("NO.$index"),
              ),
              color: Colors.yellow,
              margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
              elevation: 1,
              shape: RoundedRectangleBorder(),
            ),
            _buildContent(index),
            SizedBox(
              height: 5,
            ),
            Container(
                color: Colors.yellow,
                width: double.infinity,
                margin: EdgeInsets.only(right: 10),
                padding: EdgeInsets.only(top: 5, bottom: 5),
                child: Text("The Shnawk Rede"))
          ]),
        ));
  }

  Widget _buildContent(int index) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            "https://picsum.photos/100/120?random=$index",
            width: 100,
          ),
        ),
        _buildCenter(),
        Container(
            height: 100,
            child: KLDashLine(
                rDirection: Axis.vertical,
                rWidth: 0.5,
                rHeight: 5,
                rCount: 10)),
        Container(
            width: 50,
            height: 100,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.favorite_border, color: Colors.red),
                  Text(
                    "喜欢",
                    style: TextStyle(fontSize: 12),
                  )
                ]))
      ],
    );
  }

  Widget _buildCenter() {
    return Expanded(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text:
              // Text.rich(

              TextSpan(
                  // text: "dddd",
                  style: TextStyle(color: Colors.black),
                  children: [
                TextSpan(children: [
                  WidgetSpan(
                      child: Icon(
                    Icons.play_circle_outline,
                    color: Colors.purple,
                    size: 18,
                  )),
                ]),
                TextSpan(
                    text: "对方看得见安抚阿卡发啊20",
                    style: TextStyle(color: Colors.black, fontSize: 16)),
                TextSpan(
                    text: "司法局2020",
                    style: TextStyle(color: Colors.grey, fontSize: 14))
              ]),
        ),
        SizedBox(
          height: 5,
        ),
        KLStarRate(
          rating: 3,
          rStartSize: 15,
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          "类别 名称  导演 类别 名称  导演类别 名称  导演类别 名称  导演类别 名称  导演类别 名称  导演类别 名称  导演",
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 15),
        ),
      ],
    ));
  }
}
