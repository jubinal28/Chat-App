import 'package:flutter/material.dart';


class DotTabIndicator extends Decoration {
  final Color color;
  final double radius;

  const DotTabIndicator({
    required this.color,
    this.radius = 2.0,
  });

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _DotPainter(this);
  }
}

class _DotPainter extends BoxPainter {
  final DotTabIndicator decoration;

  _DotPainter(this.decoration);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final rect = offset & configuration.size!;
    final Paint paint = Paint();
    paint.color = decoration.color;
    paint.style = PaintingStyle.fill;
    canvas.drawCircle(Offset(rect.center.dx, rect.bottom - 4), decoration.radius, paint);
  }
}