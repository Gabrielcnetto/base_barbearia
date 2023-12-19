import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:projetos/classes/agendaClass.dart';

class AgendaProvider with ChangeNotifier {
  //INCIO => bibliotecas
  final authSettings = FirebaseAuth.instance;
  final storageSettings = FirebaseStorage.instance;
  final dataBaseFirestore = FirebaseFirestore.instance;
  //FIM => bibliotecas

  DateTime hora = DateTime.now();
  List<agendaItem> _agendaLista = [];
  List<agendaItem> get agendaLista => [..._agendaLista];
  List<agendaItem> _historyList = [];
  List<agendaItem> get HistoryList => [..._historyList];
  Future<void> agendarCorte({
    required String username,
    required String cabelereiro,
    required int FirstComponentHour,
    required int SecondComponentHour,
    required int day,
    required int month,
    required String imageUser,
    required int year,
    bool? sobrancelha,
  }) async {
    _agendaLista.add(
      agendaItem(
        imageUser: imageUser,
        userName: username,
        sobrancela: sobrancelha!,
        Cabelereiro: cabelereiro,
        FirstComponentHour: FirstComponentHour,
        SecondComponentHour: SecondComponentHour,
        day: day,
        month: month,
        year: year,
      ),
    );

    await dataBaseFirestore
        .collection("agenda")
        .doc('dezembro')
        .collection('${day}')
        .add({
      'imageProfileUser': imageUser,
      'username': username,
      'cabelereiro': cabelereiro,
      'FirstComponentHour': FirstComponentHour,
      'SecondComponentHour': SecondComponentHour,
      'day': day,
      'month': month,
      'year': year,
      'sobrancelha': sobrancelha,
    });
    await dataBaseFirestore
        .collection("meusCortes")
        .doc(authSettings.currentUser!.uid)
        .collection('lista')
        .add(
      {
        'username': username,
        'cabelereiro': cabelereiro,
        'FirstComponentHour': FirstComponentHour,
        'SecondComponentHour': SecondComponentHour,
        'day': day,
        'month': month,
        'year': year,
        'sobrancelha': sobrancelha,
      },
    );

    notifyListeners();
  }

  Future<void> loadHistoryCortes() async {
    QuerySnapshot querySnapshot = await dataBaseFirestore
        .collection('meusCortes/${authSettings.currentUser!.uid}/lista')
        .get();
    List<DocumentSnapshot> docs = querySnapshot.docs;
    if (docs.isEmpty) {
      print('lista de historico vazia');
    } else {
      print('tem itens');
      _historyList.clear();
      for (var doc in docs) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

        try {
          List<DocumentSnapshot> docs = querySnapshot.docs;
          _historyList.add(
            agendaItem(
              imageUser: '',
              sobrancela: data['sobrancelha'],
              userName: data['username'],
              Cabelereiro: data['cabelereiro'],
              FirstComponentHour: data['FirstComponentHour'],
              SecondComponentHour: data['SecondComponentHour'],
              day: data['day'],
              month: data['month'],
              year: data['year'],
            ),
          );
        } catch (e) {
          print('algum erro');
        }
      }
    }
  }

  Future<void> loadListCortes(int day) async {
    QuerySnapshot querySnapshot = await dataBaseFirestore
        .collection("agenda")
        .doc("dezembro")
        .collection("${day}")
        .get();

    List<DocumentSnapshot> docs = querySnapshot.docs;

    if (docs.isEmpty) {
    } else {
      _agendaLista.clear();
      for (var doc in docs) {
        try {
          Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
          _agendaLista.add(
            agendaItem(
              imageUser: data['imageProfileUser'],
              sobrancela: data['sobrancelha'],
              userName: data['username'],
              Cabelereiro: data['cabelereiro'],
              FirstComponentHour: data['FirstComponentHour'],
              SecondComponentHour: data['SecondComponentHour'],
              day: data['day'],
              month: data['month'],
              year: data['year'],
            ),
          );
        } catch (e) {}
      }
    }
  }
}
