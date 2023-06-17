import 'package:altunbasakinsaatadmin/features/BuildingAdd/ViewModel/building_add_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapInGoogle extends StatefulWidget {
  const MapInGoogle({
    super.key,
  });

  @override
  State<MapInGoogle> createState() => _MapInGoogleState();
}

class _MapInGoogleState extends State<MapInGoogle> {
  @override
  void initState() {
    BuildAddViewManager().addressController =
        ValueNotifier<TextEditingController>(TextEditingController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 35),
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: ValueListenableBuilder(
                  valueListenable: BuildAddViewManager().addressController!,
                  builder: (context, value, child) {
                    return TextField(
                      minLines: 1,
                      maxLines: 2,
                      controller:
                          BuildAddViewManager().addressController!.value,
                      decoration: InputDecoration(
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Bounceable(
                            onTap: () {
                              if (BuildAddViewManager()
                                  .addressController!
                                  .value
                                  .text
                                  .isEmpty) {
                                Get.snackbar("Bulunamadı",
                                    "Lütfen Adres Bilgisini Giriniz",
                                    titleText: Text(
                                      "Bulunamadı",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: "Sf Pro",
                                        color: Colors.red,
                                      ),
                                    ),
                                    messageText: Text(
                                      "Lütfen Adres Bilgisini Giriniz",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: "Sf Pro",
                                        color: Color(0xff232455),
                                      ),
                                    ),
                                    backgroundColor: Colors.white);
                              } else {
                                BuildAddViewManager().moveToAdress(
                                    BuildAddViewManager()
                                        .addressController!
                                        .value
                                        .text);
                              }
                            },
                            child: Container(
                              height: 40,
                              width: 70,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                  child: Text(
                                "Ara",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffF3F3F3),
                                    fontFamily: "Sf Pro"),
                              )),
                            ),
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Icon(Icons.search),
                        labelText: 'Adres Girin',
                        border: OutlineInputBorder(),
                      ),
                    );
                  },
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Bounceable(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: Text(
                      "Ekle",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 1,
            ),
            Expanded(
                child: ValueListenableBuilder(
              valueListenable: BuildAddViewManager(),
              builder: (context, value, child) {
                return GoogleMap(
                  onTap: BuildAddViewManager().onMapTap,
                  onMapCreated: BuildAddViewManager().onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(38.963745, 35.243320),
                    zoom: 1,
                  ),
                  markers: Set<Marker>.of(
                      BuildAddViewManager().selectedLocation.value == null
                          ? []
                          : [
                              Marker(
                                  markerId: MarkerId("Seçilen Adres"),
                                  position: BuildAddViewManager()
                                      .selectedLocation
                                      .value!)
                            ]),
                );
              },
            )),
          ],
        ),
      ),
    );
  }
}
