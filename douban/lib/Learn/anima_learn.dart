import 'package:flutter/material.dart';

class KLAnimationPage extends StatefulWidget {
  KLAnimationPage({Key key}) : super(key: key);

  @override
  _KLAnimationPageState createState() => _KLAnimationPageState();
}

class _KLAnimationPageState extends State<KLAnimationPage>
    with SingleTickerProviderStateMixin {
  AnimationController _rControl;
  Animation _rColorAnimation;

  Animation rSizeAni;

  @override
  void initState() {
    super.initState();
//1 创建 AnimationController  this必须在某个方法中才能使用

    _rControl = AnimationController(
        duration: Duration(seconds: 2),
        value: 1,
        // lowerBound: 0,
        // upperBound: 1,
        vsync: this);

// 设置curve效果
    _rColorAnimation = ColorTween(begin: Colors.blue, end: Colors.red).animate(_rControl);

    rSizeAni = Tween(begin: 1.0, end: 5.0).animate(_rControl);

    _rControl.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _rControl.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _rControl.forward();
      }
    });
  }

  @override
  void dispose() {
    _rControl.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("LAnimationPage build");
    return Scaffold(

      appBar: AppBar(

actions: [

RaisedButton(onPressed: () {
        if (_rControl.isAnimating) {
          _rControl.stop();
        } else {
          if (_rControl.status == AnimationStatus.forward) {
            _rControl.forward();
          } else if (_rControl.status == AnimationStatus.reverse) {
            _rControl.reverse();
          } else {
            _rControl.forward();
          }
        }
      }, child: Icon(Icons.add) )

],

      ),

       body: Center(
        child: AnimatedBuilder(
          animation: _rControl,
          child: Text(
            "sjfkajhj jahf jhaj f fa a ",
            style: TextStyle(color: Colors.black),
          ),
          builder: (BuildContext context, Widget child) {
            print("AnimatedBuilder build");

            return Stack(children: [
              Icon(
                Icons.favorite,
                color:  _rColorAnimation.value ,
                size: 50 * rSizeAni.value,
               ),
              child,
            ]);
          },
        ),
      ),
     );
  }
}

/*
class KLAnimationWiget extends AnimatedWidget {
  KLAnimationWiget(Animation anim) : super(listenable: anim);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    print("AnimatedWidget build");

    Animation rSizeAni = listenable;
    return Icon(
      Icons.favorite,
      color: Colors.red,
      size: 50 * rSizeAni.value,
    );
  }
}
*/
