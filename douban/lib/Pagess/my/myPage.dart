import 'dart:math';

import 'package:douban/Learn/global_event.dart';
import 'package:douban/Learn/model_learn.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Learn/inherite_learn.dart';



class MyPage extends StatefulWidget {
  MyPage({Key key}) : super(key: key);

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  List<String> rTitles = ["aa", "bbb", "ccc", "ddd"];

  @override
  Widget build(BuildContext context) {
    print("MyPageState build");
    return Scaffold(
        appBar: AppBar(
          title: Text("我 的"),
        ),
        body: KLICounterWidget(
          child: KLTestInherite(),
        ),
        floatingActionButton: Selector<KLCounterModel, KLCounterModel>(
          child: Icon(Icons.delete),
          builder: (ctx, model, tChild) {
            print("floatingActionButton build");

            return FloatingActionButton(
                // child: Icon(Icons.delete),
                child: tChild,
                onPressed: () {
                  model.rCounter += 1;
                });
          },
          selector: (ctx, model) {
            return model;
          },
          shouldRebuild: (mode1, mode2) => false,
        )

        //  Consumer<KLCounterModel>(
        //     child: Icon(Icons.delete),
        //     builder: (ctx, counter, tChild) {
        //       print("floatingActionButton build");

        //       return FloatingActionButton(
        //           // child: Icon(Icons.delete),
        //           child: tChild,
        //           onPressed: () {
        //             counter.rCounter += 1;
        //             // setState(() {});
        //           });
        //     }),
        );
  }
}

class KLTestInherite extends StatelessWidget {
  const KLTestInherite({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //  int counter = KLICounterWidget.of(context).rCounter;
    // int count = Provider.of<KLCounterModel>(context).rCounter;

    print("KLTestInherite build");
    return Consumer<KLCounterModel>(builder: (ctx, mode, tChild) {
      return GestureDetector(
        child: Container(

        height: 200,
        width: 200,
        color: Colors.orange,
        alignment: Alignment.center,
        child: Container(
           height: 100,
        width: 100,
        color: Colors.red,
        child: Text("${mode.rCounter}"),
        ),
      ),
      onTap: (){

        print("tap手势");

        eventBus.fire("发出的数据");
      },
      onTapCancel: (){
                print("取消手势");

      },
      ) ;
    });
  }
}
