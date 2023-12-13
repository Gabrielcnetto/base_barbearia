import 'package:flutter/material.dart';
import 'package:projetos/classes/agendaClass.dart';
import 'package:projetos/functions/agendaProvider/agendaProvider.dart';
import 'package:projetos/functions/auth/functions/createUser.dart';
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
    Provider.of<CreateUserProvider>(context, listen: false).getNameUser();
    LoadUrlImageUserdb();
  }

  String? userName;
  Future<void> LoadUrlImageUserdb() async {
    String? descUser = await CreateUserProvider().getNameUser();

    setState(() {
      userName = descUser;
    });
  }

  final newName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    List<agendaItem> listaMyCortes =
        Provider.of<AgendaProvider>(context, listen: false).HistoryList;
    int tamanhoLista = listaMyCortes.length;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 30,
          right: 15,
          left: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Meu Perfil',
              style: TextStyle(
                  fontFamily: 'PoppinsTitle',
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade900),
            ),
            SizedBox(
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
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Pontos',
                                style: TextStyle(
                                    fontFamily: 'PoppinsTitle',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),
                              Text(
                                '${tamanhoLista}p',
                                style: TextStyle(
                                  fontFamily: 'PoppinsNormal',
                                  fontSize: 13,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Cortes',
                                style: TextStyle(
                                    fontFamily: 'PoppinsTitle',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),
                              Text(
                                '${tamanhoLista}',
                                style: TextStyle(
                                  fontFamily: 'PoppinsNormal',
                                  fontSize: 13,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Nível',
                                style: TextStyle(
                                    fontFamily: 'PoppinsTitle',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),
                              if (tamanhoLista <= 5)
                                Text(
                                  'Inicinte',
                                  style: TextStyle(
                                    fontFamily: 'PoppinsNormal',
                                    fontSize: 13,
                                    color: Colors.grey,
                                  ),
                                ),
                              if (tamanhoLista > 5 && tamanhoLista <= 8)
                                Text(
                                  'Amador',
                                  style: TextStyle(
                                    fontFamily: 'PoppinsNormal',
                                    fontSize: 13,
                                    color: Colors.grey,
                                  ),
                                ),
                              if (tamanhoLista > 8)
                                Text(
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
              userName ?? '',
              style: TextStyle(
                fontFamily: 'PoppinsTitle',
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 20,
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
                                padding: EdgeInsets.only(
                                    top: 20, left: 10, right: 10),
                                width: double.infinity,
                                height: MediaQuery.of(context).size.height / 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Atualize seu Nome de Usuário:',
                                      style: TextStyle(
                                        fontFamily: 'PoppinsTitle',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 10),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            width: 1,
                                            color: Colors.grey.shade900
                                                .withOpacity(0.6),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: TextFormField(
                                        controller: newName,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          label: Text(
                                            'Digite seu Nome',
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Provider.of<CreateUserProvider>(context,
                                                listen: false)
                                            .attProfile(newName.text);
                                        Navigator.of(context).pop();
                                        print('adasd');
                                      },
                                      child: Card(
                                        elevation: 5,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Container(
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: Colors.green,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          height: 40,
                                          width: double.infinity,
                                          child: Text(
                                            'ATUALIZAR',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'PoppinsNormal',
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
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
                        child: Text(
                          'Alterar Nome',
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
                        child: Text(
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
            )
          ],
        ),
      ),
    );
  }
}
