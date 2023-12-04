import 'package:flutter/material.dart';
import 'package:projetos/screenComponents/agenda/stack.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Horarios Preenchidos',
                  style: TextStyle(
                    fontFamily: 'PoppinsTitle',
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Todos os Demais Horários estão Livres, crie seu agendamento na tela ao lado',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'PoppinsNormal',
                    color: Colors.grey.shade900,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          StackForWidgets(),
        ],
      ),
    );
  }
}
