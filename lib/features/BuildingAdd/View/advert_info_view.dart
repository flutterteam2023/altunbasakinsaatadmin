import 'package:altunbasakinsaatadmin/features/BuildingAdd/ViewModel/building_add_manager.dart';
import 'package:altunbasakinsaatadmin/features/BuildingAdd/View/map_in_google.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';

import '../../../common_widgets/advert_info_textfield.dart';

class AdvertInfoView extends StatefulWidget {
  const AdvertInfoView({super.key});

  @override
  State<AdvertInfoView> createState() => _AdvertInfoViewState();
}

class _AdvertInfoViewState extends State<AdvertInfoView> {
  @override
  void initState() {
    super.initState();
    BuildAddViewManager().addressController =
        ValueNotifier<TextEditingController>(TextEditingController());
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
          padding: const EdgeInsets.only(
              left: 12.0, right: 12.0, top: 12.0, bottom: 75),
          child: ValueListenableBuilder(
            valueListenable: BuildAddViewManager(),
            builder: (context, value, child) {
              return Column(
                children: [
                  Bounceable(
                    onTap: () {
                      Get.to(MapInGoogle());
                    },
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                          child: Text(
                        "Konum Ekle",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  AdvertInfoTextField(
                    label: "İlan Başlığı Giriniz (Zorunlu)",
                    type: TextInputType.text,
                    controller: BuildAddViewManager().ilanBasligi!.value,
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  AdvertInfoTextField(
                    label: "İlan Tipi",
                    type: TextInputType.text,
                    controller: BuildAddViewManager().ilanTipi!.value,
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  AdvertInfoTextField(
                    label: "İlan No (Zorunlu)",
                    type: TextInputType.number,
                    controller: BuildAddViewManager().ilanNo!.value,
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  AdvertInfoTextField(
                    label: "İlan Tarihi",
                    type: TextInputType.datetime,
                    controller: BuildAddViewManager().ilanTarihi!.value,
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  AdvertInfoTextField(
                    label: "Konut Şekli",
                    type: TextInputType.name,
                    controller: BuildAddViewManager().konutSekli!.value,
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  AdvertInfoTextField(
                    label: "Oda Sayısı",
                    type: TextInputType.text,
                    controller: BuildAddViewManager().odaSayisi!.value,
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  AdvertInfoTextField(
                    label: "Banyo Sayısı",
                    type: TextInputType.number,
                    controller: BuildAddViewManager().banyoSayisi!.value,
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  AdvertInfoTextField(
                    label: "Metrekare",
                    type: TextInputType.text,
                    controller: BuildAddViewManager().metreKare!.value,
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  AdvertInfoTextField(
                    label: "Binanın Yaşı",
                    type: TextInputType.number,
                    controller: BuildAddViewManager().binaninYasi!.value,
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  AdvertInfoTextField(
                    label: "Binadaki Kat Sayısı",
                    type: TextInputType.number,
                    controller: BuildAddViewManager().kat!.value,
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  AdvertInfoTextField(
                    label: "Bulunduğu Kat",
                    type: TextInputType.number,
                    controller: BuildAddViewManager().bulunduguKat!.value,
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  AdvertInfoTextField(
                    label: "Isınma Tipi",
                    type: TextInputType.name,
                    controller: BuildAddViewManager().isinmaTipi!.value,
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  AdvertInfoTextField(
                    label: "Yakıt Tipi",
                    type: TextInputType.name,
                    controller: BuildAddViewManager().yakitTipi!.value,
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  AdvertInfoTextField(
                    label: "Yapı Tipi",
                    type: TextInputType.name,
                    controller: BuildAddViewManager().yapitipi!.value,
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  AdvertInfoTextField(
                    label: "Yapının Durumu",
                    type: TextInputType.name,
                    controller: BuildAddViewManager().yapininDurumu!.value,
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  AdvertInfoTextField(
                    label: "Kullanım Durumu",
                    type: TextInputType.name,
                    controller: BuildAddViewManager().kullanimDurumu!.value,
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  AdvertInfoTextField(
                    label: "Krediye Uygunluk",
                    type: TextInputType.name,
                    controller: BuildAddViewManager().krediyeUygunluk!.value,
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  AdvertInfoTextField(
                    label: "Aidat",
                    type: TextInputType.text,
                    controller: BuildAddViewManager().aidat!.value,
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  AdvertInfoTextField(
                    label: "Takas",
                    type: TextInputType.name,
                    controller: BuildAddViewManager().takas!.value,
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  AdvertInfoTextField(
                    label: "Cephe Seçenekleri",
                    type: TextInputType.name,
                    controller: BuildAddViewManager().cepheSecenekleri!.value,
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  AdvertInfoTextField(
                    label: "Kira Getirisi",
                    type: TextInputType.text,
                    controller: BuildAddViewManager().kiraGetirisi!.value,
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  AdvertInfoTextField(
                    label: "Fiyat",
                    type: TextInputType.text,
                    controller: BuildAddViewManager().ilanFiyat!.value,
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  AdvertInfoTextField(
                    label: "Site İçerisinde",
                    type: TextInputType.name,
                    controller: BuildAddViewManager().siteIcerisinde!.value,
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  AdvertInfoTextField(
                    readOnly: true,
                    label: "Haritadan Girilen Konum",
                    type: TextInputType.text,
                    controller: BuildAddViewManager().addressController!.value,
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  TextFormField(
                    controller: BuildAddViewManager().aciklama!.value,
                    minLines: 1,
                    maxLines: 10,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            width: 2,
                            color: Color(0xff232455),
                          )),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            width: 2,
                            color: Color(0xffe31e24),
                          )),
                      filled: true,
                      fillColor: Colors.white,
                      label: Text(
                        "Açıklama",
                        style:
                            TextStyle(color: Color(0xff232455), fontSize: 15),
                      ),
                    ),
                  ),
                ],
              );
            },
          )),
    );
  }
}
