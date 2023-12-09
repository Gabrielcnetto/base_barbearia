import 'dart:math';

import 'package:flutter/material.dart';
import 'package:projetos/classes/agendaClass.dart';
import 'package:projetos/functions/agendaProvider/agendaProvider.dart';
import 'package:projetos/screenComponents/agenda/agendedCorte.dart';
import 'package:provider/provider.dart';

class StackForWidgets extends StatefulWidget {
  final int selectedDay;
  const StackForWidgets({
    super.key,
    required this.selectedDay,
  });

  @override
  State<StackForWidgets> createState() => _StackForWidgetsState();
}

class _StackForWidgetsState extends State<StackForWidgets> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<AgendaProvider>(context, listen: false)
        .loadListCortes(widget.selectedDay);
  }

  @override
  Widget build(BuildContext context) {
    //tamanho da tela
    final tamanhoTela = MediaQuery.of(context).size.height / 1.3;
    List<agendaItem> exibList = [];

    //Listas de Cortes da tela
    List<agendaItem> listaSched =
        Provider.of<AgendaProvider>(context, ).agendaLista;

    exibList =
        listaSched.where((item) => item.day == widget.selectedDay).toList();

    return Padding(
      padding: const EdgeInsets.only(top: 210),
      child: Container(
        alignment:
            exibList.length == 0 ? Alignment.center : Alignment.topCenter,
        width: double.infinity,
        height: tamanhoTela,
        child: SingleChildScrollView(
          child: exibList.length == 0
              ? Center(
                  child: Text(
                    'Nenhum Horário Marcado',
                    style: TextStyle(
                      fontFamily: 'PoppinsTitle',
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade800,
                      fontSize: 18,
                    ),
                  ),
                )
              : Column(
                  children: exibList.map((item) {
                    return AgendadoNaAgenda(
                      item: item,
                    );
                  }).toList(),
                ),
        ),
      ),
    );
  }
}
