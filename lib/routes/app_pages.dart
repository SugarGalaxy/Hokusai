import 'package:get/get.dart';

// Pages
import 'package:hokusai/pages/home_page/home_page.dart';
import 'package:hokusai/pages/settings_page/settings_page.dart';
import 'package:hokusai/pages/unknown_route_page/unknown_route_page.dart';

part 'app_routes.dart';

// ignore: avoid_classes_with_only_static_members
class AppPages {
  static const INITIAL = Routes.HOME;

  static final unknownRoute = GetPage(name: '/notfound', page: () => UnknownRoutePage());
  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
    ),
    GetPage(
      name: Routes.SETTINGS,
      page: () => SettingsPage(),
    ),
  ];
}
