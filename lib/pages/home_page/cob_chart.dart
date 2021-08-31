import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class COB extends StatefulWidget {
  @override
  _COB createState() => _COB();
}

class _COB extends State<COB> {
  List<COBData> _chartData = [];
  List<COBAbsorbedData> _chartData1 = [];
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _chartData = getChartData();
    _chartData1 = getChartData1();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => SafeArea(
          child: Scaffold(
        body: SfCartesianChart(
          title: ChartTitle(text: 'COB Absorption'),
          tooltipBehavior: _tooltipBehavior,
          series: <ChartSeries>[
            SplineAreaSeries<COBData, double>(
                dataSource: _chartData,
                yValueMapper: (COBData, _) => COBData.cob,
                xValueMapper: (COBData, _) => COBData.minutes),
            SplineAreaSeries<COBAbsorbedData, double>(
              dataSource: _chartData1,
              yValueMapper: (COBAbsorbedData, _) => COBAbsorbedData.cobabsorbed,
              xValueMapper: (COBAbsorbedData, _) => COBAbsorbedData.minutes,
            ),
          ],
          primaryXAxis:
              NumericAxis(edgeLabelPlacement: EdgeLabelPlacement.shift),
          primaryYAxis: NumericAxis(rangePadding: ChartRangePadding.round),
          backgroundColor: Colors.grey[900],
        ),
      ));

  List<COBData> getChartData() {
    final List<COBData> chartData = [
      COBData(65, 15),
      COBData(60, 20),
      COBData(55, 35),
      COBData(50, 12),
      COBData(45, 2)
    ];
    return chartData;
  }
}

List<COBAbsorbedData> getChartData1() {
  final List<COBAbsorbedData> chartData1 = [
    COBAbsorbedData(65, 5),
    COBAbsorbedData(60, 5),
    COBAbsorbedData(55, 4),
    COBAbsorbedData(50, 8),
    COBAbsorbedData(45, 2)
  ];
  return chartData1;
}

class COBData {
  COBData(this.minutes, this.cob);

  final double minutes;
  final double cob;
}

class COBAbsorbedData {
  COBAbsorbedData(this.minutes, this.cobabsorbed);

  final double minutes;
  final double cobabsorbed;
}

