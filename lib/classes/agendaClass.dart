import 'dart:ffi';

class agendaItem {
  //atributos visuais
  final String id;
  final String userName;

  //responsável
  final String Cabelereiro;

  //Horario
  final int FirstComponentHour;
  bool sobrancela = false;
  final int SecondComponentHour;
  final int day;
  final int month;
  final int year;

  agendaItem({
    required this.sobrancela,
    required this.id,
    required this.userName,
    required this.Cabelereiro,
    required this.FirstComponentHour,
    required this.SecondComponentHour,
    required this.day,
    required this.month,
    required this.year,
  });
}
