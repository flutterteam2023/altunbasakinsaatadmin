import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';

import '../BuildingInfo/building_info_view.dart';
import 'building_add_manager.dart';

class ConfirmPage extends StatelessWidget {
  const ConfirmPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 150),
      child: Column(
        children: [
          Text(
            "Onaylıyor Musun?",
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.red),
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Bounceable(
                onTap: BuildAddViewManager().screens[4].onTap!,
                child: ImageIcon(
                  AssetImage(
                    "assets/images/check.png",
                  ),
                  size: 60,
                  color: Color.fromARGB(255, 8, 241, 16),
                ),
              ),
              Bounceable(
                onTap: () {
                  BuildAddViewManager().deleteAllInfo();
                  Get.to(BuildingInfoView());
                },
                child: ImageIcon(
                  AssetImage(
                    "assets/images/notCheck.png",
                  ),
                  color: Colors.red,
                  size: 60,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
