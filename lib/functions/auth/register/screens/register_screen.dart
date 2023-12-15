import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projetos/functions/auth/functions/createUser.dart';
import 'package:projetos/functions/auth/register/screen_components_register/formsRegister.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? userName;
  String? usereMail;
  String? userPhone;
  String? userPassword;

  Future<void> CreateUser(
      String User, String email, String password, String phoneNumber) async {
    setState(() {
      userName = User;
      usereMail = email;
      userPhone = phoneNumber;
      userPassword = password;
    });
    final provider = Provider.of<CreateUserProvider>(context, listen: false);
    provider.CreateUser(
      urlImage: File(image!.path),
      userNameCreate: User,
      userEmailCreate: usereMail!,
      phoneNumberCreate: phoneNumber,
      PasswordCreate: password,
    );
  }

  XFile? image;

  Future<void> getProfileImageCamera() async {
    final picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.camera,
      maxHeight: 120,
      maxWidth: 120,
    );
    setState(() {
      image = pickedFile;
    });
  }

  Future<void> getProfileImageBiblio() async {
    final picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 120,
      maxWidth: 120,
    );
    setState(() {
      image = pickedFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    const String defaultAvatar =
        'https://icons.iconarchive.com/icons/papirus-team/papirus-status/512/avatar-default-icon.png';
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only( left: 15, right: 15),
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 1,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Row(
                      children: [
                        Icon(Icons.arrow_back_ios),
                        Text(
                          'Voltar ao Login',
                          style: TextStyle(
                            fontFamily: 'PoppinsNormal',
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        child: image != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(80),
                                child: Image.file(
                                  File(image!.path),
                                  fit: BoxFit.cover,
                                ),
                              )
                            : Image.network(
                                defaultAvatar,
                              ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      //pegar galeria
                      InkWell(
                        onTap: getProfileImageBiblio,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius: BorderRadius.circular(5)),
                              child: const Row(
                                children: [
                                  Icon(
                                    Icons.perm_media,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Galeria ',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'PoppinsNormal',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            //pegar galeria
                            //pegar Camera
                            const SizedBox(
                              width: 20,
                            ),
                            Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(
                                  5,
                                ),
                              ),
                              child: InkWell(
                                onTap: getProfileImageCamera,
                                child: const Row(
                                  children: [
                                    Text(
                                      ' Câmera',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'PoppinsNormal',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Icon(
                                      Icons.camera,
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            //pegar Camera
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      FormsUserRegister(
                        onRegister: CreateUser,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
