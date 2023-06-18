import 'package:altunbasakinsaatadmin/features/BuildingAdd/View/video_uploader_view.dart';
import 'package:altunbasakinsaatadmin/routing/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuildingInfoView extends StatefulWidget {
  const BuildingInfoView({super.key});

  @override
  State<BuildingInfoView> createState() => _BuildingInfoViewState();
}

class _BuildingInfoViewState extends State<BuildingInfoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xffe31e24),
        centerTitle: true,
        title: Text(
          "Altunbaşak İnşaat Admin Panel",
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.BUILDINGADD);
        },
        backgroundColor: Color(0xffe31e24),
        child: Center(
          child: Icon(
            Icons.add,
            color: Colors.white,
            weight: 5,
            size: 32,
          ),
        ),
      ),
    );
  }
}
