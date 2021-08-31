import 'package:flutter/material.dart';
import 'package:hokusai/pages/home_page/insulin_dose.dart';
import 'package:hokusai/pages/home_page/iob_chart.dart';
import 'package:hokusai/pages/home_page/predicted_glucose_chart.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: ListView(children: [
        Container(
          height: MediaQuery.of(context).size.height / 3,
          child: PredictedGlucoseChart(),
        ),
        Container(
          height: MediaQuery.of(context).size.height / 3,
          child: InsulinOnBoard(),
        ),
        Container(
          height: MediaQuery.of(context).size.height / 3,
          child: InsulinDose(),
        ),
      ]),
    );
  }
}
