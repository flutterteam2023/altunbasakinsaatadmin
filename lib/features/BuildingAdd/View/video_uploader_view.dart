import 'package:altunbasakinsaatadmin/features/BuildingAdd/ViewModel/building_add_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

import 'package:video_player/video_player.dart';

class VideoUploaderView extends StatefulWidget {
  @override
  _VideoUploaderViewState createState() => _VideoUploaderViewState();
}

class _VideoUploaderViewState extends State<VideoUploaderView> {
  @override
  void dispose() {
    for (final controller in BuildAddViewManager().videoControllers.value) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ValueListenableBuilder(
            valueListenable: BuildAddViewManager(),
            builder: (context, value, child) {
              return Container(
                height: MediaQuery.of(context).size.height - 230,
                width: MediaQuery.of(context).size.width,
                child: BuildAddViewManager().selectedVideos.value.isEmpty
                    ? Center(
                        child: Image.asset(
                            BuildAddViewManager().screens[3].image!))
                    : Expanded(
                        child: ValueListenableBuilder(
                        valueListenable: BuildAddViewManager(),
                        builder: (context, value, child) {
                          return GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: 1.0,
                                    crossAxisSpacing: 2,
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 2),
                            itemCount: BuildAddViewManager()
                                .selectedVideos
                                .value
                                .length,
                            itemBuilder: (context, index) {
                              return Stack(
                                alignment: Alignment.center,
                                children: [
                                  Stack(
                                    children: [
                                      Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: ValueListenableBuilder(
                                            valueListenable:
                                                BuildAddViewManager(),
                                            builder: (context, value, child) {
                                              return AspectRatio(
                                                aspectRatio: 1.0,
                                                child: VideoPlayer(
                                                    BuildAddViewManager()
                                                        .videoControllers
                                                        .value[index]),
                                              );
                                            },
                                          )),
                                      Positioned(
                                        right: 0,
                                        top: 0,
                                        child: IconButton(
                                            onPressed: () {
                                              BuildAddViewManager()
                                                  .removeVideo(index);
                                            },
                                            icon: Icon(Icons.cancel_rounded)),
                                      )
                                    ],
                                  ),
                                  if (BuildAddViewManager()
                                      .videoControllers
                                      .value[index]
                                      .value
                                      .isInitialized)
                                    SizedBox.shrink(),
                                ],
                              );
                            },
                          );
                        },
                      )),
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
                onTap: BuildAddViewManager().screens[3].onTap!,
                child: Container(
                  height: 50,
                  width: 120,
                  decoration: BoxDecoration(
                      color: Color(0xffe31e24),
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      BuildAddViewManager().screens[3].buttonText,
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
    );
  }
}



/** 
 Column(
        children: [
          
          ElevatedButton(
            onPressed: BuildAddViewManager().pickVideo,
            child: Text('Galeriden Video Seç'),
          ),
          ElevatedButton(
            onPressed: BuildAddViewManager().uploadVideos,
            child: Text('Onayla ve Yükle'),
          ),
        ],
      ),
 */