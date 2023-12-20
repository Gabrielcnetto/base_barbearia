class agendaItem {
  //atributos visuais
  final String id;
  final String userName;
  final String currentUserId;
  //responsável
  final String whatsContatoNumber;
  final String Cabelereiro;

  //Horario
  final int FirstComponentHour;
  bool sobrancela = false;
  final int SecondComponentHour;
  final int day;
  final int month;
  final String imageUser;
  final int year;
  bool isActive;
  final int ramdomNumber;

  agendaItem({
    required this.currentUserId,
    required this.whatsContatoNumber,
    required this.id,
    required this.ramdomNumber,
    required this.isActive,
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
