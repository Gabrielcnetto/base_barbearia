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
  final String imageUser;
  final int year;
  final double ramdomNumber;

  agendaItem({
    required this.ramdomNumber,
    required this.sobrancela,
    required this.userName,
    required this.imageUser,
    required this.Cabelereiro,
    required this.FirstComponentHour,
    required this.SecondComponentHour,
    required this.day,
    required this.month,
    required this.year,
  });

  // Construtor que preenche os campos da classe com os dados do documento
}
