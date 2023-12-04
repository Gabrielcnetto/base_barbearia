import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class GetDataBase with ChangeNotifier {
  final authSettings = FirebaseAuth.instance;
  final storageSettings = FirebaseStorage.instance;
  final db = FirebaseFirestore.instance;

  Future<String?> getUserName() async {
    if (authSettings.currentUser != null) {
      final String uidUser = await authSettings.currentUser!.uid;
      String? userName;

      await db.collection("usuarios").doc(uidUser).get().then((event) {
        if (event.exists) {
          Map<String, dynamic> data = event.data() as Map<String, dynamic>;

          userName = data['userName'];
        } else {
          print('Nao obtive e adicionei nada ao username');
        }
        return userName;
      });
      return userName;
    }
    return null;
  }

  Future<String?> getUrlImage() async {
    if (authSettings.currentUser != null) {
      final String uidUser = await authSettings.currentUser!.uid;
      String? PhotoLink;

      await db.collection("usuarios").doc(uidUser).get().then((event) {
        if (event.exists) {
          Map<String, dynamic> data = event.data() as Map<String, dynamic>;

          PhotoLink = data['urlPhotoLink'];
        } else {
          print('Nao obtive e adicionei nada ao PhotoLink');
        }
        return PhotoLink;
      });
      return PhotoLink;
    }
    return null;
  }
}
