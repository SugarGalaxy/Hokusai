import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:hokusai/routes/app_pages.dart';

void main() {
  runApp(GetMaterialApp(
    unknownRoute: AppPages.unknownRoute,
    initialRoute: AppPages.INITIAL,
    getPages: AppPages.routes,
  ));
}
