import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class InsulinOnBoard extends StatefulWidget {
  @override
  _InsulinOnBoard createState() => _InsulinOnBoard();
}

class _InsulinOnBoard extends State<InsulinOnBoard> {
  List<InsulinOnBoardData> _chartData = [];
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => SafeArea(
          child: Scaffold(
        body: SfCartesianChart(
          tooltipBehavior: _tooltipBehavior,
          series: <ChartSeries>[
            SplineAreaSeries<InsulinOnBoardData, double>(
                dataSource: _chartData,
                yValueMapper: (InsulinOnBoardData, _) =>
                    InsulinOnBoardData.insulin,
                xValueMapper: (InsulinOnBoardData, _) =>
                    InsulinOnBoardData.minutes),
          ],
          primaryXAxis:
              NumericAxis(edgeLabelPlacement: EdgeLabelPlacement.shift),
          primaryYAxis: NumericAxis(rangePadding: ChartRangePadding.round),
          backgroundColor: Colors.grey[900],
        ),
      ));

  List<InsulinOnBoardData> getChartData() {
    final List<InsulinOnBoardData> chartData = [
      InsulinOnBoardData(65, 0.5),
      InsulinOnBoardData(60, 2.0),
      InsulinOnBoardData(55, 3.5),
      InsulinOnBoardData(50, 4.5),
      InsulinOnBoardData(45, 5.5)
    ];
    return chartData;
  }
}

class InsulinOnBoardData {
  InsulinOnBoardData(this.minutes, this.insulin);

  final double minutes;
  final double insulin;
}
