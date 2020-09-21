import 'dart:ui' as ui;

import 'package:flutter/widgets.dart';

class Ruler extends StatelessWidget {
  final Color tickColor;
  final TextStyle style;
  final bool showZero;

  Ruler({Key key, this.tickColor, this.style, this.showZero}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomPaint(
        foregroundPainter:
            _RulerPainter(context: context, tickColor: tickColor, style: style),
      ),
    );
  }
}

class _RulerPainter extends CustomPainter {
  final BuildContext context;
  final Color tickColor;
  final TextStyle style;
  final bool showZero;
  final double readingTicker;

  // device pixel ratio
  double dpr;

  _RulerPainter({
    this.showZero = false,
    this.tickColor,
    this.style,
    this.context,
    this.readingTicker = 15,
  }) {
    dpr = MediaQuery.of(context).devicePixelRatio;
  }

  @override
  void paint(Canvas canvas, Size size) {
    //print('Entered paint method: size: $size');
    // mm tick
    Paint mmTick = Paint()
      ..color = tickColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    // cm tick
    Paint cmTick = Paint()
      ..color = tickColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    // reading tick
    Paint readingTick = Paint()
      ..color = tickColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;

    int ticker = 0;
    double physicaLogicalRatio = 3.9;
    //double maxSize = size.height / physicaLogicalRatio * 100 / dpr;
    double maxSize = size.width / physicaLogicalRatio / dpr;
    while (ticker <= maxSize) {
      //double y = ticker * physicaLogicalRatio * dpr;
      double x = ticker * physicaLogicalRatio * dpr;
      double y = size.height;
      //print('width: ${size.width}, dpr: $dpr, maxSize: $maxSize, ticker: $ticker, x: $x');
      //if (ticker % 10 == 0) {
      //canvas.drawLine(Offset(x, y), Offset(x, y - 15), cmTick);
      // var paragraphBuilder = ui.ParagraphBuilder(ui.ParagraphStyle())
      //   ..pushStyle(style.getTextStyle())
      //   ..addText('${ticker ~/ 10}');
      // //..pop();
      // var paragraph = paragraphBuilder.build()
      //   ..layout(ui.ParagraphConstraints(width: 20));

      // if (ticker != 0.0 || showZero) {
      //   canvas.drawParagraph(
      //       paragraph, Offset(20, y - (paragraph.height / 2)));
      // }
      //} else
      if (ticker % 5 == 0) {
        canvas.drawLine(Offset(x, y), Offset(x, y - 15), cmTick);
      } else {
        canvas.drawLine(Offset(x, y), Offset(x, y - 10), mmTick);
      }

      if (ticker == readingTicker) {
        print(readingTicker);
        canvas.drawLine(Offset(x, y), Offset(x, y - 25), readingTick);
      }
      ticker++;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
