import 'package:flutter/material.dart';
import 'package:projetos/classes/profissionalClass.dart';
import 'package:projetos/functions/agendaProvider/agendaProvider.dart';
import 'package:projetos/lists/ProfissionalList.dart';
import 'package:projetos/screenComponents/home/profHomeWidget.dart';
import 'package:provider/provider.dart';

class AgendarFunctionScreen extends StatefulWidget {
  const AgendarFunctionScreen({super.key});

  @override
  State<AgendarFunctionScreen> createState() => _AgendarFunctionScreenState();
}

class _AgendarFunctionScreenState extends State<AgendarFunctionScreen> {
  final userName = TextEditingController();
  int dayView = 1;
  int MonthView = 1;
  int hourView = 12;
  int minutesView = 15;
  void AcresDay() {
    setState(() {
      dayView += 1;
    });
  }

  void decresDay() {
    setState(() {
      dayView -= 1;
    });
  }

  void AcressHour() {
    setState(() {
      hourView += 1;
      if (hourView > 22) {
        hourView = 8;
      }
    });
  }

  void AcressMinutes() {
    setState(() {
      minutesView += 15;
      if (minutesView == 60) {
        setState(() {
          minutesView = 00;
        });
      }
    });
  }

  String selectBarber() {
    String? barbeiro;
    if (BarberSelectedCleber == true) {
      setState(() {
        barbeiro = 'Cleber';
      });
    }
    if (BarberSelectedLucas == true) {
      barbeiro = 'Lucas Henrique';
    }
    if (BarberSelectedPedro == true) {
      barbeiro = 'Pedro Luiz';
    }
    return barbeiro!;
  }

  void agendarFunciont() {
    final provider =
        Provider.of<AgendaProvider>(context, listen: false).agendarCorte(
      username: userName.text,
      cabelereiro: selectBarber(),
      FirstComponentHour: hourView,
      SecondComponentHour: minutesView,
      day: dayView,
      month: 12,
      year: 2023,
    );
  }

  bool BarberSelectedCleber = false;
  void selectCleber() {
    setState(() {
      BarberSelectedCleber = true;
      BarberSelectedLucas = false;
      BarberSelectedPedro = false;
    });
  }

  bool BarberSelectedLucas = false;
  void selectLucas() {
    setState(() {
      BarberSelectedLucas = true;
      BarberSelectedCleber = false;
      BarberSelectedPedro = false;
    });
  }

  bool boolSobrancelhas = false;
  void SetSobrancelhas() {
    setState(() {
      boolSobrancelhas = true;
    });
  }

  void desatSobrancelhas() {
    setState(() {
      boolSobrancelhas = false;
    });
  }

