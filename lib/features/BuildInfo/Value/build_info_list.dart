import 'package:altunbasakinsaatadmin/features/BuildingAdd/Model/build_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BuildInfoList extends ValueNotifier<List<BuildModel>> {
  factory BuildInfoList() => insantace;
  BuildInfoList._sharedInstance() : super([]);
  static final BuildInfoList insantace = BuildInfoList._sharedInstance();
  final collection = FirebaseFirestore.instance.collection('ilanlar');

  Future<void> fetch() async {
    var db = collection.get();
    await db.then((data) {
      print(data.docs.length);
      if (data.docs.isNotEmpty) {
        for (final element in data.docs) {
          if (!value.contains(BuildModel.fromMap(element.data()))) {
            value.add(BuildModel.fromMap(element.data()));
          }
        }
      }
    });
    notifyListeners();
  }
}
