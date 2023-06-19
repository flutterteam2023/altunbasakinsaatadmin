import 'package:altunbasakinsaatadmin/features/BuildingAdd/Model/build_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BuildInfoManager extends ValueNotifier<List<BuildModel>> {
  factory BuildInfoManager() => _shared;
  BuildInfoManager._sharedInstance() : super([]);
  static final BuildInfoManager _shared = BuildInfoManager._sharedInstance();

  Future<List<BuildModel>> getBuildModels() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('ilanlar').get();

    final buildModels =
        snapshot.docs.map((doc) => BuildModel.fromMap(doc.data())).toList();

    return buildModels;
  }
}
