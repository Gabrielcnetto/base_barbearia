import 'package:flutter/material.dart';
import 'package:projetos/classes/agendaClass.dart';

class AgendadoNaAgenda extends StatefulWidget {
  final agendaItem item;
  const AgendadoNaAgenda({super.key, required this.item});

  @override
  State<AgendadoNaAgenda> createState() => _AgendadoNaAgendaState();
}

class _AgendadoNaAgendaState extends State<AgendadoNaAgenda> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('print do item: ${widget.item.Cabelereiro}');
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 15,
        left: 15,
        bottom: 20,
      ),
      child: Container(
        alignment: Alignment.bottomCenter,
        width: double.infinity,
        height: MediaQuery.of(context).size.height / 5,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.elliptical(15, 15),
            topRight: Radius.elliptical(15, 15),
            bottomLeft: Radius.elliptical(15, 15),
            bottomRight: Radius.elliptical(15, 15),
          ),
          color: Color.fromARGB(255, 33, 145, 39),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.item.userName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'PoppinsTitle',
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.schedule,
                          color: Colors.white,
                          size: 20,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          '${widget.item.FirstComponentHour}:${widget.item.SecondComponentHour}',
                          style: const TextStyle(
                            fontFamily: 'PoppinsNormal',
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_month,
                          color: Colors.white,
                          size: 20,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          '${widget.item.day}/${widget.item.month}/${widget.item.year}',
                          style: const TextStyle(
                            fontFamily: 'PoppinsNormal',
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.orangeAccent,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        Icons.check,
                        size: 15,
                        color: Colors.black,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        widget.item.sobrancela == true
                            ? 'Cabelo e Sobrancelha'
                            : 'Apenas Cabelo',
                        style: TextStyle(
                          color: Colors.grey.shade800,
                          fontFamily: 'PoppinsNormal',
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.cut,
                        size: 20,
                        color: Colors.grey.shade900,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        widget.item.Cabelereiro,
                        style: TextStyle(
                          color: Colors.grey.shade800,
                          fontFamily: 'PoppinsNormal',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Container(
                width: 80,
                height: 80,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    widget.item.imageUser
                  ),
                ),
              ),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      ),
    );
  }
}
