import 'package:altunbasakinsaatadmin/features/BuildingAdd/View/video_uploader_view.dart';
import 'package:altunbasakinsaatadmin/routing/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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
      body: Padding(
        padding: const EdgeInsets.only(right: 10.0, left: 10.0, top: 40),
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
          children: [
            Bounceable(
              onTap: () {
                Get.toNamed(Routes.BUILDINGADD);
              },
              child: Container(
                height: 100,
                width: 50,
                decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: Icon(
                        Icons.add_home,
                        size: 70,
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      "İlan Oluştur",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            Bounceable(
              onTap: () {
                Get.toNamed(Routes.BuildInfo);
              },
              child: Container(
                height: 100,
                width: 50,
                decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: Icon(
                        Icons.home,
                        size: 70,
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      "İlanlarım",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            Bounceable(
              onTap: () {},
              child: Container(
                height: 100,
                width: 50,
                decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(10)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
