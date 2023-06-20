// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:altunbasakinsaatadmin/features/Home/home_view.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:video_player/video_player.dart';

import '../Model/build_model.dart';
import '../Model/onboarding_model.dart';

class BuildAddViewManager extends ValueNotifier {
  factory BuildAddViewManager() => _shared;
  BuildAddViewManager._sharedInstance() : super('');
  static final BuildAddViewManager _shared =
      BuildAddViewManager._sharedInstance();

  ValueNotifier<GoogleMapController?> mapController = ValueNotifier(null);
  ValueNotifier<List<String>> externalPhotos = ValueNotifier([]);
  List get extphotos => externalPhotos.value;
  ValueNotifier<List<String>> inPhotos = ValueNotifier([]);
  List get inphotos => inPhotos.value;
  ValueNotifier<List<String>> coverPhoto = ValueNotifier([]);
  List get coverphotos => coverPhoto.value;
  ValueNotifier<List<String>> disFoto = ValueNotifier([]);
  List get disfoto => disFoto.value;
  ValueNotifier<List<String>> icFoto = ValueNotifier([]);
  List get icfoto => icFoto.value;
  ValueNotifier<List<String>> baslikFoto = ValueNotifier([]);
  List get baslikfoto => baslikFoto.value;
  ValueNotifier<List<String>> videoUrls = ValueNotifier([]);
  List get videourls => videoUrls.value;
  ValueNotifier<TextEditingController>? ilanNo;
  ValueNotifier<TextEditingController>? ilanTarihi;
  ValueNotifier<TextEditingController>? ilanBasligi;
  ValueNotifier<TextEditingController>? ilanTipi;
  ValueNotifier<TextEditingController>? ilanFiyat;
  ValueNotifier<TextEditingController>? konutSekli;
  ValueNotifier<TextEditingController>? odaSayisi;
  ValueNotifier<TextEditingController>? banyoSayisi;
  ValueNotifier<TextEditingController>? metreKare;
  ValueNotifier<TextEditingController>? binaninYasi;
  ValueNotifier<TextEditingController>? kat;
  ValueNotifier<TextEditingController>? bulunduguKat;
  ValueNotifier<TextEditingController>? isinmaTipi;
  ValueNotifier<TextEditingController>? yakitTipi;
  ValueNotifier<TextEditingController>? yapitipi;
  ValueNotifier<TextEditingController>? yapininDurumu;
  ValueNotifier<TextEditingController>? kullanimDurumu;
  ValueNotifier<TextEditingController>? krediyeUygunluk;
  ValueNotifier<TextEditingController>? aidat;
  ValueNotifier<TextEditingController>? takas;
  ValueNotifier<TextEditingController>? cepheSecenekleri;
  ValueNotifier<TextEditingController>? kiraGetirisi;
  ValueNotifier<TextEditingController>? siteIcerisinde;
  ValueNotifier<TextEditingController>? aciklama;
  ValueNotifier<bool> isInUpload = ValueNotifier<bool>(false);
  ValueNotifier<bool> isExternUpload = ValueNotifier<bool>(false);
  ValueNotifier<bool> isCoverUpload = ValueNotifier<bool>(false);
  ValueNotifier<bool> isWriteFirestore = ValueNotifier<bool>(false);
  ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  ValueNotifier<String> currentAdress = ValueNotifier<String>("");
  ValueNotifier<String> il = ValueNotifier<String>("");
  ValueNotifier<String> ilce = ValueNotifier<String>("");
  ValueNotifier<TextEditingController>? addressController;

  ValueNotifier<LatLng?> selectedLocation = ValueNotifier(null);
  List<XFile>? pickedInImages;
  List<XFile>? pickedExtImages;
  List<XFile>? pickedCoverImages;
  GoogleMapController? mapsController;
  List<Placemark>? placemarks;
  ValueNotifier<List<File>> selectedVideos = ValueNotifier<List<File>>([]);
  final FirebaseStorage storage = FirebaseStorage.instance;
  final ImagePicker picker = ImagePicker();
  ValueNotifier<List<VideoPlayerController>> videoControllers =
      ValueNotifier([]);

