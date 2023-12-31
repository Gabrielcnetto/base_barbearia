
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
    List<agendaItem> listaSched = Provider.of<AgendaProvider>(
      context,
    ).agendaLista;

    exibList =
        listaSched.where((item) => item.day == widget.selectedDay).toList();

    ///aqui inicia a lista
    return Container(
      alignment: exibList.length == 0 ? Alignment.center : Alignment.topCenter,
      width: double.infinity,
      height: tamanhoTela,
      child: exibList.length == 0
          ? Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Selecione um dia',
                      style: TextStyle(
                        fontFamily: 'PoppinsTitle',
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 120,
                      height: 120,
                      child: Image.network(
                        'https://img.freepik.com/fotos-premium/personagem-de-desenho-animado-de-um-homem_688921-4693.jpg?w=360',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
            )
          : Padding(
            padding: const EdgeInsets.only(top: 5),
            child: SingleChildScrollView(
              child: Column(
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
