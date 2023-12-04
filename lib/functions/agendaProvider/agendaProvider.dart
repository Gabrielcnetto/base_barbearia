import 'dart:math';

import 'package:flutter/material.dart';
import 'package:projetos/classes/agendaClass.dart';

class AgendaProvider with ChangeNotifier {
  DateTime hora = DateTime.now();
  List<agendaItem> _agendaLista = [
    agendaItem(
      sobrancela: false,
      Cabelereiro: 'Jorge',
      FirstComponentHour: 12,
      SecondComponentHour: 45,
      day: 12,
      id: Random().nextDouble().toString(),
      month: 11,
      userName: 'Gabriel Netto',
      year: 2023,
    ),
  ];
  List<agendaItem> get agendaLista => [..._agendaLista];

  Future<void> agendarCorte({
    required String username,
    required String cabelereiro,
    required int FirstComponentHour,
    required int SecondComponentHour,
    required int day,
    required int month,
    required int year,
    bool? sobrancelha,
  }) async {
    _agendaLista.add(
      agendaItem(
        id: Random().nextDouble().toString(),
        userName: username,
        sobrancela: false,
        Cabelereiro: cabelereiro,
        FirstComponentHour: FirstComponentHour,
        SecondComponentHour: SecondComponentHour,
        day: day,
        month: month,
        year: year,
      ),
    );
    notifyListeners();
  }
}
