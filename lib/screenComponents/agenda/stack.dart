import 'package:flutter/material.dart';
import 'package:projetos/classes/agendaClass.dart';
import 'package:projetos/functions/agendaProvider/agendaProvider.dart';
import 'package:projetos/screenComponents/agenda/agendedCorte.dart';
import 'package:provider/provider.dart';

class StackForWidgets extends StatefulWidget {
  const StackForWidgets({super.key});

  @override
  State<StackForWidgets> createState() => _StackForWidgetsState();
}

class _StackForWidgetsState extends State<StackForWidgets> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<AgendaProvider>(context, listen: false).agendaLista;
  }

  @override
  Widget build(BuildContext context) {
    List<agendaItem> listaSched =
        Provider.of<AgendaProvider>(context, listen: false).agendaLista;
    final tamanhoTela = MediaQuery.of(context).size.height / 1.3;

    return Container(
      width: double.infinity,
      height: tamanhoTela,
      child: SingleChildScrollView(
        child: Column(
          children: listaSched.map((item) {
            return AgendadoNaAgenda(
              item: item,
            );
          }).toList(),
        ),
      ),
    );
  }
}
