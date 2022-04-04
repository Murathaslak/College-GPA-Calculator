// ignore_for_file: unused_element, slash_for_doc_comments, avoid_function_literals_in_foreach_calls

import 'package:dinamik_ortalama_hesapla/model/ders.dart';
import 'package:flutter/material.dart';

class DataHelper {
  static List<Ders> tumEklenenDersler = [];

  static double ortalamaHesapla() {
    double toplamNot = 0;
    double toplamKredi = 0;

    tumEklenenDersler.forEach((element) {
      toplamNot = toplamNot + (element.krediDegeri * element.harfDegeri);
      toplamKredi += element.krediDegeri;
    });
    return toplamNot / toplamKredi;
  }

  static dersEkle(Ders ders) {
    tumEklenenDersler.add(ders);
  }

  static List<String> _tumDerslerinHafleri() {
    return ["AA", "BA", "BB", "CB", "CC", "DC", "DD", "FD", "FF"];
  }

  static double _harfiNotaCevir(String harf) {
    switch (harf) {
      case "AA":
        return 4;
      case "BA":
        return 3.5;
      case "BB":
        return 3;
      case "CB":
        return 2.5;
      case "CC":
        return 2;
      case "DC":
        return 1.5;
      case "DD":
        return 1;
      case "FD":
        return 0.5;
      case "FF":
        return 0.0;
      default:
        return 1;
    }
  }

  static List<DropdownMenuItem<double>> tumDerslerinHarfleri() {
    return _tumDerslerinHafleri()
        .map((e) => DropdownMenuItem(
              child: Text(e),
              value: _harfiNotaCevir(e),
            ))
        .toList();
  }

/**************************************************************************/

  static List<int> _tumDerslerinKredileri() {
    return List.generate(10, (index) => index).toList();
  }

  static List<DropdownMenuItem<double>> tumDerslerinKredileri() {
    return _tumDerslerinKredileri()
        .map(
          (e) => DropdownMenuItem(
            child: Text(e.toString()),
            value: e.toDouble(),
          ),
        )
        .toList();
  }
  /***************************************************************************** */
}
