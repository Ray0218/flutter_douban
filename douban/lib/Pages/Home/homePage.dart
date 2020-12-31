import 'package:douban/Common/dash_line.dart';
import 'package:flutter/material.dart';
import 'package:douban/Common/start_rate.dart';

import '../../Net/home_request.dart';
 
class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    KLHomeRequest.rGetMovieList(0);

    print("#############3");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: ListView.builder(
        itemCount: 30,
        itemBuilder: (BuildContext context, int index) {
          return createListCell();
        },
      ),
    );
  }

  Widget createListCell() {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.only(left: 10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Card(
          child: Text("NO.1"),
          color: Colors.yellow,
          margin: EdgeInsets.fromLTRB(0, 10, 0, 15),
          elevation: 1,
          shape: RoundedRectangleBorder(),
        ),
        Row(
          children: [
            Image.network(
              "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=114110445,294667657&fm=26&gp=0.jpg",
              width: 100,
            )
          ],
        ),
        Text("The Shnawk Rede")
      ]),
    );
  }
}
