import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:projetos/classes/agendaClass.dart';

class LastAgenda extends StatelessWidget {
  final agendaItem agenda;
  const LastAgenda({super.key, required this.agenda});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 15,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    agenda.userName,
                    style: TextStyle(
                      fontFamily: 'PoppinsTitle',
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Data:',
                        style: TextStyle(
                          fontFamily: 'PoppinsNormal',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade800,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
