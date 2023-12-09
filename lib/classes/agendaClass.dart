
import 'package:cloud_firestore/cloud_firestore.dart';

class agendaItem {
  //atributos visuais

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
    required this.userName,
    required this.Cabelereiro,
    required this.FirstComponentHour,
    required this.SecondComponentHour,
    required this.day,
    required this.month,
    required this.year,
  });

  // Construtor que preenche os campos da classe com os dados do documento

}
