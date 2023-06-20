import 'package:altunbasakinsaatadmin/features/BuildInfo/View/build_photo_view.dart';
import 'package:altunbasakinsaatadmin/features/BuildInfo/Value/build_info_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

class BuildInfoView extends StatefulWidget {
  const BuildInfoView({super.key});

  @override
  State<BuildInfoView> createState() => _BuildInfoViewState();
}

class _BuildInfoViewState extends State<BuildInfoView> {
  @override
  void initState() {
    BuildInfoList.insantace.fetch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Color(0xffe31e24),
          centerTitle: true,
          title: Text(
            "İlanlarım",
            style: TextStyle(
                color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        body: ValueListenableBuilder(
          valueListenable: BuildInfoList.insantace,
          builder: (context, value, child) {
            return BuildInfoList.insantace.value.isNotEmpty
                ? ListView.builder(
                    itemCount: BuildInfoList.insantace.value.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final buildModel = BuildInfoList.insantace.value[index];

                      return AdsCard(
                        adres: buildModel.konum,
                        fiyat: buildModel.ilanFiyati,
                        ilanNo: buildModel.ilanNo,
                        ilanTipi: buildModel.ilanTipi,
                        path: buildModel.baslikFoto!.isNotEmpty
                            ? buildModel.baslikFoto![0]
                            : null,
                        aciklama: buildModel.aciklama,
                        aidat: buildModel.aidat,
                        banyoSayisi: buildModel.banyoSayisi,
                        binadakiKatSayisi: buildModel.kat,
                        binaninYasi: buildModel.binaninYasi,
                        bulunduguKat: buildModel.bulunduguKat,
                        cepheSecenekleri: buildModel.cepheSecenekleri,
                        ilanBasligi: buildModel.ilanBasligi,
                        ilanTarihi: buildModel.ilanTarihi,
                        isinmaTipi: buildModel.isinmaTipi,
                        kiraGetirisi: buildModel.kiraGetirisi,
                        konutSekli: buildModel.konutSekli,
                        krediyeUygunluk: buildModel.krediyeUygunluk,
                        kullanimDurumu: buildModel.kullanimDurumu,
                        metrekare: buildModel.metrekare,
                        odaSayisi: buildModel.odaSayisi,
                        siteIcerisinde: buildModel.siteIcerisinde,
                        takas: buildModel.takas,
                        yakitTipi: buildModel.yakitTipi,
                        yapiTipi: buildModel.yapiTipi,
                        yapininDurumu: buildModel.yapininDurumu,
                      );
                    },
                  )
                : Center(child: RiveAnimation.asset("assets/images/home.riv"));
          },
        ));
  }
}

class AdsCard extends StatelessWidget {
  AdsCard({
    super.key,
    required this.ilanTipi,
    required this.adres,
    required this.ilanNo,
    required this.fiyat,
    required this.path,
    required this.siteIcerisinde,
    required this.aciklama,
    required this.aidat,
    required this.banyoSayisi,
    required this.binadakiKatSayisi,
    required this.binaninYasi,
    required this.bulunduguKat,
    required this.cepheSecenekleri,
    required this.ilanBasligi,
    required this.ilanTarihi,
    required this.isinmaTipi,
    required this.kiraGetirisi,
    required this.konutSekli,
    required this.krediyeUygunluk,
    required this.kullanimDurumu,
    required this.metrekare,
    required this.odaSayisi,
    required this.takas,
    required this.yakitTipi,
    required this.yapiTipi,
    required this.yapininDurumu,
  });
  final String? ilanTipi;
  final String? adres;
  final String? ilanNo;
  final String? fiyat;
  final String? path;
  final String? ilanBasligi;
  final String? ilanTarihi;
  final String? konutSekli;
  final String? odaSayisi;
  final String? banyoSayisi;
  final String? metrekare;
  final String? binaninYasi;
  final String? binadakiKatSayisi;
  final String? bulunduguKat;
  final String? isinmaTipi;
  final String? yakitTipi;
  final String? yapiTipi;
  final String? yapininDurumu;
  final String? kullanimDurumu;
  final String? krediyeUygunluk;
  final String? aidat;
  final String? takas;
  final String? cepheSecenekleri;
  final String? kiraGetirisi;
  final String? siteIcerisinde;
  final String? aciklama;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, left: 10, right: 10, bottom: 20),
      child: Bounceable(
        onTap: () {
          Get.to(BuildPhotoView(
            documentId: ilanNo!,
          ));
        },
        child: Container(
          width: 350,
          height: 400,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 225, 218, 218),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Center(
                  child: Container(
                      height: 120,
                      width: 150,
                      child: path != null
                          ? Image.network(
                              path!,
                              fit: BoxFit.fill,
                            )
                          : Icon(
                              Icons.home,
                              size: 120,
                            )),
                ),
              ),
              Expanded(
                child: Container(
                  height: 246,
                  child: ListView(
                    shrinkWrap: false,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 20, left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "İlan No:$ilanNo",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "İlan Tarihi: ${ilanTarihi!}",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "İlan Başlığı: ${ilanBasligi!}",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "İlan Tipi: ${ilanTipi!}",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Adres: ${adres!}",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Fiyat: ${fiyat!}₺",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Konut Şekli: ${konutSekli!}",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Oda Sayısı: ${odaSayisi!}",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Banyo Sayısı: ${banyoSayisi!}",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Metrekare: ${metrekare!}",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Binanın Yaşı: ${binaninYasi!}",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Binadaki Kat Sayısı: ${binadakiKatSayisi!}",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Bulunduğu Kat: ${bulunduguKat!}",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Isınma Tipi: ${isinmaTipi!}",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Yakıt Tipi: ${yakitTipi!}",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Yapı Tipi: ${yapiTipi!}",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Yapının Durumu: ${yapininDurumu!}",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Kullanım Durumu: ${kullanimDurumu!}",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Krediye Uygunluk: ${krediyeUygunluk!}",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Aidat: ${aidat!}",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Takas: ${takas!}",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Cephe Seçenekleri: ${cepheSecenekleri!}",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Kira Getirisi: ${kiraGetirisi!}",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Site İçerisinde: ${siteIcerisinde!}",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Açıklama: ${aciklama!}",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
