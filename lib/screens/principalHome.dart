import 'package:flutter/material.dart';
import 'package:projetos/functions/DataBaseInfs/getDataBase.dart';

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

  @override
  Widget build(BuildContext context) {
    final LarguraTela = MediaQuery.of(context).size.width;
    final alturaTela = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Container(
        height: alturaTela,
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(top: 110),
              height: alturaTela,
              child: SingleChildScrollView(
                child: Positioned(
                  top: 120,
                  right: 0,
                  left: 0,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
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
                      SizedBox(
                        height: 13,
                      ),
                      Container(
                        child: ProffHomeWidget(),
                      ),
                      PercentDescont(),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: LarguraTela,
              height: alturaTela / 7.8,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Column(
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
                                  'Barbearia Almirante',
                                  style: TextStyle(
                                    fontFamily: 'PoppinsNormal',
                                    fontSize: 16,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      width: 30,
                                      height: 30,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: IconButton(
                                        onPressed: () {
                                          Navigator.of(context).pushNamed(
                                            AppRoutes.MyCurrentBalance,
                                          );
                                        },
                                        icon: Icon(
                                          Icons.account_balance_wallet,
                                          size: 15,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
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
