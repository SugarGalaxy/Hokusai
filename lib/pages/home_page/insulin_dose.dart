import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class InsulinDose extends StatefulWidget {
  @override
  _InsulinDose createState() => _InsulinDose();
}

class _InsulinDose extends State<InsulinDose> {
  List<InsulinDoseData> _chartData = [];
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
            ColumnSeries<InsulinDoseData, double>(
                dataSource: _chartData,
                yValueMapper: (InsulinDoseData, _) => InsulinDoseData.insulin,
                xValueMapper: (InsulinDoseData, _) => InsulinDoseData.minutes),
          ],
          primaryXAxis:
              NumericAxis(edgeLabelPlacement: EdgeLabelPlacement.shift),
          primaryYAxis: NumericAxis(rangePadding: ChartRangePadding.round),
          backgroundColor: Colors.grey[900],
        ),
      ));

  List<InsulinDoseData> getChartData() {
    final List<InsulinDoseData> chartData = [
      InsulinDoseData(65, -1.5),
      InsulinDoseData(60, 1.0),
      InsulinDoseData(55, -0.5),
      InsulinDoseData(50, 3.5),
      InsulinDoseData(45, 2.5)
    ];
    return chartData;
  }
}

class InsulinDoseData {
  InsulinDoseData(this.minutes, this.insulin);

  final double minutes;
  final double insulin;
}
