import 'package:altunbasakinsaatadmin/features/BuildInfo/Value/build_photo_list.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import '../../BuildingAdd/Model/build_model.dart';

class BuildPhotoView extends StatefulWidget {
  final String documentId;
  const BuildPhotoView({super.key, required this.documentId});

  @override
  State<BuildPhotoView> createState() => _BuildPhotoViewState();
}

class _BuildPhotoViewState extends State<BuildPhotoView> {
  @override
  void initState() {
    super.initState();
    BuildPhotoList().fetch(widget.documentId);
    BuildPhotoList().fetch2(widget.documentId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Color(0xffe31e24),
          centerTitle: true,
          title: Text(
            "İlan Fotoğrafları",
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  "Dış Fotoğraflar (Kaydırınız)",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ValueListenableBuilder(
                valueListenable: BuildPhotoList(),
                builder: (context, _, __) {
                  return BuildPhotoList().disFotoList.value.isNotEmpty
                      ? Container(
                          height: 200,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount:
                                BuildPhotoList().disFotoList.value.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(left: 5.0, right: 5),
                                child: Container(
                                  width: 200,
                                  child: Image.network(
                                      BuildPhotoList()
                                          .disFotoList
                                          .value[index]
                                          .toString(),
                                      fit: BoxFit.fill),
                                ),
                              );
                            },
                          ),
                        )
                      : SizedBox();
                },
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 10),
                child: Text(
                  "İç Fotoğraflar (Kaydırınız)",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ValueListenableBuilder(
                valueListenable: BuildPhotoList(),
                builder: (context, _, __) {
                  return BuildPhotoList().icFotoList.value.isNotEmpty
                      ? Container(
                          height: 200,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: BuildPhotoList().icFotoList.value.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.only(left: 5.0, right: 5),
                                child: Container(
                                  width: 200,
                                  child: Image.network(
                                      BuildPhotoList()
                                          .icFotoList
                                          .value[index]
                                          .toString(),
                                      fit: BoxFit.fill),
                                ),
                              );
                            },
                          ),
                        )
                      : SizedBox();
                },
              ),
            ],
          ),
        ));
  }
}
