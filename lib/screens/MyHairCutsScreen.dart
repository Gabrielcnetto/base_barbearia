import 'package:flutter/material.dart';
import 'package:projetos/classes/agendaClass.dart';
import 'package:projetos/functions/agendaProvider/agendaProvider.dart';
import 'package:projetos/screenComponents/history/itemComponent.dart';
import 'package:provider/provider.dart';

class MyHairCutScreen extends StatefulWidget {
  const MyHairCutScreen({super.key});

  @override
  State<MyHairCutScreen> createState() => _MyHairCutScreenState();
}

class _MyHairCutScreenState extends State<MyHairCutScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<AgendaProvider>(context, listen: false).loadHistoryCortes();
    print(
        'tamanho do historico: ${Provider.of<AgendaProvider>(context, listen: false).HistoryList.length}');
  }

  @override
  Widget build(BuildContext context) {
    List<agendaItem> myCortes =
        Provider.of<AgendaProvider>(context, listen: false).HistoryList;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
        child: SingleChildScrollView(
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
                        'Histórico de Cortes',
                        style: TextStyle(
                          color: Colors.grey.shade900,
                          fontSize: 22,
                          fontFamily: 'PoppinsTitle',
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.5,
                        child: Text(
                          'Visualize quantos cortes você já fez conosco',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontFamily: 'PoppinsNormal',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Column(
                children: myCortes.map((item) {
                  return ComponenetScreen(
                    item: item,
                  );
                }).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
