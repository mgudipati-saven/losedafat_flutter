import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Gauge extends StatelessWidget {
  final double min;
  final double max;
  final double value;
  final double width;
  final double height;
  final Color tickColor;
  final TextStyle style;
  final bool showZero;

  Gauge({
    Key key,
    this.tickColor,
    this.style,
    this.showZero,
    this.min,
    this.max,
    this.height,
    this.value,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomPaint(
        size: Size.infinite,
        painter: _GaugePainter(
            context: context, tickColor: Color(0xFF9EADED), style: style),
      ),
    );
  }
}

class _GaugePainter extends CustomPainter {
  final BuildContext context;
  final Color tickColor;
  final TextStyle style;
  final bool showZero;
  final double readingTicker;

  // device pixel ratio
  double dpr;

  _GaugePainter({
    this.showZero = false,
    this.tickColor,
    this.style = const TextStyle(color: Color(0xFFF7A048)),
    this.context,
    this.readingTicker = 15,
  }) {
    dpr = MediaQuery.of(context).devicePixelRatio;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final Paint mmTick = Paint()
      ..color = tickColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    // cm tick
    final Paint cmTick = Paint()
      ..color = tickColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    // reading tick
    final Paint readingTick = Paint()
      ..color = tickColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.5;

    final shapeBounds = Rect.fromLTRB(0, 0, size.width, 2 * size.height);

    final arcPaint = Paint()
      ..color = tickColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6;

    final valueArcPaint = Paint()
      ..color = Color(0xFFF7A048)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6;

    final textPainter = new TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.rtl,
    );

    final textStyle = const TextStyle(
      color: Color(0xFFF7A048),
      fontSize: 15.0,
      fontWeight: FontWeight.bold,
    );

    final radius = size.width / 2;
    final angle = pi / 34;

    // draw the main arc
    canvas.drawArc(shapeBounds.deflate(24), 0, -pi, false, arcPaint);

    // draw the value arc
    canvas.drawArc(shapeBounds.deflate(24), -pi, pi / 2, false, valueArcPaint);

    canvas.save();
    canvas.translate(radius, radius);

    for (int i = 0; i < 35; i++) {
      if (i == 17) {
        canvas.drawLine(
            Offset(-radius, 0.0), Offset(-radius + 18, 0.0), readingTick);

        var dialPoint = Offset(-radius + 35, 0.0);
        var path = Path()
          ..moveTo(dialPoint.dx, dialPoint.dy)
          ..lineTo(dialPoint.dx + 5, dialPoint.dy + 5)
          ..lineTo(dialPoint.dx + 5, dialPoint.dy - 5)
          ..close();

        canvas.drawPath(path, readingTick);
      } else {
        canvas.drawLine(
            Offset(-radius + 6, 0.0), Offset(-radius + 18, 0.0), cmTick);
      }

      if (i == 0) {
        canvas.save();
        canvas.translate(-radius + 30, 0.0);

        textPainter.text = new TextSpan(
          text: '1',
          style: textStyle,
        );

        //helps make the text painted vertically
        canvas.rotate(-angle * i);

        textPainter.layout();

        textPainter.paint(
            canvas, Offset((textPainter.width / 2), -(textPainter.height / 2)));

        canvas.restore();
      }

      if (i == 16) {
        canvas.save();
        canvas.translate(-radius - 15, -9.0);

        textPainter.text = new TextSpan(
          text: '5',
          style: textStyle,
        );

        //helps make the text painted vertically
        canvas.rotate(-angle * i);

        textPainter.layout();

        textPainter.paint(
            canvas, Offset((textPainter.width / 2), -(textPainter.height / 2)));

        canvas.restore();
      }

      if (i == 34) {
        canvas.save();
        canvas.translate(-radius + 24 + 35, 0.0);

        textPainter.text = new TextSpan(
          text: '10',
          style: textStyle,
        );

        //helps make the text painted vertically
        canvas.rotate(-angle * i);

        textPainter.layout();

        textPainter.paint(
            canvas, Offset((textPainter.width / 2), -(textPainter.height / 2)));

        canvas.restore();
      }

      canvas.rotate(angle);
    }

    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
