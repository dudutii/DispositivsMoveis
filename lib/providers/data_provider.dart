import 'package:flutter/material.dart';

class DataProvider extends ChangeNotifier {
  double? ph;
  double? UmidadeSolo;
  String? recommendation;

  void saveAndAnalyzeData({required double ph, required double UmidadeSolo}) {
    this.ph = ph;
    this.UmidadeSolo = UmidadeSolo;

    String rec = "";
    if (ph < 6)
      rec += "pH baixo, use calcário. ";
    else if (ph > 7.5) rec += "pH alto, use enxofre. ";

    if (UmidadeSolo < 30)
      rec += "Umidade baixa, irrigar mais. ";
    else if (UmidadeSolo > 60) rec += "Umidade alta, irrigar menos. ";

    recommendation = rec.isEmpty ? "Tudo certo!" : rec;
    notifyListeners();
  }
}
