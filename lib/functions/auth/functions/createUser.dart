import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class CreateUserProvider with ChangeNotifier {
  final authSettings = FirebaseAuth.instance;
  final storageSettings = FirebaseStorage.instance;
  final dataBaseFirestore = FirebaseFirestore.instance;

  Future<void> CreateUser({
    required String userNameCreate,
    required String userEmailCreate,
    required String phoneNumberCreate,
    required String PasswordCreate,
    required File urlImage,
  }) async {
    await authSettings.createUserWithEmailAndPassword(
      email: userEmailCreate,
      password: PasswordCreate,
    );
    String userIdCreate = authSettings.currentUser!.uid;

    //INICIO => Enviando a foto
    Reference ref =
        storageSettings.ref().child("userProfilePhotos/${userIdCreate}");

    UploadTask uploadTask = ref.putFile(urlImage);

    await uploadTask.whenComplete(() => null);
    String imageProfileImage = await ref.getDownloadURL();
    // FIM => Enviando a foto

    await dataBaseFirestore.collection('usuarios').doc(userIdCreate).set({
      'userName': userNameCreate,
      'userEmail': userEmailCreate,
      'PhoneNumber': phoneNumberCreate,
      'urlPhotoLink': imageProfileImage,
    });
    notifyListeners();
  }

  Future<void> logoutUser() async {
    authSettings.signOut();
  }

  Future<void> login(String email, String password) async {
    authSettings.signInWithEmailAndPassword(email: email, password: password);
    notifyListeners();
  }
}