  bool BarberSelectedPedro = false;
  void selectPedro() {
    setState(() {
      BarberSelectedPedro = true;
      BarberSelectedCleber = false;
      BarberSelectedLucas = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<ProfissionalClass> profList = profiList;

    final telaTamaho = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.only(left: 15, top: 15, right: 15),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Agendar Corte',
              style: TextStyle(
                fontFamily: 'PoppinsTitle',
                fontSize: 22,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            //SEU NOME -> INCIO
            Container(
              width: double.infinity,
              height: telaTamaho / 1.19,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //nome
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Seu Nome',
                          style: TextStyle(
                            fontFamily: 'PoppinsNormal',
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              width: 1,
                              color: Colors.grey.shade900,
                            ),
                          ),
                          width: double.infinity,
                          child: TextFormField(
                            controller: userName,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //SEU NOME -> FIM
                  //SOBRANCELHAS
                  Text(
                    'Quer fazer a Sobrancelha?',
                    style: TextStyle(
                      fontFamily: 'PoppinsNormal',
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: double.infinity,
                    child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              SetSobrancelhas();
                              print('setei sobrancelhas');
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                border: Border.all(
                                  width: 3,
                                  color: boolSobrancelhas == true
                                      ? Colors.orangeAccent
                                      : Colors.grey.shade400,
                                ),
                              ),
                              child: Text('Sim'),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: desatSobrancelhas,
                            child: Container(
                              alignment: Alignment.center,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                border: Border.all(
                                    width: 3,
                                    color: boolSobrancelhas == false
                                        ? Colors.orangeAccent
                                        : Colors.grey.shade400),
                              ),
                              child: Text('Não'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Qual o Melhor dia para você?',
                          style: TextStyle(
                            fontFamily: 'PoppinsNormal',
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'DIA',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontFamily: 'PoppinsTitle',
                                      ),
                                    ),
                                  ],
                                ),
                                height: 120,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade900,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.elliptical(10, 10),
                                    bottomLeft: Radius.elliptical(10, 10),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '${dayView}',
                                          style: TextStyle(
                                            color: Colors.grey.shade900,
                                            fontSize: 40,
                                            fontFamily: 'PoppinsTitle',
                                          ),
                                        ),
                                        Text(
                                          '/12',
                                          style: TextStyle(
                                            color: Colors.grey.shade900,
                                            fontSize: 40,
                                            fontFamily: 'PoppinsTitle',
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 5),
                                      width:
                                          MediaQuery.of(context).size.width / 4,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(19),
                                        color: Colors.grey.shade900,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          InkWell(
                                            onTap: AcresDay,
                                            child: Icon(
                                              Icons.keyboard_arrow_up,
                                              color: Colors.white,
                                            ),
                                          ),
                                          InkWell(
                                            onTap: decresDay,
                                            child: Icon(
                                              Icons.expand_more,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                alignment: Alignment.center,
                                height: 120,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.elliptical(10, 10),
                                    bottomRight: Radius.elliptical(10, 10),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  //MELHOR HORARIO -> INICIO
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Qual o Melhor Horario para você?',
                          style: TextStyle(
                            fontFamily: 'PoppinsNormal',
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'HORÁRIO',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontFamily: 'PoppinsTitle',
                                      ),
                                    ),
                                  ],
                                ),
                                height: 120,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade900,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.elliptical(10, 10),
                                    bottomLeft: Radius.elliptical(10, 10),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '${hourView}:',
                                          style: TextStyle(
                                            color: Colors.grey.shade900,
                                            fontSize: 40,
                                            fontFamily: 'PoppinsTitle',
                                          ),
                                        ),
                                        Text(
                                          minutesView == 0
                                              ? '${minutesView}0'
                                              : '${minutesView}',
                                          style: TextStyle(
                                            color: Colors.grey.shade900,
                                            fontSize: 40,
                                            fontFamily: 'PoppinsTitle',
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 5),
                                      width:
                                          MediaQuery.of(context).size.width / 4,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(19),
                                        color: Colors.grey.shade900,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          InkWell(
                                            onTap: AcressHour,
                                            child: Icon(
                                              Icons.keyboard_arrow_up,
                                              color: Colors.white,
                                            ),
                                          ),
                                          InkWell(
                                            onTap: AcressMinutes,
                                            child: Icon(
                                              Icons.keyboard_arrow_up,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                alignment: Alignment.center,
                                height: 120,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.elliptical(10, 10),
                                    bottomRight: Radius.elliptical(10, 10),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  //-> FIM DA OPÇÃO DE MARCAR O HORÁRIO
                  //SELECT PROF
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Selecione o seu Cabelereiro:',
                    style: TextStyle(
                      fontFamily: 'PoppinsNormal',
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: selectCleber,
                            child: Container(
                              alignment: Alignment.center,
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                border: Border.all(
                                  width: 3,
                                  color: BarberSelectedCleber == true
                                      ? Colors.orangeAccent
                                      : Colors.grey.shade400,
                                ),
                              ),
                              child: Text('Cléber'),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: selectLucas,
                            child: Container(
                              alignment: Alignment.center,
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                border: Border.all(
                                    width: 3,
                                    color: BarberSelectedLucas == true
                                        ? Colors.orangeAccent
                                        : Colors.grey.shade400),
                              ),
                              child: Text(
                                'Lucas \n Henrique',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: selectPedro,
                            child: Container(
                              alignment: Alignment.center,
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                border: Border.all(
                                    width: 3,
                                    color: BarberSelectedPedro == true
                                        ? Colors.orangeAccent
                                        : Colors.grey.shade400),
                              ),
                              child: Text('Pedro Luiz'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: agendarFunciont,
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green,
                            border: Border.all(
                              width: 1,
                              color: Colors.grey.shade300,
                            )),
                        width: double.infinity,
                        child: Text(
                          'Agendar',
                          style: TextStyle(
                            fontFamily: 'PoppinsTitle',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
