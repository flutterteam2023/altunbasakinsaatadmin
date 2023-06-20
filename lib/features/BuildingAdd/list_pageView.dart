import 'dart:io';

import 'package:altunbasakinsaatadmin/features/BuildingAdd/View/advert_info_view.dart';
import 'package:altunbasakinsaatadmin/features/BuildingAdd/View/video_uploader_view.dart';
import 'package:altunbasakinsaatadmin/features/BuildingAdd/ViewModel/building_add_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

import 'View/confirm_page.dart';

List<Widget> screen = [
  Column(
    children: [
      ValueListenableBuilder(
        valueListenable: BuildAddViewManager(),
        builder: (context, value, child) {
          return Container(
            height: MediaQuery.of(context).size.height - 230,
            width: MediaQuery.of(context).size.width,
            child: BuildAddViewManager().inPhotos.value.isEmpty
                ? Center(
                    child: Image.asset(BuildAddViewManager().screens[0].image!))
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 2,
                          mainAxisSpacing: 3),
                      itemCount: BuildAddViewManager().inPhotos.value.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Stack(
                          children: [
                            Container(
                              height: 200,
                              width: 200,
                              child: Image.file(
                                File(BuildAddViewManager()
                                    .inPhotos
                                    .value[index]),
                                fit: BoxFit.fill,
                              ),
                            ),
                            Positioned(
                              left: 130,
                              right: 0,
                              bottom: 130,
                              top: 0,
                              child: IconButton(
                                  onPressed: () {
                                    BuildAddViewManager()
                                        .removeInPhotoImage(index);
                                  },
                                  icon: Icon(
                                    Icons.cancel_rounded,
                                    size: 25,
                                  )),
                            )
                          ],
                        );
                      },
                    ),
                  ),
          );
        },
      ),
      SizedBox(
        height: 4,
      ),
      Padding(
        padding: EdgeInsets.only(right: 20.0),
        child: Align(
          alignment: Alignment.bottomRight,
          child: Bounceable(
            onTap: BuildAddViewManager().screens[0].onTap!,
            child: Container(
              height: 50,
              width: 120,
              decoration: BoxDecoration(
                  color: Color(0xffe31e24),
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Text(
                  BuildAddViewManager().screens[0].buttonText,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
      )
    ],
  ),
  Column(
    children: [
      ValueListenableBuilder(
        valueListenable: BuildAddViewManager(),
        builder: (context, value, child) {
          return Container(
            height: MediaQuery.of(context).size.height - 230,
            width: MediaQuery.of(context).size.width,
            child: BuildAddViewManager().externalPhotos.value.isEmpty
                ? Center(
                    child: Image.asset(BuildAddViewManager().screens[1].image!))
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 4,
                          mainAxisSpacing: 3),
                      itemCount:
                          BuildAddViewManager().externalPhotos.value.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Stack(
                          children: [
                            Container(
                              height: 200,
                              width: 200,
                              child: Image.file(
                                File(BuildAddViewManager()
                                    .externalPhotos
                                    .value[index]),
                                fit: BoxFit.fill,
                              ),
                            ),
                            Positioned(
                              left: 130,
                              right: 0,
                              bottom: 130,
                              top: 0,
                              child: IconButton(
                                  onPressed: () {
                                    BuildAddViewManager()
                                        .removeExternPhotoImage(index);
                                  },
                                  icon: Icon(
                                    Icons.cancel_rounded,
                                    size: 25,
                                  )),
                            )
                          ],
                        );
                      },
                    ),
                  ),
          );
        },
      ),
      SizedBox(
        height: 4,
      ),
      Padding(
        padding: EdgeInsets.only(right: 20.0),
        child: Align(
          alignment: Alignment.bottomRight,
          child: Bounceable(
            onTap: BuildAddViewManager().screens[1].onTap!,
            child: Container(
              height: 50,
              width: 120,
              decoration: BoxDecoration(
                  color: Color(0xffe31e24),
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Text(
                  BuildAddViewManager().screens[1].buttonText,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
      )
    ],
  ),
  Padding(
    padding: const EdgeInsets.only(top: 85),
    child: Column(
      children: [
        ValueListenableBuilder(
          valueListenable: BuildAddViewManager(),
          builder: (context, value, child) {
            return Stack(
              children: [
                Container(
                    height: 230,
                    width: 250,
                    child: BuildAddViewManager().coverPhoto.value.isEmpty
                        ? Center(
                            child: Image.asset(
                                BuildAddViewManager().screens[1].image!))
                        : Image.file(
                            File(BuildAddViewManager().coverPhoto.value[0]),
                            fit: BoxFit.fill,
                          )),
                BuildAddViewManager().coverPhoto.value.isNotEmpty
                    ? Positioned(
                        right: 0,
                        top: 0,
                        child: IconButton(
                            onPressed: () {
                              BuildAddViewManager().removeCoverPhotoImage(0);
                            },
                            icon: Icon(
                              Icons.cancel_rounded,
                              size: 30,
                            )),
                      )
                    : SizedBox()
              ],
            );
          },
        ),
        SizedBox(
          height: 152,
        ),
        Padding(
          padding: EdgeInsets.only(right: 20.0),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Bounceable(
              onTap: BuildAddViewManager().screens[2].onTap!,
              child: Container(
                height: 50,
                width: 120,
                decoration: BoxDecoration(
                    color: Color(0xffe31e24),
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Text(
                    BuildAddViewManager().screens[2].buttonText,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    ),
  ),
  VideoUploaderView(),
  AdvertInfoView(),
  ConfirmPage()
];
