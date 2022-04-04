// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, prefer_is_empty, curly_braces_in_flow_control_structures, avoid_unnecessary_containers, unused_element

import 'package:dinamik_ortalama_hesapla/constants/app_constants.dart';
import 'package:dinamik_ortalama_hesapla/helper/datahelper.dart';
import 'package:dinamik_ortalama_hesapla/model/ders.dart';
import 'package:dinamik_ortalama_hesapla/widgets/ders_listesi.dart';
import 'package:dinamik_ortalama_hesapla/widgets/harf_dropdown_widget.dart';
import 'package:dinamik_ortalama_hesapla/widgets/kredi_dropdown_widget.dart';
import 'package:dinamik_ortalama_hesapla/widgets/ortalama_goster.dart';
import 'package:flutter/material.dart';

class OrtalamaHesaplaPage extends StatefulWidget {
  OrtalamaHesaplaPage({Key? key}) : super(key: key);

  @override
  State<OrtalamaHesaplaPage> createState() => _OrtalamaHesaplaPageState();
}

class _OrtalamaHesaplaPageState extends State<OrtalamaHesaplaPage> {
  var formKey = GlobalKey<FormState>();

  double secilenHarfDegeri = 4;
  double secilenKredi = 1;
  String girilenDersAdi = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Center(
            child: Text(
              Sabitler.baslikText,
              style: Sabitler.baslikStyle,
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: _buildForm(),
                ),
                Expanded(
                  flex: 1,
                  child: OrtalamaGoster(
                      dersSayisi: DataHelper.tumEklenenDersler.length,
                      ortalama: DataHelper.ortalamaHesapla()),
                ),
              ],
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: DersListesi(
                  onElemanCikarildi: (index) {
                    DataHelper.tumEklenenDersler.removeAt(index);
                    setState(() {});
                  },
                ),
              ),
            ),
          ],
        ));
  }

  Widget _buildForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          _buildTextFormField(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: HarfDropdownWidget(
                    onHarfSecildi: (harf) {
                      secilenHarfDegeri = harf;
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: KrediDropdownWidget(
                    onKrediSecildi: (kredi) {
                      secilenKredi = kredi;
                    },
                  ),
                ),
              ),
              IconButton(
                onPressed: _dersEkleceOrtalamaHesapla,
                icon: Icon(Icons.arrow_forward_ios_sharp),
                color: Sabitler.anaRenk,
                iconSize: 30,
              ),
            ],
          ),
          SizedBox(
            height: 6,
          )
        ],
      ),
    );
  }

  _buildTextFormField() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        onSaved: (deger) {
          setState(() {
            girilenDersAdi = deger!;
          });
        },
        validator: (value) {
          if (value!.length <= 0) {
            return "Ders Adını Giriniz.!!!";
          } else
            return null;
        },
        decoration: InputDecoration(
            hintText: "Ders Adını Giriniz",
            border: OutlineInputBorder(
                borderRadius: Sabitler.borderRadius,
                borderSide: BorderSide.none),
            filled: true,
            fillColor: Sabitler.anaRenk.shade100.withOpacity(0.3)),
      ),
    );
  }

  void _dersEkleceOrtalamaHesapla() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var eklenecekDers = Ders(
          ad: girilenDersAdi,
          harfDegeri: secilenDeger,
          krediDegeri: secilenKredi);
      DataHelper.dersEkle(eklenecekDers);
      print(DataHelper.tumEklenenDersler);
    }
  }
}
