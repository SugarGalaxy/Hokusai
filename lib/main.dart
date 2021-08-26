import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:hokusai/routes/app_pages.dart';
import 'package:hokusai/theme.dart';

void main() {
  runApp(GetMaterialApp(
    theme: AppTheme.light,
    darkTheme: AppTheme.dark,
    unknownRoute: AppPages.unknownRoute,
    initialRoute: AppPages.INITIAL,
    getPages: AppPages.routes,
  ));
}
