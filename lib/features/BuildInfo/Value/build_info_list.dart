import 'package:altunbasakinsaatadmin/features/BuildingAdd/Model/build_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
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

  void deleteDocument(String documentName) {
    if (documentName.isNotEmpty) {
      value.removeWhere((build) => build.ilanNo == documentName);
      FirebaseFirestore.instance
          .collection('ilanlar') // İlanlar koleksiyonu adını buraya yazın
          .doc(documentName) // Silmek istediğiniz belge adını buraya yazın
          .delete()
          .then((value) => print('Belge başarıyla silindi'))
          .catchError(
              (error) => print('Belge silinirken bir hata oluştu: $error'));
      notifyListeners();
    }
  }

 /* Future<void> deleteFolder(String folderName) async {
    final Reference storageRefIc =
        FirebaseStorage.instance.ref().child("images/icFoto/$folderName");
    final Reference storageRefDis =
        FirebaseStorage.instance.ref().child("images/disFoto/$folderName");
    final Reference storageRefBaslik =
        FirebaseStorage.instance.ref().child("images/baslikFoto/$folderName");

    try {
      await storageRefIc.delete();
      await storageRefDis.delete();
      await storageRefBaslik.delete();
      print('Klasör başarıyla silindi: $folderName');
    } catch (e) {
      print('Klasör silinirken bir hata oluştu: $e');
    }
  }*/
}
