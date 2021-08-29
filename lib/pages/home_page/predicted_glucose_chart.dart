import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PredictedGlucoseChart extends StatefulWidget {
  @override
  _PredictedGlucoseChartState createState() => _PredictedGlucoseChartState();
}

class _PredictedGlucoseChartState extends State<PredictedGlucoseChart> {
  List<GlucoseData> _chartData = [];
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
            ScatterSeries<GlucoseData, double>(
                dataSource: _chartData,
                yValueMapper: (GlucoseData, _) => GlucoseData.glucose,
                xValueMapper: (GlucoseData, _) => GlucoseData.minutes),
          ],
          primaryXAxis:
              NumericAxis(edgeLabelPlacement: EdgeLabelPlacement.shift),
          primaryYAxis: NumericAxis(rangePadding: ChartRangePadding.round),
        ),
      ));

  List<GlucoseData> getChartData() {
    final List<GlucoseData> chartData = [
      GlucoseData(65, 120),
      GlucoseData(60, 115),
      GlucoseData(55, 112),
      GlucoseData(50, 119),
      GlucoseData(45, 110)
    ];
    return chartData;
  }
}

class GlucoseData {
  GlucoseData(this.minutes, this.glucose);

  final double minutes;
  final double glucose;
}
