// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class BuildModel {
  String? ilanNo;
  String? ilanTarihi;
  String? ilanBasligi;
  String? ilanTipi;
  String? ilanFiyati;
  String? konutSekli;
  String? odaSayisi;
  String? banyoSayisi;
  String? metrekare;
  String? binaninYasi;
  String? kat;
  String? bulunduguKat;
  String? isinmaTipi;
  String? yakitTipi;
  String? yapiTipi;
  String? yapininDurumu;
  String? kullanimDurumu;
  String? krediyeUygunluk;
  String? aidat;
  String? takas;
  String? cepheSecenekleri;
  String? kiraGetirisi;
  String? siteIcerisinde;
  String? aciklama;
  List<String>? icFoto;
  List<String>? disFoto;
  String? baslikFoto;
  String? konum;
  BuildModel({
    this.ilanNo,
    this.ilanTarihi,
    this.ilanBasligi,
    this.ilanTipi,
    this.ilanFiyati,
    this.konutSekli,
    this.odaSayisi,
    this.banyoSayisi,
    this.metrekare,
    this.binaninYasi,
    this.kat,
    this.bulunduguKat,
    this.isinmaTipi,
    this.yakitTipi,
    this.yapiTipi,
    this.yapininDurumu,
    this.kullanimDurumu,
    this.krediyeUygunluk,
    this.aidat,
    this.takas,
    this.cepheSecenekleri,
    this.kiraGetirisi,
    this.siteIcerisinde,
    this.aciklama,
    this.icFoto,
    this.disFoto,
    this.baslikFoto,
    this.konum,
  });

  BuildModel copyWith({
    String? ilanNo,
    String? ilanTarihi,
    String? ilanBasligi,
    String? ilanTipi,
    String? ilanFiyati,
    String? konutSekli,
    String? odaSayisi,
    String? banyoSayisi,
    String? metrekare,
    String? binaninYasi,
    String? kat,
    String? bulunduguKat,
    String? isinmaTipi,
    String? yakitTipi,
    String? yapiTipi,
    String? yapininDurumu,
    String? kullanimDurumu,
    String? krediyeUygunluk,
    String? aidat,
    String? takas,
    String? cepheSecenekleri,
    String? kiraGetirisi,
    String? siteIcerisinde,
    String? aciklama,
    List<String>? icFoto,
    List<String>? disFoto,
    String? baslikFoto,
    String? konum,
  }) {
    return BuildModel(
      ilanNo: ilanNo ?? this.ilanNo,
      ilanTarihi: ilanTarihi ?? this.ilanTarihi,
      ilanBasligi: ilanBasligi ?? this.ilanBasligi,
      ilanTipi: ilanTipi ?? this.ilanTipi,
      ilanFiyati: ilanFiyati ?? this.ilanFiyati,
      konutSekli: konutSekli ?? this.konutSekli,
      odaSayisi: odaSayisi ?? this.odaSayisi,
      banyoSayisi: banyoSayisi ?? this.banyoSayisi,
      metrekare: metrekare ?? this.metrekare,
      binaninYasi: binaninYasi ?? this.binaninYasi,
      kat: kat ?? this.kat,
      bulunduguKat: bulunduguKat ?? this.bulunduguKat,
      isinmaTipi: isinmaTipi ?? this.isinmaTipi,
      yakitTipi: yakitTipi ?? this.yakitTipi,
      yapiTipi: yapiTipi ?? this.yapiTipi,
      yapininDurumu: yapininDurumu ?? this.yapininDurumu,
      kullanimDurumu: kullanimDurumu ?? this.kullanimDurumu,
      krediyeUygunluk: krediyeUygunluk ?? this.krediyeUygunluk,
      aidat: aidat ?? this.aidat,
      takas: takas ?? this.takas,
      cepheSecenekleri: cepheSecenekleri ?? this.cepheSecenekleri,
      kiraGetirisi: kiraGetirisi ?? this.kiraGetirisi,
      siteIcerisinde: siteIcerisinde ?? this.siteIcerisinde,
      aciklama: aciklama ?? this.aciklama,
      icFoto: icFoto ?? this.icFoto,
      disFoto: disFoto ?? this.disFoto,
      baslikFoto: baslikFoto ?? this.baslikFoto,
      konum: konum ?? this.konum,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ilanNo': ilanNo,
      'ilanTarihi': ilanTarihi,
      'ilanBasligi': ilanBasligi,
      'ilanTipi': ilanTipi,
      'ilanFiyati': ilanFiyati,
      'konutSekli': konutSekli,
      'odaSayisi': odaSayisi,
      'banyoSayisi': banyoSayisi,
      'metrekare': metrekare,
      'binaninYasi': binaninYasi,
      'kat': kat,
      'bulunduguKat': bulunduguKat,
      'isinmaTipi': isinmaTipi,
      'yakitTipi': yakitTipi,
      'yapiTipi': yapiTipi,
      'yapininDurumu': yapininDurumu,
      'kullanimDurumu': kullanimDurumu,
      'krediyeUygunluk': krediyeUygunluk,
      'aidat': aidat,
      'takas': takas,
      'cepheSecenekleri': cepheSecenekleri,
      'kiraGetirisi': kiraGetirisi,
      'siteIcerisinde': siteIcerisinde,
      'aciklama': aciklama,
      'icFoto': icFoto,
      'disFoto': disFoto,
      'baslikFoto': baslikFoto,
      'konum': konum,
    };
  }

  factory BuildModel.fromMap(Map<String, dynamic> map) {
    return BuildModel(
      ilanNo: map['ilanNo'] != null ? map['ilanNo'] as String : null,
      ilanTarihi:
          map['ilanTarihi'] != null ? map['ilanTarihi'] as String : null,
      ilanBasligi:
          map['ilanBasligi'] != null ? map['ilanBasligi'] as String : null,
      ilanTipi: map['ilanTipi'] != null ? map['ilanTipi'] as String : null,
      ilanFiyati:
          map['ilanFiyati'] != null ? map['ilanFiyati'] as String : null,
      konutSekli:
          map['konutSekli'] != null ? map['konutSekli'] as String : null,
      odaSayisi: map['odaSayisi'] != null ? map['odaSayisi'] as String : null,
      banyoSayisi:
          map['banyoSayisi'] != null ? map['banyoSayisi'] as String : null,
      metrekare: map['metrekare'] != null ? map['metrekare'] as String : null,
      binaninYasi:
          map['binaninYasi'] != null ? map['binaninYasi'] as String : null,
      kat: map['kat'] != null ? map['kat'] as String : null,
      bulunduguKat:
          map['bulunduguKat'] != null ? map['bulunduguKat'] as String : null,
      isinmaTipi:
          map['isinmaTipi'] != null ? map['isinmaTipi'] as String : null,
      yakitTipi: map['yakitTipi'] != null ? map['yakitTipi'] as String : null,
      yapiTipi: map['yapiTipi'] != null ? map['yapiTipi'] as String : null,
      yapininDurumu:
          map['yapininDurumu'] != null ? map['yapininDurumu'] as String : null,
      kullanimDurumu: map['kullanimDurumu'] != null
          ? map['kullanimDurumu'] as String
          : null,
      krediyeUygunluk: map['krediyeUygunluk'] != null
          ? map['krediyeUygunluk'] as String
          : null,
      aidat: map['aidat'] != null ? map['aidat'] as String : null,
      takas: map['takas'] != null ? map['takas'] as String : null,
      cepheSecenekleri: map['cepheSecenekleri'] != null
          ? map['cepheSecenekleri'] as String
          : null,
      kiraGetirisi:
          map['kiraGetirisi'] != null ? map['kiraGetirisi'] as String : null,
      siteIcerisinde: map['siteIcerisinde'] != null
          ? map['siteIcerisinde'] as String
          : null,
      aciklama: map['aciklama'] != null ? map['aciklama'] as String : null,
      icFoto: map['icFoto'] != null
          ? List<String>.from((map['icFoto'] as List<String>))
          : null,
      disFoto: map['disFoto'] != null
          ? List<String>.from((map['disFoto'] as List<String>))
          : null,
      baslikFoto:
          map['baslikFoto'] != null ? map['baslikFoto'] as String : null,
      konum: map['konum'] != null ? map['konum'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory BuildModel.fromJson(String source) =>
      BuildModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BuildModel(ilanNo: $ilanNo, ilanTarihi: $ilanTarihi, ilanBasligi: $ilanBasligi, ilanTipi: $ilanTipi, ilanFiyati: $ilanFiyati, konutSekli: $konutSekli, odaSayisi: $odaSayisi, banyoSayisi: $banyoSayisi, metrekare: $metrekare, binaninYasi: $binaninYasi, kat: $kat, bulunduguKat: $bulunduguKat, isinmaTipi: $isinmaTipi, yakitTipi: $yakitTipi, yapiTipi: $yapiTipi, yapininDurumu: $yapininDurumu, kullanimDurumu: $kullanimDurumu, krediyeUygunluk: $krediyeUygunluk, aidat: $aidat, takas: $takas, cepheSecenekleri: $cepheSecenekleri, kiraGetirisi: $kiraGetirisi, siteIcerisinde: $siteIcerisinde, aciklama: $aciklama, icFoto: $icFoto, disFoto: $disFoto, baslikFoto: $baslikFoto, konum: $konum)';
  }

  @override
  bool operator ==(covariant BuildModel other) {
    if (identical(this, other)) return true;

    return other.ilanNo == ilanNo &&
        other.ilanTarihi == ilanTarihi &&
        other.ilanBasligi == ilanBasligi &&
        other.ilanTipi == ilanTipi &&
        other.ilanFiyati == ilanFiyati &&
        other.konutSekli == konutSekli &&
        other.odaSayisi == odaSayisi &&
        other.banyoSayisi == banyoSayisi &&
        other.metrekare == metrekare &&
        other.binaninYasi == binaninYasi &&
        other.kat == kat &&
        other.bulunduguKat == bulunduguKat &&
        other.isinmaTipi == isinmaTipi &&
        other.yakitTipi == yakitTipi &&
        other.yapiTipi == yapiTipi &&
        other.yapininDurumu == yapininDurumu &&
        other.kullanimDurumu == kullanimDurumu &&
        other.krediyeUygunluk == krediyeUygunluk &&
        other.aidat == aidat &&
        other.takas == takas &&
        other.cepheSecenekleri == cepheSecenekleri &&
        other.kiraGetirisi == kiraGetirisi &&
        other.siteIcerisinde == siteIcerisinde &&
        other.aciklama == aciklama &&
        listEquals(other.icFoto, icFoto) &&
        listEquals(other.disFoto, disFoto) &&
        other.baslikFoto == baslikFoto &&
        other.konum == konum;
  }

  @override
  int get hashCode {
    return ilanNo.hashCode ^
        ilanTarihi.hashCode ^
        ilanBasligi.hashCode ^
        ilanTipi.hashCode ^
        ilanFiyati.hashCode ^
        konutSekli.hashCode ^
        odaSayisi.hashCode ^
        banyoSayisi.hashCode ^
        metrekare.hashCode ^
        binaninYasi.hashCode ^
        kat.hashCode ^
        bulunduguKat.hashCode ^
        isinmaTipi.hashCode ^
        yakitTipi.hashCode ^
        yapiTipi.hashCode ^
        yapininDurumu.hashCode ^
        kullanimDurumu.hashCode ^
        krediyeUygunluk.hashCode ^
        aidat.hashCode ^
        takas.hashCode ^
        cepheSecenekleri.hashCode ^
        kiraGetirisi.hashCode ^
        siteIcerisinde.hashCode ^
        aciklama.hashCode ^
        icFoto.hashCode ^
        disFoto.hashCode ^
        baslikFoto.hashCode ^
        konum.hashCode;
  }
}
