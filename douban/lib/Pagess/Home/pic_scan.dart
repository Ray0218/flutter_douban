import 'package:flutter/material.dart';

class KLPicturePage extends StatelessWidget {
  const KLPicturePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: Theme.of(context).copyWith(primaryColor: Colors.black),
        child: Scaffold(
          appBar: AppBar(title: Text("图片预览")),
          body: GridView.builder(
              itemCount: 20,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 16 / 9),
              itemBuilder: (ctx, index) {
                final imageUrl = "https://picsum.photos/500/400?random=$index";
                return GestureDetector(
                  child: Hero(
                      tag: imageUrl,
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                      )),
                  onTap: () {
                    Navigator.of(context)
                        .push(PageRouteBuilder(pageBuilder: (xct, anim, anim2) {
                      return FadeTransition(
                        opacity: anim,
                        child: KLImageDetailPage(imageUrl),
                      );
                    }));
                  },
                );
              }),
        ));
  }
}

class KLImageDetailPage extends StatefulWidget {
  final String rImgUrl;

  KLImageDetailPage(this.rImgUrl, {Key key}) : super(key: key);

  @override
  _KLImageDetailPageState createState() => _KLImageDetailPageState();
}

class _KLImageDetailPageState extends State<KLImageDetailPage> {
  @override
  Widget build(BuildContext context) {
   return  Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: GestureDetector(
            child: Hero(
                tag: widget.rImgUrl,
                child: Image.network(
                  widget.rImgUrl,
                  fit: BoxFit.cover,
                )),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
        ));
  }
}
