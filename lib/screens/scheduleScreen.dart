import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projetos/functions/agendaProvider/agendaProvider.dart';
import 'package:projetos/screenComponents/agenda/stack.dart';
import 'package:provider/provider.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  List<int> lastSevenDays = [];
  void setDays() {
    DateTime now = DateTime.now();
    for (int i = 0; i < 7; i++) {
      DateTime date = now.add(Duration(days: i));
      int DayMonth = int.parse(DateFormat('d').format(date));
      lastSevenDays.add(DayMonth);
    }
    lastSevenDays = lastSevenDays.toList();
  }

  @override
  void initState() {
    lastSevenDays;
    // TODO: implement initState
    super.initState();
    setDays();
    lastSevenDays;
    if (lastSevenDays.isNotEmpty) {
      selectedDay = lastSevenDays[0];
      Provider.of<AgendaProvider>(context, listen: false)
          .loadListCortes(selectedDay);
    }
  }

  int selectedDay = 0;
  bool simounao = false;
  @override
  Widget build(BuildContext context) {
    final lista =
        Provider.of<AgendaProvider>(context, listen: false).agendaLista;
    return SafeArea(
      child: Stack(
        children: [
          SizedBox(
            height: 15,
          ),
          StackForWidgets(
            selectedDay: selectedDay,
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4.2,
              decoration: BoxDecoration(color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 15,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Horarios Preenchidos',
                            style: TextStyle(
                              fontFamily: 'PoppinsTitle',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Todos os Demais Horários estão Livres, crie seu agendamento na tela ao lado',
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'PoppinsNormal',
                                color: Colors.grey.shade600),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 1),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.black.withOpacity(0.1),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(left: 5, right: 5),
                          width: double.infinity,
                          height: 75,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: lastSevenDays.map((day) {
                              return Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 2, right: 2, top: 5, bottom: 5),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectedDay = day;
                                        Provider.of<AgendaProvider>(context,
                                                listen: false)
                                            .loadListCortes(selectedDay);
                                  
                                  
                                      });
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 0.5,
                                            color:
                                                Colors.grey.withOpacity(0.5)),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.elliptical(20, 20),
                                          topRight: Radius.elliptical(20, 20),
                                          bottomLeft: Radius.elliptical(20, 20),
                                          bottomRight:
                                              Radius.elliptical(20, 20),
                                        ),
                                        color: Colors.grey.withOpacity(0.4),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            'dia',
                                            style: TextStyle(
                                              fontFamily: 'PoppinsNormal',
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  Colors.grey.withOpacity(0.6),
                                            ),
                                          ),
                                          Text(
                                            '${day}',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'PoppinsTitle',
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.black.withOpacity(0.1),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
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
