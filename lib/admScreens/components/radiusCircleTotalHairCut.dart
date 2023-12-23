import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:projetos/functions/agendaProvider/agendaProvider.dart';

class TotalCircularHCut extends StatefulWidget {
  const TotalCircularHCut({super.key});

  @override
  State<TotalCircularHCut> createState() => _TotalCircularHCutState();
}

class _TotalCircularHCutState extends State<TotalCircularHCut> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    totalHairCuts;
    totalClientes;
    loadTotalClientes();

    getTotalCut();
  }

  int? totalClientes;
  Future<void> loadTotalClientes() async {
    int? clientsServer = await AgendaProvider().totalClientes();

    setState(() {
      totalClientes = clientsServer;
    });
  }

  int? totalHairCuts;
  Future<void> getTotalCut() async {
    int? serverCutHair = await AgendaProvider().totalHairFeitos();

    setState(() {
      totalHairCuts = serverCutHair;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 3.5,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                // CircularProgress com valor fixo de 1
                SizedBox(
                  width: 150,
                  height: 150,
                  child: CircularProgressIndicator(
                    value: 1,
                    color: Colors.grey.shade900.withOpacity(0.18),
                    strokeWidth: 15,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (totalHairCuts! <= 5)
                      Text(
                        totalHairCuts == null
                            ? 'N/A'
                            : totalHairCuts! <= 5
                                ? 'Nível Normal'
                                : totalHairCuts! <= 10
                                    ? 'Nível Bronze'
                                    : totalHairCuts! <= 20
                                        ? 'Nível Prata'
                                        : totalHairCuts! <= 40
                                            ? 'Nível Ouro'
                                            : 'Nível Desconhecido',
                        style: TextStyle(
                          fontFamily: 'PoppinsTitle',
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    Icon(
                      Icons.timeline,
                      color: Colors.grey.shade900.withOpacity(0.5),
                    ),
                  ],
                ),
                // CircularProgress que muda de acordo com os valores
                SizedBox(
                  height: 150,
                  width: 150,
                  child: CircularProgressIndicator(
                    value:
                        0.4, // Altere este valor para representar o progresso
                    color: Colors.green,
                    strokeWidth: 15,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Total de \n Cortes',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'PoppinsTitle',
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        '${totalHairCuts ?? 0}',
                        style: TextStyle(
                            fontFamily: 'PoppinsNormal',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Clientes Cadastrados',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'PoppinsTitle',
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        '${totalClientes ?? 0}',
                        style: TextStyle(
                            fontFamily: 'PoppinsNormal',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
