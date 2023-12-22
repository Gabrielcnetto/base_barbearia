import 'package:flutter/material.dart';
import 'package:projetos/classes/agendaClass.dart';
import 'package:projetos/functions/agendaProvider/agendaProvider.dart';
import 'package:provider/provider.dart';

class LastAgenda extends StatefulWidget {
  final agendaItem agenda;
  const LastAgenda({super.key, required this.agenda});

  @override
  State<LastAgenda> createState() => _LastAgendaState();
}

class _LastAgendaState extends State<LastAgenda> {
  void showQrModal() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        String numberGeral = widget.agenda.ramdomNumber.toString();
        var num1 = int.parse(numberGeral[0]);
        var num2 = int.parse(numberGeral[1]);
        var num3 = int.parse(numberGeral[2]);
        var num4 = int.parse(numberGeral[3]);
        var num5 = int.parse(numberGeral[4]);

        return Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 1.5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Código Disponível',
                style: TextStyle(
                  fontFamily: 'PoppinsTitle',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade900,
                ),
              ),
              Text(
                'Apresente este Código ao seu barbeiro, antes de realizar seu corte',
                style: TextStyle(
                  fontFamily: 'PoppinsNormal',
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 4.5,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 0.5,
                    color: Colors.grey.shade900.withOpacity(0.5),
                  ),
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: widget.agenda.isActive == true
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.elliptical(15, 15),
                                bottomRight: Radius.elliptical(15, 15),
                                topLeft: Radius.elliptical(15, 15),
                                topRight: Radius.elliptical(15, 15),
                              ),
                            ),
                            elevation: 2,
                            child: Container(
                              padding: EdgeInsets.all(20),
                              child: Text(
                                '${num1}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'PoppinsTitle',
                                  fontSize: 16,
                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.elliptical(15, 15),
                                  bottomRight: Radius.elliptical(15, 15),
                                  topLeft: Radius.elliptical(15, 15),
                                  topRight: Radius.elliptical(15, 15),
                                ),
                                border: Border.all(
                                  width: 0.5,
                                  color: Colors.grey.shade900.withOpacity(0.5),
                                ),
                              ),
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.elliptical(15, 15),
                                bottomRight: Radius.elliptical(15, 15),
                                topLeft: Radius.elliptical(15, 15),
                                topRight: Radius.elliptical(15, 15),
                              ),
                            ),
                            child: Container(
                              padding: EdgeInsets.all(20),
                              child: Text(
                                '${num2}',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'PoppinsTitle',
                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.elliptical(15, 15),
                                  bottomRight: Radius.elliptical(15, 15),
                                  topLeft: Radius.elliptical(15, 15),
                                  topRight: Radius.elliptical(15, 15),
                                ),
                                border: Border.all(
                                  width: 0.5,
                                  color: Colors.grey.shade900.withOpacity(0.5),
                                ),
                              ),
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.elliptical(15, 15),
                                bottomRight: Radius.elliptical(15, 15),
                                topLeft: Radius.elliptical(15, 15),
                                topRight: Radius.elliptical(15, 15),
                              ),
                            ),
                            child: Container(
                              padding: EdgeInsets.all(20),
                              child: Text(
                                '${num3}',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'PoppinsTitle',
                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.elliptical(15, 15),
                                  bottomRight: Radius.elliptical(15, 15),
                                  topLeft: Radius.elliptical(15, 15),
                                  topRight: Radius.elliptical(15, 15),
                                ),
                                border: Border.all(
                                  width: 0.5,
                                  color: Colors.grey.shade900.withOpacity(0.5),
                                ),
                              ),
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.elliptical(15, 15),
                                bottomRight: Radius.elliptical(15, 15),
                                topLeft: Radius.elliptical(15, 15),
                                topRight: Radius.elliptical(15, 15),
                              ),
                            ),
                            child: Container(
                              padding: EdgeInsets.all(20),
                              child: Text(
                                '${num4}',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'PoppinsTitle',
                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.elliptical(15, 15),
                                  bottomRight: Radius.elliptical(15, 15),
                                  topLeft: Radius.elliptical(15, 15),
                                  topRight: Radius.elliptical(15, 15),
                                ),
                                border: Border.all(
                                  width: 0.5,
                                  color: Colors.grey.shade900.withOpacity(0.5),
                                ),
                              ),
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.elliptical(15, 15),
                                bottomRight: Radius.elliptical(15, 15),
                                topLeft: Radius.elliptical(15, 15),
                                topRight: Radius.elliptical(15, 15),
                              ),
                            ),
                            child: Container(
                              padding: EdgeInsets.all(20),
                              child: Text(
                                '${num5}',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'PoppinsTitle',
                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.elliptical(15, 15),
                                  bottomRight: Radius.elliptical(15, 15),
                                  topLeft: Radius.elliptical(15, 15),
                                  topRight: Radius.elliptical(15, 15),
                                ),
                                border: Border.all(
                                  width: 0.5,
                                  color: Colors.grey.shade900.withOpacity(0.5),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    : Text(
                        'Corte Realizado',
                        style: TextStyle(
                            fontFamily: 'PoppinsTitle',
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.grey.shade900),
                      ),
              ),
              SizedBox(
                height: 10,
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Row(
                  children: [
                    Icon(Icons.chevron_left),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Voltar',
                      style: TextStyle(
                        fontFamily: 'PoppinsTitle',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 20,
                height: MediaQuery.of(context).size.width / 1,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  ),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.agenda.userName,
                    style: TextStyle(
                      fontFamily: 'PoppinsTitle',
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Dia:',
                            style: TextStyle(
                              fontFamily: 'PoppinsNormal',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade800,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '${widget.agenda.day}/${widget.agenda.month}',
                            style: TextStyle(
                              fontFamily: 'PoppinsTitle',
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Horário:',
                            style: TextStyle(
                              fontFamily: 'PoppinsNormal',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade800,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '${widget.agenda.FirstComponentHour}:${widget.agenda.SecondComponentHour}',
                            style: TextStyle(
                              fontFamily: 'PoppinsTitle',
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          InkWell(
            onTap: showQrModal,
            child: Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Ver Código',
                      style: TextStyle(
                        fontFamily: 'PoppinsNormal',
                        color: Colors.grey.shade900,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Icon(
                      Icons.qr_code,
                      size: 25,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
