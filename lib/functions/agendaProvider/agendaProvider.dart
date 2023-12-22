import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
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
    required int ramdomNumber,
    required String id,
    required String currentUserId,
    required String whatsContatoNumber,
    bool? isActive,
    bool? sobrancelha,
  }) async {
    _agendaLista.add(
      agendaItem(
        whatsContatoNumber: whatsContatoNumber,
        isActive: isActive!,
        currentUserId: currentUserId,
        id: id,
        ramdomNumber: ramdomNumber,
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
      'id': id,
      'whatsContatoNumber': whatsContatoNumber,
      'imageProfileUser': imageUser,
      'username': username,
      'isActive': isActive,
      'cabelereiro': cabelereiro,
      'FirstComponentHour': FirstComponentHour,
      'SecondComponentHour': SecondComponentHour,
      'day': day,
      'month': month,
      'year': year,
      'sobrancelha': sobrancelha,
      'ramdomNumber': ramdomNumber,
      'currentUserId': currentUserId,
    });
    await dataBaseFirestore
        .collection("meusCortes")
        .doc(authSettings.currentUser!.uid)
        .collection('lista')
        .add(
      {
        'username': username,
        'whatsContatoNumber': whatsContatoNumber,
        'id': id,
        'cabelereiro': cabelereiro,
        'FirstComponentHour': FirstComponentHour,
        'SecondComponentHour': SecondComponentHour,
        'day': day,
        'month': month,
        'isActive': isActive,
        'ramdomNumber': ramdomNumber,
        'year': year,
        'sobrancelha': sobrancelha,
        'currentUserId': currentUserId,
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
          final int ramdomNumberData = await data['ramdomNumber'];
          _historyList.add(
            agendaItem(
              whatsContatoNumber: data['whatsContatoNumber'],
              isActive: data['isActive'],
              currentUserId: data['currentUserId'],
              id: data['id'],
              ramdomNumber: ramdomNumberData,
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
              whatsContatoNumber: data['whatsContatoNumber'],
              isActive: data['isActive'],
              currentUserId: data['currentUserId'],
              id: data['id'],
              ramdomNumber: data['ramdomNumber'],
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

  //ATUALIZA NA LISTA PRINCIPAL DE CORTES(ACESSO GERAL)
  Future<void> updateIsActive({
    required String randomNumber,
    required String selectedDay,
  }) async {
    //INICIO -> faz para a lista geral
    QuerySnapshot querySnapshot = await dataBaseFirestore
        .collection("agenda")
        .doc("dezembro")
        .collection("22")
        .get();

    List<DocumentSnapshot> docs = querySnapshot.docs;

    if (docs.isEmpty) {
      print("Nenhum documento encontrado");
    } else {
      for (var doc in docs) {
        try {
          // Atualiza o atributo 'isActive' para cada documento
          doc.reference.update({'isActive': false});
        } catch (e) {
          print("Erro ao atualizar o documento: $e");
        }
      }
    }
    //FIM -> faz para a lista geral
  }

  //ATUALIZA NA LISTA DE CADA CLIENTE DE CORTES(ACESSO APENAS DO USUARIO)
  Future<void> setAndMyCortesIsActive() async {
    //PUXANDO OS UIDS DE TODOS OS USUÁRIOS
    QuerySnapshot querySnapshot =
        await dataBaseFirestore.collection("usuarios").get();
    List<DocumentSnapshot> docs = querySnapshot.docs;
    if (docs.isEmpty) {
      print("Nenhum documento encontrado");
    } else {
      for (var userDoc in docs) {
        try {
          //a partir dos id´s coletados, entra em cada 1 e atualiza os atributos na pasta interna
          QuerySnapshot open = await dataBaseFirestore
              .collection("meusCortes")
              .doc(userDoc.id)
              .collection("lista")
              .get();
          List<DocumentSnapshot> openDocs = open.docs;
          if (openDocs.isEmpty) {
            print("Nenhum documento encontrado");
          } else {
            for (var doc in openDocs) {
              try {
                // Atualiza o atributo 'isActive' para cada documento
                doc.reference.update({'isActive': false});
              } catch (e) {
                print("Erro ao atualizar o documento: $e");
              }
            }
          }
        } catch (e) {
          print("Erro ao atualizar o documento: $e");
        }
      }
    }
  }
}
