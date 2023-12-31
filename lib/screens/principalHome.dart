import 'package:flutter/material.dart';
import 'package:projetos/functions/DataBaseInfs/getDataBase.dart';
import 'package:projetos/functions/auth/functions/createUser.dart';

import 'package:projetos/screenComponents/home/percentDescont.dart';
import 'package:projetos/screenComponents/home/profHomeWidget.dart';
import 'package:projetos/utils/AppRoutes.dart';

import 'package:provider/provider.dart';

class PrincipalHomeScreen extends StatefulWidget {
  const PrincipalHomeScreen({super.key});

  @override
  State<PrincipalHomeScreen> createState() => _PrincipalHomeScreenState();
}

class _PrincipalHomeScreenState extends State<PrincipalHomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<GetDataBase>(context, listen: false).getUserName();
    loadUserName();
    loaduserProfileImage();
    isProffUser;
    loadTypeUser();
  }

  String? userName;
  Future<void> loadUserName() async {
    String? usuario = await GetDataBase().getUserName();

    if (userName != null) {
    } else {
      const Text('N/A');
    }
    setState(() {
      userName = usuario;
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

  bool? isProffUser;
  Future<void> loadTypeUser() async {
    bool? typeisProffUser = await CreateUserProvider().getIsProff();
    if (typeisProffUser == true) {
      setState(() {
        isProffUser = true;
      });
    } else {
      setState(() {
        isProffUser = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final LarguraTela = MediaQuery.of(context).size.width;
    final alturaTela = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Container(
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 110),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 20),
                      child: Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Container(
                          width: LarguraTela / 1,
                          height: alturaTela / 4,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              'https://img.freepik.com/psd-gratuitas/modelo-de-banner-de-barbearia_23-2148671093.jpg?size=626&ext=jpg&ga=GA1.1.812314629.1701018470&semt=ais',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    Container(
                      child: const ProffHomeWidget(),
                    ),
                    const PercentDescont(),
                  ],
                ),
              ),
            ),
            Container(
              width: LarguraTela,
              height: alturaTela / 7.1,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, right: 10, left: 10),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Olá, ${userName}',
                                  style: TextStyle(
                                    color: Colors.grey.shade900,
                                    fontFamily: 'PoppinsTitle',
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Barbearia Padrão',
                                  style: TextStyle(
                                    fontFamily: 'PoppinsNormal',
                                    fontSize: 16,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                if (isProffUser == true)
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context).pushNamed(
                                        AppRoutes.IsProffScren,
                                      );
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Colors.green),
                                      child: Icon(
                                        Icons.arrow_back_ios_new,
                                        color: Colors.white,
                                        size: 15,
                                      ),
                                    ),
                                  ),
                                SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  width: 65,
                                  height: 65,
                                  child: urlPhotoImage != null
                                      ? ClipRRect(
                                          child: Image.network(
                                            urlPhotoImage!,
                                            fit: BoxFit.cover,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        )
                                      : ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          child: Image.network(
                                            'https://static.vecteezy.com/system/resources/previews/009/292/244/original/default-avatar-icon-of-social-media-user-vector.jpg',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.black.withOpacity(0.1),
                            ),
                          ),
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
    );
  }
}
