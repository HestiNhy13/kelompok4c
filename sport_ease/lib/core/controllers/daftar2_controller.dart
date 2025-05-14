import 'package:flutter/material.dart';

class Daftar2Controller {
  final BuildContext context;

  Daftar2Controller(this.context);

  // Data dummy, bisa nanti dari Provider atau API
  String get namaOlahraga => "Bulu Tangkis";
  String get jadwal => "Senin, 15.00 - 17.00 WIB";
  String get lokasi => "Gor Bung Karno Kab.Nganjuk";
  String get pelatih => "Bapak Sugiyo";
  String get gambarUrl => "https://picsum.photos/id/1015/400/250";
  String get biaya => "Rp250.000,00";

  void onKembaliPressed() {
    Navigator.pop(context);
  }
}
