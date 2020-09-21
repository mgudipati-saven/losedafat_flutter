import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class WeightPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(12),
      children: <Widget>[
        Card(
          color: Color(0xFF576BC1),
          elevation: 0.1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          child: Container(
            padding: const EdgeInsets.all(12.0),
            child: SfCartesianChart(
              plotAreaBorderColor: Colors.transparent,
              primaryXAxis: DateTimeAxis(
                axisLine: AxisLine(width: 0),
                dateFormat: DateFormat.Md(),
                interval: 1,
                labelStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
                majorGridLines: MajorGridLines(width: 0),
                minorGridLines: MinorGridLines(width: 0),
                majorTickLines: MajorTickLines(width: 0),
                minorTickLines: MinorTickLines(width: 0),
                plotBands: [
                  PlotBand(
                    isVisible: true,
                    gradient: LinearGradient(
                      colors: [Color(0xFF576BC1), Color(0x11FFFFFF)],
                      stops: [0.0, 1.0],
                    ),
                    start: DateTime(2020, 9, 4),
                    end: DateTime(2020, 9, 5),
                  ),
                ],
              ),
              primaryYAxis: NumericAxis(
                axisLine: AxisLine(width: 0),
                interval: 2,
                labelStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
                majorGridLines: MajorGridLines(
                  width: 1,
                  color: Color(0x22EBEDF3),
                ),
                majorTickLines: MajorTickLines(width: 0),
                minorGridLines: MinorGridLines(width: 0),
                minorTickLines: MinorTickLines(width: 0),
              ),
              series: <ChartSeries>[
                SplineSeries<WeightData, DateTime>(
                  color: Color(0xFF97D749),
                  markerSettings: MarkerSettings(isVisible: true),
                  dataSource: [
                    WeightData(DateTime(2020, 9, 1), 190.0),
                    WeightData(DateTime(2020, 9, 2), 189.0),
                    WeightData(DateTime(2020, 9, 3), 190.0),
                    WeightData(DateTime(2020, 9, 4), 185.0),
                    WeightData(DateTime(2020, 9, 5), 187.0),
                    WeightData(DateTime(2020, 9, 6), 183.0),
                    WeightData(DateTime(2020, 9, 7), 185.0),
                  ],
                  xValueMapper: (WeightData weights, _) => weights.date,
                  yValueMapper: (WeightData weights, _) => weights.weight,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class WeightData {
  final DateTime date;
  final double weight;

  WeightData(
    this.date,
    this.weight,
  );
}