  Future<void> pickVideo() async {
    final pickedFile = await picker.getVideo(source: ImageSource.gallery);
    if (pickedFile != null) {
      selectedVideos.value.add(File(pickedFile.path));
      videoControllers.value
          .add(VideoPlayerController.file(selectedVideos.value.last));
      videoControllers.value.last.initialize().then((_) {
        notifyListeners();
      });
      notifyListeners();
    }
    notifyListeners();
  }

  void removeVideo(int index) {
    selectedVideos.value.removeAt(index);

    // videoControllers.value[index].dispose();
    videoControllers.value.removeAt(index);
    notifyListeners();
  }

  Future<void> uploadVideos() async {
    if (ilanNo!.value.text.isNotEmpty) {
      isLoading.value = true;
      notifyListeners();
      for (int i = 0; i < selectedVideos.value.length; i++) {
        String videoName = DateTime.now().millisecondsSinceEpoch.toString();
        Reference storageReference =
            storage.ref().child('videos/${ilanNo!.value.text}/$videoName.mp4');
        UploadTask uploadTask =
            storageReference.putFile(selectedVideos.value[i]);
        await uploadTask.whenComplete(() {});
        String downloadUrl = await storageReference.getDownloadURL();
        videoUrls.value.add(downloadUrl);
        if (i == selectedVideos.value.length - 1) {}
        notifyListeners();
        // Storage'den dönen downloadUrl'ü kullanarak istediğin işlemleri yapabilirsin.
      }
    }
  }

  void onMapCreated(GoogleMapController controller) {
    mapsController = controller;
  }

  Future<void> onMapTap(LatLng latLng) async {
    try {
      selectedLocation.value = latLng;
      getAddressFromLatLng(latLng);
      updateAddress();
      notifyListeners();
    } catch (e) {
      Get.snackbar("title", "message");
      updateAddress();
    }
  }

  void updateAddress() async {
    if (selectedLocation.value == null) return;
    placemarks = await placemarkFromCoordinates(
        selectedLocation.value!.latitude, selectedLocation.value!.longitude);
  }

  Future<void> moveToAdress(String adress) async {
    List<Location> locations = await locationFromAddress(adress);
    if (locations.length > 0) {
      LatLng latLng =
          LatLng(locations.first.latitude, locations.first.longitude);
      selectedLocation.value = latLng;
      CameraUpdate cameraUpdate = CameraUpdate.newLatLngZoom(latLng, 15);
      mapsController?.animateCamera(cameraUpdate);
      currentAdress.value = adress;
      notifyListeners();
    } else {
      Get.snackbar("Hata", "Adres Bulunamadı");
    }
  }

