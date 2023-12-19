import 'package:flutter/material.dart';
import 'package:projetos/classes/agendaClass.dart';
import 'package:projetos/functions/agendaProvider/agendaProvider.dart';
import 'package:projetos/functions/auth/functions/createUser.dart';
import 'package:projetos/screenComponents/perfil/lastAgend.dart';
import 'package:provider/provider.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LoadUrlImageUserdb();
    userName;
  }

  final newName = TextEditingController();

  String? userName;
  Future<void> LoadUrlImageUserdb() async {
    String? descUser = await CreateUserProvider().getNameUser();

    setState(() {
      userName = descUser;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<agendaItem> listaMyCortes =
        Provider.of<AgendaProvider>(context, listen: false).HistoryList;
    final int tamanhoLista = listaMyCortes.length;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 10,
          right: 15,
          left: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              'Meu Perfil',
              style: TextStyle(
                  fontFamily: 'PoppinsTitle',
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade900),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 110,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        width: 0.6,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        'https://th.bing.com/th/id/OIP.awAiMS1BCAQ2xS2lcdXGlwHaHH?rs=1&pid=ImgDetMain',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width / 1.7,
                    height: MediaQuery.of(context).size.height / 5,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                'Pontos',
                                style: TextStyle(
                                    fontFamily: 'PoppinsTitle',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),
                              Text(
                                '${tamanhoLista}p',
                                style: const TextStyle(
                                  fontFamily: 'PoppinsNormal',
                                  fontSize: 13,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                'Cortes',
                                style: TextStyle(
                                    fontFamily: 'PoppinsTitle',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),
                              Text(
                                '${tamanhoLista}',
                                style: const TextStyle(
                                  fontFamily: 'PoppinsNormal',
                                  fontSize: 13,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                'Nível',
                                style: TextStyle(
                                    fontFamily: 'PoppinsTitle',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),
                              if (tamanhoLista <= 5)
                                const Text(
                                  'Iniciante',
                                  style: TextStyle(
                                    fontFamily: 'PoppinsNormal',
                                    fontSize: 13,
                                    color: Colors.grey,
                                  ),
                                ),
                              if (tamanhoLista > 5 && tamanhoLista < 8)
                                const Text(
                                  'Secundário',
                                  style: TextStyle(
                                    fontFamily: 'PoppinsNormal',
                                    fontSize: 13,
                                    color: Colors.grey,
                                  ),
                                ),
                              if (tamanhoLista >= 9)
                                const Text(
                                  'Vip',
                                  style: TextStyle(
                                    fontFamily: 'PoppinsNormal',
                                    fontSize: 13,
                                    color: Colors.grey,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Text(
              userName ?? 'Null',
              style: const TextStyle(
                fontFamily: 'PoppinsTitle',
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 5,
                    ),
                    child: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (ctx) {
                              return Container(
                                padding: const EdgeInsets.only(
                                    top: 20, left: 10, right: 10),
                                width: double.infinity,
                                height: MediaQuery.of(context).size.height / 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Atualize seu Nome',
                                      style: TextStyle(
                                        fontFamily: 'PoppinsTitle',
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5, vertical: 10),
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.elliptical(10, 10),
                                          bottomRight:
                                              Radius.elliptical(10, 10),
                                          topLeft: Radius.elliptical(10, 10),
                                          topRight: Radius.elliptical(10, 10),
                                        ),
                                        border: Border.all(
                                          width: 0.5,
                                          color: Colors.grey.shade900,
                                        ),
                                      ),
                                      width: double.infinity,
                                      child: TextFormField(
                                        controller: newName,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          label: Text(
                                            'Digite...',
                                            style: TextStyle(
                                              fontFamily: 'PoppinsNormal',
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey.shade900
                                                  .withOpacity(0.5),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Provider.of<CreateUserProvider>(context,
                                                listen: false)
                                            .attProfile(
                                          newName.text,
                                        );
                                        Navigator.of(context).pop();
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: double.infinity,
                                        height: 40,
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.elliptical(5, 5),
                                            bottomRight:
                                                Radius.elliptical(5, 5),
                                            topLeft: Radius.elliptical(5, 5),
                                            topRight: Radius.elliptical(5, 5),
                                          ),
                                          color: Colors.green,
                                        ),
                                        child: const Text(
                                          'Atualizar Nome',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'PoppinsTitle',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            });
                      },
                      child: Container(
                        height: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade800,
                            borderRadius: BorderRadius.circular(5)),
                        child: const Text(
                          'Editar Perfil',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'PoppinsNormal',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: InkWell(
                      onTap: () {
                        Provider.of<CreateUserProvider>(context, listen: false)
                            .logoutUser();
                      },
                      child: Container(
                        height: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade800,
                            borderRadius: BorderRadius.circular(5)),
                        child: const Text(
                          'Sair da Conta',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'PoppinsNormal',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 5,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey.withOpacity(0.3),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Seu Último Agendamento',
              style: TextStyle(
                fontFamily: 'PoppinsNormal',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            if (listaMyCortes.length >= 1)
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      width: 1,
                      color: Colors.grey.shade200,
                    ),
                  ),
                  child: LastAgenda(agenda: listaMyCortes[0]),
                ),
              ),
            if (listaMyCortes.length < 1)
              Center(
                child: Text(
                  'Você não tem agendamentos ativos.',
                  style: TextStyle(
                    fontFamily: 'PoppinsTitle',
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.grey.shade900.withOpacity(0.7),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
