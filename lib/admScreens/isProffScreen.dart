import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:projetos/admScreens/components/radiusCircleTotalHairCut.dart';
import 'package:projetos/functions/DataBaseInfs/getDataBase.dart';

class IsProffScren extends StatefulWidget {
  const IsProffScren({super.key});

  @override
  State<IsProffScren> createState() => _IsProffScrenState();
}

class _IsProffScrenState extends State<IsProffScren> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userName;
    loadUserName();
    urlPhotoImage;
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
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bem Vindo(a), ${userName}',
                        style: TextStyle(
                          fontFamily: 'PoppinsTitle',
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        'Este é o seu Gerenciador',
                        style: TextStyle(
                          fontFamily: 'PoppinsNormal',
                          fontSize: 16,
                          color: Colors.grey.shade900.withOpacity(0.7),
                        ),
                      )
                    ],
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    child: urlPhotoImage != null
                        ? ClipRRect(
                            child: Image.network(
                              urlPhotoImage!,
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image.network(
                              'https://static.vecteezy.com/system/resources/previews/009/292/244/original/default-avatar-icon-of-social-media-user-vector.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                ],
              ),
              TotalCircularHCut(),
            ],
          ),
        ),
      ),
    );
  }
}
