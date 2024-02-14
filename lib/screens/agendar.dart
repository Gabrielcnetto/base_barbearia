import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projetos/classes/agendaClass.dart';
import 'package:projetos/classes/profissionalClass.dart';
import 'package:projetos/functions/agendaProvider/agendaProvider.dart';
import 'package:projetos/functions/auth/functions/createUser.dart';
import 'package:projetos/lists/ProfissionalList.dart';
import 'package:provider/provider.dart';
import 'package:googleapis_auth/auth_io.dart';
class AgendarFunctionScreen extends StatefulWidget {
  const AgendarFunctionScreen({super.key});

  @override
  State<AgendarFunctionScreen> createState() => _AgendarFunctionScreenState();
}

class _AgendarFunctionScreenState extends State<AgendarFunctionScreen> {
  final userName = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LoadUrlImageUserdb();
    loadWhatsNumber();
    Provider.of<CreateUserProvider>(context, listen: false).getImageUser();
    Provider.of<CreateUserProvider>(context, listen: false).getWhatsNumber();

    print('foto passada: ${userUrlImagePhotoLink}');
  }
  String? whatsNumberCTT;
  Future<void> loadWhatsNumber() async {
    String? descUser = await CreateUserProvider().getWhatsNumber();

    setState(() {
      whatsNumberCTT = descUser;
    });
  }


  int dayView = 1;
  int MonthView = 1;
  int hourView = 12;
  int minutesView = 15;
  void AcresDay() {
    if (dayView < 31) {
      setState(() {
        dayView += 1;
      });
    } else if (dayView >= 31) {
      setState(() {
        dayView = 1;
      });
    }
  }

  void decresDay() {
    setState(() {
      if (dayView > 1) {
        dayView -= 1;
      } else if (dayView == 0) {
        dayView = 1;
      }
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

  bool boolSobrancelhas = false;
  void SetSobrancelhas() {
    setState(() {
      boolSobrancelhas = true;
    });
  }

  String? userUrlImagePhotoLink;
  Future<void> LoadUrlImageUserdb() async {
    String? descUser = await CreateUserProvider().getImageUser();

    setState(() {
      userUrlImagePhotoLink = descUser;
    });
  }

  Future<void> agendarFunciont() async {
    //INICIO -> Verificando a lista do dia
    await Provider.of<AgendaProvider>(context, listen: false)
        .loadListCortes(dayView);
    List<agendaItem> lista =
        await Provider.of<AgendaProvider>(context, listen: false).agendaLista;
    //FIM -> Verificando a lista do dia

    bool agendamentoExiste = false;

    for (var item in lista) {
      if (item.day == dayView &&
          item.FirstComponentHour == hourView &&
          item.month == 1 &&
          item.Cabelereiro == selectBarber()) {
        // Mostrar uma mensagem para o usuário

        showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: const Text('Horário já preenchido'),
              content: const Text(
                'Este horário já esta preenchido, por favor escolha outro',
              ),
              actions: [
                ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                      Colors.green,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Fechar',
                    style: TextStyle(
                      fontFamily: 'PoppinsNormal',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            );
          },
        );
        setState(() {
          agendamentoExiste = true;
        });
        break; // Cancelar a adição
      } else {
        showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: const Text('Você Agendou seu Horario'),
              content: const Text(
                'Você já pode verificar seu horario na tela de agenda!',
              ),
              actions: [
                ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                      Colors.green,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      boolSobrancelhas = false;
                      userName.text = '';
                      BarberSelectedCleber = false;
                      BarberSelectedLucas = false;
                      BarberSelectedPedro = false;
                    });
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Fechar',
                    style: TextStyle(
                      fontFamily: 'PoppinsNormal',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            );
          },
        );
      }
    }
    final authSettings = FirebaseAuth.instance;

    final String userId = await authSettings.currentUser!.uid;
    if (!agendamentoExiste) {
      var rng = new Random();
      int number = rng.nextInt(90000) + 10000;
      final provider =
          Provider.of<AgendaProvider>(context, listen: false).agendarCorte(
            whatsContatoNumber: whatsNumberCTT!,
        isActive: true,
        currentUserId: userId,
        id: Random().nextDouble().toString(),
        ramdomNumber: number,
        username: userName.text,
        imageUser: userUrlImagePhotoLink ?? '',
        sobrancelha: boolSobrancelhas,
        cabelereiro: selectBarber(),
        FirstComponentHour: hourView,
        SecondComponentHour: minutesView,
        day: dayView,
        month: 1,
        year: 2024,
      );
    }

 
  }

  bool BarberSelectedCleber = false;
  void selectCleber() {
    setState(() {
      BarberSelectedCleber = true;
      BarberSelectedLucas = false;
      BarberSelectedPedro = false;
      LoadUrlImageUserdb();
      print('barbeiro: ${userUrlImagePhotoLink}');
    });
  }

  bool BarberSelectedLucas = false;
  void selectLucas() {
    setState(() {
      BarberSelectedLucas = true;
      BarberSelectedCleber = false;
      BarberSelectedPedro = false;
      LoadUrlImageUserdb();
      print('barbeiro: ${userUrlImagePhotoLink}');
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
      LoadUrlImageUserdb();
      print('barbeiro: ${userUrlImagePhotoLink}');
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
            const Text(
              'Agendar Corte',
              style: TextStyle(
                fontFamily: 'PoppinsTitle',
                fontSize: 22,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            //SEU NOME -> INCIO
            Container(
              width: double.infinity,
              height: telaTamaho / 1.08,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //nome
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Seu Nome',
                            style: TextStyle(
                              fontFamily: 'PoppinsNormal',
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
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
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    //SEU NOME -> FIM
                    //SOBRANCELHAS
                    const Text(
                      'Quer fazer a Sobrancelha?',
                      style: TextStyle(
                        fontFamily: 'PoppinsNormal',
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
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
                                child: const Text('Sim'),
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
                                child: const Text('Não'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Qual o Melhor dia para você?',
                            style: TextStyle(
                              fontFamily: 'PoppinsNormal',
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  child: const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                    borderRadius: const BorderRadius.only(
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
                                            '/1',
                                            style: TextStyle(
                                              color: Colors.grey.shade900,
                                              fontSize: 40,
                                              fontFamily: 'PoppinsTitle',
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        width:
                                            MediaQuery.of(context).size.width /
                                                4,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(19),
                                          color: Colors.grey.shade900,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            InkWell(
                                              onTap: AcresDay,
                                              child: const Icon(
                                                Icons.keyboard_arrow_up,
                                                color: Colors.white,
                                              ),
                                            ),
                                            InkWell(
                                              onTap: decresDay,
                                              child: const Icon(
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
                                    borderRadius: const BorderRadius.only(
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
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Qual o Melhor Horario para você?',
                            style: TextStyle(
                              fontFamily: 'PoppinsNormal',
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  child: const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                    borderRadius: const BorderRadius.only(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        width:
                                            MediaQuery.of(context).size.width /
                                                4,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(19),
                                          color: Colors.grey.shade900,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            InkWell(
                                              onTap: AcressHour,
                                              child: const Icon(
                                                Icons.keyboard_arrow_up,
                                                color: Colors.white,
                                              ),
                                            ),
                                            InkWell(
                                              onTap: AcressMinutes,
                                              child: const Icon(
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
                                    borderRadius: const BorderRadius.only(
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
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'Selecione o seu Cabelereiro:',
                      style: TextStyle(
                        fontFamily: 'PoppinsNormal',
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
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
                                child: const Text('Cléber'),
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
                                child: const Text(
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
                                child: const Text('Pedro Luiz'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () {
                        agendarFunciont();
                      },
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.green,
                              border: Border.all(
                                width: 1,
                                color: Colors.grey.shade300,
                              )),
                          width: double.infinity,
                          child: const Text(
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
            ),
          ],
        ),
      ),
    ));
  }
}
