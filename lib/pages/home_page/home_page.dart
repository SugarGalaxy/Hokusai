import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hokusai/routes/app_pages.dart';
import 'package:hokusai/theme.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You are on the home page!',
            ),
          ],
        ),
      ),
    );
  }
}
