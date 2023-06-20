import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../BuildingAdd/Model/build_model.dart';

class BuildPhotoList extends ValueNotifier<List<BuildModel>> {
  factory BuildPhotoList() => insantace;
  BuildPhotoList._sharedInstance() : super([]);
  static final BuildPhotoList insantace = BuildPhotoList._sharedInstance();
  final collection = FirebaseFirestore.instance.collection('ilanlar');

  ValueNotifier<List<String>> disFotoList = ValueNotifier<List<String>>([]);
  ValueNotifier<List<String>> icFotoList = ValueNotifier<List<String>>([]);

  Future<void> fetch(String documentId) async {
    var docSnapshot = await FirebaseFirestore.instance
        .collection('ilanlar')
        .doc(documentId)
        .get();
    if (docSnapshot.exists) {
      var disPhotoData = docSnapshot
          .data()?['disFoto']; // Dökümanın disFoto alanındaki verileri alın
      if (disPhotoData is List) {
        disFotoList.value = List<String>.from(disPhotoData);
        notifyListeners();
      }
      notifyListeners();
    }
    notifyListeners();
  }

  Future<void> fetch2(String documentId) async {
    var docSnapshot = await FirebaseFirestore.instance
        .collection('ilanlar')
        .doc(documentId)
        .get();
    if (docSnapshot.exists) {
      var icPhotoData = docSnapshot
          .data()?['icFoto']; // Dökümanın disFoto alanındaki verileri alın
      if (icPhotoData is List) {
        icFotoList.value = List<String>.from(icPhotoData);
        notifyListeners();
      }
      notifyListeners();
    }
    notifyListeners();
  }
}
