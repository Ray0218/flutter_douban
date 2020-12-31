import 'package:flutter/material.dart';

class KLStarRate extends StatefulWidget {
  final double rating;
  final double rMaxRating;
  final int rStartCount;
  final double rStartSize;
  final Color rSelectColor;
  final Color rNormalColor;

  KLStarRate(
      {Key key,
      @required this.rating,
      this.rMaxRating = 10,
      this.rStartCount = 5,
      this.rStartSize = 30,
      this.rNormalColor = const Color(0xffbbbbbb),
      this.rSelectColor = const Color(0xffff0000)})
      : super(key: key);

  @override
  _KLStarRateState createState() => _KLStarRateState();
}

class _KLStarRateState extends State<KLStarRate> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: buildNormalStar(),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: buildSelectStar(),
        ),
      ],
    );
  }

  List<Widget> buildNormalStar() {
    return List.generate(widget.rStartCount, (index) {
      return Icon(Icons.star_border,
          color: widget.rNormalColor, size: widget.rStartSize);
    });
  }

  List<Widget> buildSelectStar() {
    List<Widget> stars = [];

//满填充
    double oneValue = widget.rMaxRating / widget.rStartCount;

    int entCount = (widget.rating / oneValue).floor();

    List<Widget> entWidget = List.generate(entCount, (index) {
      return Icon(
        Icons.star,
        color: widget.rSelectColor,
        size: widget.rStartSize,
      );
    });
    stars += entWidget;

    final partStar = ClipRect(
      clipper: KLCustomerClipper(
          ((widget.rating - entCount * oneValue) / oneValue) *
              widget.rStartSize),
              child:   Icon(Icons.star, color: widget.rSelectColor, size: widget.rStartSize,),

    );
    stars.add(partStar);
    return stars;
  }
}

// 自定义裁剪
class KLCustomerClipper extends CustomClipper<Rect> {
  final double rWidth;

  KLCustomerClipper(this.rWidth);

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0, 0, rWidth, size.height);
  }

  @override
  bool shouldReclip(KLCustomerClipper oldClipper) {
    return oldClipper.rWidth != rWidth;
  }
}
