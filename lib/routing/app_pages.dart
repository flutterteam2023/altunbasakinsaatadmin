import 'package:altunbasakinsaatadmin/features/BuildingAdd/View/building_add_view.dart';
import 'package:altunbasakinsaatadmin/features/BuildingInfo/building_info_view.dart';
import 'package:altunbasakinsaatadmin/features/CompleteProject/complete_project_view.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.BUILDINGINFO;
  static final routes = [
    GetPage(
      name: Routes.BUILDINGADD,
      page: () => BuildingAddView(),
    ),
    GetPage(
      name: Routes.BUILDINGINFO,
      page: () => BuildingInfoView(),
    ),
    GetPage(
      name: Routes.COMPLETEPROJECTS,
      page: () => CompleteProjectView(),
    )
  ];
}