  Future<void> getAddressFromLatLng(LatLng location) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(location.latitude, location.longitude);
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        // administrativeArea!.value = place.administrativeArea!;
        // subAdministrativeArea!.value = place.subAdministrativeArea!;
        il.value = "${place.administrativeArea}";
        ilce.value = "${place.subAdministrativeArea}";
        addressController!.value.text =
            "${place.street},${place.postalCode},${place.country},${place.administrativeArea}/${place.subAdministrativeArea}";
      }
    } catch (e) {
      print(e);
    }
  }

  List<OnBoardingModel> screens = [
    OnBoardingModel(
      image: 'assets/images/imageAdd.png',
      buttonText: "İç Resim Ekle",
      onTap: () {
        BuildAddViewManager buildAddViewManager = BuildAddViewManager();
        buildAddViewManager.pickImages(0);
      },
    ),
    OnBoardingModel(
      image: 'assets/images/imageAdd.png',
      buttonText: "Dış Resim Ekle",
      onTap: () {
        BuildAddViewManager buildAddViewManager = BuildAddViewManager();
        buildAddViewManager.pickImages(1);
      },
    ),
    OnBoardingModel(
      image: 'assets/images/imageAdd.png',
      buttonText: "Kapak Resmi",
      onTap: () {
        BuildAddViewManager buildAddViewManager = BuildAddViewManager();
        buildAddViewManager.pickImages(2);
      },
    ),
    OnBoardingModel(
      image: 'assets/images/videoAdd.png',
      buttonText: "Video Seç",
      onTap: () {
        BuildAddViewManager().pickVideo();
      },
    ),
    OnBoardingModel(
      image: 'assets/images/imageAdd.png',
      buttonText: "Advert info",
      onTap: () {},
    ),
    OnBoardingModel(
      buttonText: "Onayla",
      onTap: () async {
        await BuildAddViewManager().uploadVideos();
        await BuildAddViewManager().uploadExternPhoto();
        await BuildAddViewManager().uploadCoverPhoto();

        await BuildAddViewManager().uploadInPhoto();

        BuildAddViewManager().writeToFirestore();
        BuildAddViewManager().control(BuildAddViewManager().ilanNo!.value.text);

        BuildAddViewManager().addLastDelete();
      },
    ),
  ];

  void addPhoto(String path, int index) {
    if (index == 0) {
      inPhotos.value.add(path);
    } else if (index == 1) {
      externalPhotos.value.add(path);
    } else if (index == 2) {
      coverPhoto.value.clear();
      coverPhoto.value.add(path);
    }

    notifyListeners();
  }

  Future<void> writeToFirestore() async {
    BuildModel model = BuildModel();
    model.konum = addressController!.value.text.isNotEmpty
        ? addressController!.value.text
        : "Belirtilmedi";
    model.aciklama =
        aciklama!.value.text.isNotEmpty ? aciklama!.value.text : "Belirtilmedi";
    model.aidat =
        aidat!.value.text.isNotEmpty ? aidat!.value.text : "Belirtilmedi";
    model.banyoSayisi = banyoSayisi!.value.text.isNotEmpty
        ? banyoSayisi!.value.text
        : "Belirtilmedi";
    model.baslikFoto = baslikFoto.value;
    model.binaninYasi = binaninYasi!.value.text.isNotEmpty
        ? binaninYasi!.value.text
        : "Belirtilmedi";
    model.videoUrls = videoUrls.value;
    model.bulunduguKat = bulunduguKat!.value.text.isNotEmpty
        ? bulunduguKat!.value.text
        : "Belirtilmedi";
    model.cepheSecenekleri = cepheSecenekleri!.value.text.isNotEmpty
        ? cepheSecenekleri!.value.text
        : "Belirtilmedi";
    model.disFoto = disFoto.value;
    model.icFoto = icFoto.value;
    model.ilanBasligi = ilanBasligi!.value.text.isNotEmpty
        ? ilanBasligi!.value.text
        : "Belirtilmedi";
    model.ilanFiyati = ilanFiyat!.value.text.isNotEmpty
        ? ilanFiyat!.value.text
        : "Belirtilmedi";
    model.ilanNo = ilanNo!.value.text;
    model.ilanTarihi = ilanTarihi!.value.text.isNotEmpty
        ? ilanTarihi!.value.text
        : "Belirtilmedi";
    model.ilanTipi =
        ilanTipi!.value.text.isNotEmpty ? ilanTipi!.value.text : "Belirtilmedi";
    model.isinmaTipi = isinmaTipi!.value.text.isNotEmpty
        ? isinmaTipi!.value.text
        : "Belirtilmedi";
    model.kat = kat!.value.text.isNotEmpty ? kat!.value.text : "Belirtilmedi";
    model.kiraGetirisi = kiraGetirisi!.value.text.isNotEmpty
        ? kiraGetirisi!.value.text
        : "Belirtilmedi";
    model.konutSekli = konutSekli!.value.text.isNotEmpty
        ? konutSekli!.value.text
        : "Belirtilmedi";
    model.krediyeUygunluk = krediyeUygunluk!.value.text.isNotEmpty
        ? krediyeUygunluk!.value.text
        : "Belirtilmedi";
    model.kullanimDurumu = kullanimDurumu!.value.text.isNotEmpty
        ? kullanimDurumu!.value.text
        : "Belirtilmedi";
    model.metrekare = metreKare!.value.text.isNotEmpty
        ? metreKare!.value.text
        : "Belirtilmedi";
    model.odaSayisi = odaSayisi!.value.text.isNotEmpty
        ? odaSayisi!.value.text
        : "Belirtilmedi";
    model.siteIcerisinde = siteIcerisinde!.value.text.isNotEmpty
        ? siteIcerisinde!.value.text
        : "Belirtilmedi";
    model.takas =
        takas!.value.text.isNotEmpty ? takas!.value.text : "Belirtilmedi";
    model.yakitTipi = yakitTipi!.value.text.isNotEmpty
        ? yakitTipi!.value.text
        : "Belirtilmedi";
    model.yapiTipi =
        yapitipi!.value.text.isNotEmpty ? yapitipi!.value.text : "Belirtilmedi";
    model.yapininDurumu = yapininDurumu!.value.text.isNotEmpty
        ? yapininDurumu!.value.text
        : "Belirtilmedi";
    addressController!.value.clear();

    if (model.ilanNo!.isNotEmpty) {
      try {
        await FirebaseFirestore.instance
            .collection('ilanlar')
            .doc('${model.ilanNo}')
            .set(model.toMap());
        isWriteFirestore.value = true;
        notifyListeners();
        print('Veri Firestore\'a başarıyla yazıldı');
      } catch (e) {
        print('Veriyi Firestore\'a yazarken bir hata oluştu: $e');
      }
    } else {
      Get.snackbar("Uyarı", "İlan No Girmediniz");
    }
  }

  void deleteAllInfo() {
    try {
      ilanNo!.value.clear();
      ilanTarihi!.value.clear();
      ilanBasligi!.value.clear();
      ilanTipi!.value.clear();
      ilanFiyat!.value.clear();
      konutSekli!.value.clear();
      odaSayisi!.value.clear();
      banyoSayisi!.value.clear();
      metreKare!.value.clear();
      binaninYasi!.value.clear();
      kat!.value.clear();
      bulunduguKat!.value.clear();
      isinmaTipi!.value.clear();
      yakitTipi!.value.clear();
      yapitipi!.value.clear();
      yapininDurumu!.value.clear();
      kullanimDurumu!.value.clear();
      krediyeUygunluk!.value.clear();
      aidat!.value.clear();
      takas!.value.clear();
      cepheSecenekleri!.value.clear();
      kiraGetirisi!.value.clear();
      siteIcerisinde!.value.clear();
      aciklama!.value.clear();
      externalPhotos.value.clear();
      inPhotos.value.clear();
      videoUrls.value.clear();
      selectedVideos.value.clear();
      videoControllers.value.clear();

      coverPhoto.value.clear();
      notifyListeners();
      Get.snackbar("Bilgi", "İlan İptal Edildi");
    } catch (e) {
      print(e.toString());
    }
  }

  void addLastDelete() {
    try {
      ilanNo!.value.clear();
      ilanTarihi!.value.clear();
      ilanBasligi!.value.clear();
      ilanTipi!.value.clear();
      ilanFiyat!.value.clear();
      konutSekli!.value.clear();
      odaSayisi!.value.clear();
      banyoSayisi!.value.clear();
      metreKare!.value.clear();
      binaninYasi!.value.clear();
      kat!.value.clear();
      bulunduguKat!.value.clear();
      isinmaTipi!.value.clear();
      yakitTipi!.value.clear();
      yapitipi!.value.clear();
      yapininDurumu!.value.clear();
      kullanimDurumu!.value.clear();
      krediyeUygunluk!.value.clear();
      aidat!.value.clear();
      takas!.value.clear();
      cepheSecenekleri!.value.clear();
      kiraGetirisi!.value.clear();
      siteIcerisinde!.value.clear();
      aciklama!.value.clear();
      externalPhotos.value.clear();
      inPhotos.value.clear();
      selectedVideos.value.clear();
      videoControllers.value.clear();

      coverPhoto.value.clear();
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List<BuildModel>> readFromFirestore() async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance.collection('ilanlar').get();
      List<BuildModel> models =
          snapshot.docs.map((doc) => BuildModel.fromMap(doc.data())).toList();
      return models;
    } catch (e) {
      print('Firestore\'dan veri okurken bir hata oluştu: $e');
      return [];
    }
  }

  void pickImages(int index) async {
    final picker = ImagePicker();
    if (index == 0) {
      pickedInImages = await picker.pickMultiImage();

      if (pickedInImages != null) {
        pickedInImages!.forEach((pickedImage) {
          addPhoto(pickedImage.path, index);
        });
      }
    } else if (index == 1) {
      pickedExtImages = await picker.pickMultiImage();

      if (pickedExtImages != null) {
        pickedExtImages!.forEach((pickedImage) {
          addPhoto(pickedImage.path, index);
        });
      }
    } else if (index == 2) {
      pickedCoverImages = await picker.pickMultiImage();

      if (pickedCoverImages != null) {
        pickedCoverImages!.forEach((pickedImage) {
          addPhoto(pickedImage.path, index);
        });
      }
    }
  }

  void removeInPhotoImage(int index) async {
    inPhotos.value.removeAt(index);
    notifyListeners();
    //pickedImages!.removeAt(index);
  }

  void removeExternPhotoImage(int index) async {
    externalPhotos.value.removeAt(index);
    notifyListeners();
    //pickedImages!.removeAt(index);
  }

  void removeCoverPhotoImage(int index) async {
    coverPhoto.value.removeAt(index);
    notifyListeners();
    //pickedImages!.removeAt(index);
  }

  Future<void> uploadInPhoto() async {
    if (ilanNo!.value.text.isNotEmpty) {
      if (pickedInImages != null) {
        for (var image in pickedInImages!) {
          try {
            Reference ref = FirebaseStorage.instance
                .ref()
                .child('images/icFoto/${ilanNo!.value.text}/${image.path}');
            await ref.putFile(File(image.path));
            var downloadUrl = await ref.getDownloadURL();
            icFoto.value.add(downloadUrl);

            isInUpload.value = true;
            notifyListeners();
          } catch (e) {
            print(e.toString());
          }
        }
      }
    }
  }

  Future<void> uploadExternPhoto() async {
    if (ilanNo!.value.text.isNotEmpty) {
      if (pickedExtImages != null) {
        for (var image in pickedExtImages!) {
          try {
            Reference ref = FirebaseStorage.instance.ref().child(
                'images/disFoto/${ilanNo!.value.text}/${DateTime.now().toString()}');
            await ref.putFile(File(image.path));
            var downloadUrl = await ref.getDownloadURL();
            disFoto.value.add(downloadUrl);

            isExternUpload.value = true;

            notifyListeners();
          } catch (e) {
            print(e.toString());
          }
        }
      }
    }
  }

  Future<void> uploadCoverPhoto() async {
    if (ilanNo!.value.text.isNotEmpty) {
      if (pickedCoverImages != null) {
        for (var image in pickedCoverImages!) {
          try {
            Reference ref = FirebaseStorage.instance.ref().child(
                'images/baslikFoto/${ilanNo!.value.text}/${DateTime.now().toString()}');
            await ref.putFile(File(image.path));
            var downloadUrl = await ref.getDownloadURL();
            baslikFoto.value.add(downloadUrl);

            isCoverUpload.value = true;

            notifyListeners();
          } catch (e) {
            print(e.toString());
          }
        }
      }
    }
  }

  void control(String ilanNo) {
    if (ilanNo.isNotEmpty) {
      if (isCoverUpload.value == true &&
          isExternUpload.value == true &&
          isInUpload.value == true &&
          isWriteFirestore.value == true) {
        Get.snackbar(
            "Yüklenme Durumu", "İlanınız Başarılı Bir Şekilde Yüklendi");
        isLoading.value = false;
        Get.to(HomeView());
      } else {
        Get.snackbar(
            "Hatırlatma", "İlan Yüklendi Ama Girmediğiniz Veriler De Var");
        isLoading.value = false;

        Get.to(HomeView());
      }
    }
  }
}
