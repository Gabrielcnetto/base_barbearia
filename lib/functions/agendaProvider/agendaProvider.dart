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

    await dataBaseFirestore.collection("allCuts").add({
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

      // Crie uma lista temporária para armazenar os dados convertidos
      List<Map<String, dynamic>> tempDataList = [];

      for (var doc in docs) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

        try {
          // Converter string de data para DateTime
          String dataComoString =
              '${data['year'].toString().padLeft(4, '0')}-${data['month'].toString().padLeft(2, '0')}-${data['day'].toString().padLeft(2, '0')}';

          tempDataList.add(data);
        } catch (e) {
          print('algum erro:${e}');
        }
      }

      // Ordenar a lista temporária
      try {
        tempDataList.sort((a, b) => b['day'].compareTo(a['day']));
      } catch (e) {
        print('erro no sort ${e}');
        
      }

      // Adicionar itens à _historyList na ordem correta
      for (var data in tempDataList) {
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

  Future<void> setAndMyCortesIsActive(String ramdomNumber) async {
    //=> Puxando os id´s do usuário
    QuerySnapshot querySnapshot =
        await dataBaseFirestore.collection("usuarios").get();
    //=> Dividindo os dados do firebase em snapshots
    List<DocumentSnapshot> docs = querySnapshot.docs;
    if (docs.isEmpty) {
      print("Nenhum documento encontrado");
    } else {
      for (var userDoc in docs) {
        try {
          //=> Acessando o item de todos os usuário(histórico)
          //a partir dos id´s coletados, entra em cada 1 e atualiza os atributos na pasta interna
          QuerySnapshot open = await dataBaseFirestore
              .collection("meusCortes")
              .doc(userDoc.id)
              .collection("lista")
              .get();

          //=> Dividindo os dados do firebase em snapshots(histórico)
          List<DocumentSnapshot> openDocs = open.docs;
          if (openDocs.isEmpty) {
            print("Nenhum documento encontrado na lista de cortes");
          } else {
            for (var itemDoc in openDocs) {
              print('entrei no for');
              Map<String, dynamic> data =
                  itemDoc.data() as Map<String, dynamic>;
              if (data != null) {
                print('Data não é nulo');
                // Convertendo o ramdomNumber para String antes da comparação
                if (data['ramdomNumber'].toString() == ramdomNumber) {
                  print('Encontrei o corte correspondente');
                  // Atualizando o documento no Firestore
                  await dataBaseFirestore
                      .collection("meusCortes")
                      .doc(userDoc.id)
                      .collection("lista")
                      .doc(itemDoc.id)
                      .update({'isActive': false});
                  print('função de troca bool executada');
                } else {
                  print('O ramdomNumber não corresponde');
                }
              } else {
                print('Data é nulo');
              }
            }
          }
        } catch (e) {
          print("Erro ao atualizar o documento: $e");
        }
      }
    }
  }

  Future<int?> totalClientes() async {
    int? totalClientes;
    //=> Puxando os id´s do usuário
    QuerySnapshot querySnapshot =
        await dataBaseFirestore.collection("usuarios").get();
    //=> Dividindo os dados do firebase em snapshots
    List<DocumentSnapshot> docs = querySnapshot.docs;
    totalClientes = docs.length;
    return totalClientes;
  }

  Future<int?> totalHairFeitos() async {
    int? totalHairCuts;
    //=> Puxando os id´s do usuário
    QuerySnapshot querySnapshot =
        await dataBaseFirestore.collection("allCuts").get();
    //=> Dividindo os dados do firebase em snapshots
    List<DocumentSnapshot> docs = querySnapshot.docs;
    totalHairCuts = docs.length;
    return totalHairCuts;
  }
}
