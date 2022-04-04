// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:dinamik_ortalama_hesapla/constants/app_constants.dart';
import 'package:dinamik_ortalama_hesapla/helper/datahelper.dart';
import 'package:flutter/material.dart';

class HarfDropdownWidget extends StatefulWidget {
  final Function onHarfSecildi;
  HarfDropdownWidget({required this.onHarfSecildi, Key? key}) : super(key: key);
  @override
  State<HarfDropdownWidget> createState() => _HarfDropdownWidgetState();
}

double secilenDeger = 4;

class _HarfDropdownWidgetState extends State<HarfDropdownWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(1),
      padding: Sabitler.dropDownPadding,
      decoration: BoxDecoration(
          color: Sabitler.anaRenk.shade100.withOpacity(0.3),
          borderRadius: Sabitler.borderRadius),
      child: DropdownButton<double>(
        elevation: 16,
        iconEnabledColor: Sabitler.anaRenk.shade200,
        onChanged: (value) {
          setState(() {
            secilenDeger = value!;
            widget.onHarfSecildi(secilenDeger);
          });
        },
        underline: Container(),
        value: secilenDeger,
        items: DataHelper.tumDerslerinHarfleri(),
      ),
    );
  }
}
