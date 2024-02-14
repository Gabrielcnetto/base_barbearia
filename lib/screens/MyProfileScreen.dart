import 'package:flutter/material.dart';
import 'package:projetos/classes/agendaClass.dart';
import 'package:projetos/functions/DataBaseInfs/getDataBase.dart';
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
    loaduserProfileImage();
    Provider.of<AgendaProvider>(
      context,
      listen: false,
    ).HistoryList;
    LoadUrlImageUserdb();
    userName;
    getUserEmail();
    getUserPhone();
  }

  final newName = TextEditingController();

  String? userName;
  Future<void> LoadUrlImageUserdb() async {
    String? descUser = await CreateUserProvider().getNameUser();

    setState(() {
      userName = descUser;
    });
  }

  String? urlPhotoImage;
  Future<void> loaduserProfileImage() async {
    String? UserImageDB = await GetDataBase().getUrlImage();

    if (urlPhotoImage != null) {
    } else {
      const Text('N/A');
    }
    setState(() {
      urlPhotoImage = UserImageDB;
    });
  }

  //email
  String? getEmailUser;
  Future<void> getUserEmail() async {
    String? data = await GetDataBase().getEmail();

    if (getEmailUser != null) {
    } else {
      const Text('N/A');
    }
    setState(() {
      getEmailUser = data;
    });
  }

  //number
  String? getNumberWhats;
  Future<void> getUserPhone() async {
    String? data = await GetDataBase().getWhatsNumber();

    if (getNumberWhats != null) {
    } else {
      const Text('N/A');
    }
    setState(() {
      getNumberWhats = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<agendaItem> listaMyCortes = Provider.of<AgendaProvider>(
      context,
    ).HistoryList;
    final int tamanhoLista = listaMyCortes.length;

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 4,
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          color: Colors.grey.shade200,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          color: Colors.grey.shade100,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        border: Border.all(width: 5, color: Colors.white),
                      ),
                      width: 120,
                      height: 120,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Image.network(urlPhotoImage ??
                            'https://static.vecteezy.com/system/resources/previews/009/292/244/original/default-avatar-icon-of-social-media-user-vector.jpg'),
                      ),
                    ),
                    Text(
                      '${userName ?? ''}',
                      style: TextStyle(
                        fontFamily: 'PoppinsTitle',
                        fontSize: 20,
                      ),
                    ),
                    if (Provider.of<AgendaProvider>(context, listen: false)
                            .HistoryList
                            .length <=
                        5)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.offline_bolt,
                            color: Colors.blue,
                            size: 25,
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                            'Cliente Iniciante',
                            style: TextStyle(
                              color: Colors.blue,
                              fontFamily: 'PoppinsTitle',
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    if (Provider.of<AgendaProvider>(context, listen: false)
                                .HistoryList
                                .length >
                            5 &&
                        Provider.of<AgendaProvider>(context, listen: false)
                                .HistoryList
                                .length <
                            8)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.offline_bolt,
                            color: Colors.orangeAccent,
                            size: 25,
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                            'Cliente Regular',
                            style: TextStyle(
                              color: Colors.orangeAccent,
                              fontFamily: 'PoppinsTitle',
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    if (Provider.of<AgendaProvider>(context, listen: false)
                                .HistoryList
                                .length >=
                            8 &&
                        Provider.of<AgendaProvider>(context, listen: false)
                                .HistoryList
                                .length <
                            12)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.offline_bolt,
                            color: Colors.redAccent,
                            size: 25,
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                            'Cliente Pro',
                            style: TextStyle(
                              color: Colors.redAccent,
                              fontFamily: 'PoppinsTitle',
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    if (Provider.of<AgendaProvider>(context, listen: false)
                            .HistoryList
                            .length >
                        12)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.offline_bolt,
                            color: Colors.black,
                            size: 25,
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                            'Cliente Fiel',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'PoppinsTitle',
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Telefone:',
                        style: TextStyle(
                          fontFamily: 'PoppinsTitle',
                          color: Colors.grey.shade800,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        '${getNumberWhats ?? ''}',
                        style: TextStyle(
                          fontFamily: 'PoppinsTitle',
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  //segunda inf
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'E-mail:',
                        style: TextStyle(
                          fontFamily: 'PoppinsTitle',
                          color: Colors.grey.shade800,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        '${getEmailUser ?? ''}',
                        style: TextStyle(
                          fontFamily: 'PoppinsTitle',
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //terceira
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Colors.grey.shade700.withOpacity(0.2)),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2,
                            height: MediaQuery.of(context).size.height / 4.5,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Pontuação Atual',
                                  style: TextStyle(
                                    fontFamily: 'PoppinsTitle',
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '${Provider.of<AgendaProvider>(context, listen: false).HistoryList.length}p',
                                      style: TextStyle(
                                        fontSize: 24,
                                        color: Colors.white,
                                        fontFamily: 'PoppinsNormal',
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  width: 320,
                                  decoration: BoxDecoration(
                                    color: Colors.green.shade300,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                    ),
                                  ),
                                  height: 40,
                                  child: Text(
                                    'Complete as Missões',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'PoppinsTitle',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        //segundo container
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2,
                            height: MediaQuery.of(context).size.height / 4.5,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Gasto na Barbearia',
                                  style: TextStyle(
                                    fontFamily: 'PoppinsTitle',
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'R\$${(Provider.of<AgendaProvider>(context, listen: false).HistoryList.length) * (15)}',
                                      style: TextStyle(
                                          fontSize: 24,
                                          color: Colors.white,
                                          fontFamily: 'PoppinsNormal'),
                                    ),
                                  ],
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  width: 320,
                                  decoration: BoxDecoration(
                                    color: Colors.green.shade300,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                    ),
                                  ),
                                  height: 40,
                                  child: Text(
                                    'Confira o Histórico',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'PoppinsTitle',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
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
                  child: LastAgenda(
                    agenda: listaMyCortes[0],
                  ),
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
