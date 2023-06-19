import 'package:altunbasakinsaatadmin/features/BuildInfo/build_info_View.dart';
import 'package:altunbasakinsaatadmin/features/BuildingAdd/View/building_add_view.dart';
import 'package:altunbasakinsaatadmin/features/Home/home_view.dart';
import 'package:altunbasakinsaatadmin/features/CompleteProject/complete_project_view.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.Home;
  static final routes = [
    GetPage(
      name: Routes.BUILDINGADD,
      page: () => BuildingAddView(),
    ),
    GetPage(
      name: Routes.Home,
      page: () => HomeView(),
    ),
    GetPage(
      name: Routes.COMPLETEPROJECTS,
      page: () => CompleteProjectView(),
    ),
    GetPage(
      name: Routes.BuildInfo,
      page: () => BuildInfoView(),
    )
  ];
}
