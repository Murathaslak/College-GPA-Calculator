import 'package:dinamik_ortalama_hesapla/constants/app_constants.dart';
import 'package:dinamik_ortalama_hesapla/helper/datahelper.dart';
import 'package:flutter/material.dart';

class KrediDropdownWidget extends StatefulWidget {
  final Function onKrediSecildi;
  const KrediDropdownWidget({required this.onKrediSecildi, Key? key})
      : super(key: key);

  @override
  State<KrediDropdownWidget> createState() => _KrediDropdownWidgetState();
}

double secilenKredi = 1;

class _KrediDropdownWidgetState extends State<KrediDropdownWidget> {
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
            secilenKredi = value!;
            widget.onKrediSecildi(secilenKredi);
          });
        },
        underline: Container(),
        value: secilenKredi,
        items: DataHelper.tumDerslerinKredileri(),
      ),
    );
  }
}
