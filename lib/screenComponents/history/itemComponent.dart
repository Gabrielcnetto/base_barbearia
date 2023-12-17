import 'package:flutter/material.dart';
import 'package:projetos/classes/agendaClass.dart';

class ComponenetScreen extends StatefulWidget {
  final agendaItem item;
  const ComponenetScreen({super.key, required this.item});

  @override
  State<ComponenetScreen> createState() => _ComponenetScreenState();
}

class _ComponenetScreenState extends State<ComponenetScreen> {
  bool moreInfs = false;
  void trueMoreInf() {
    setState(() {
      moreInfs = !moreInfs;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 1,
            color: Colors.grey.shade900.withOpacity(0.5),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Data do Corte: ${widget.item.day}/${widget.item.month}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'PoppinsTitle',
                  ),
                ),
                IconButton(
                  onPressed: trueMoreInf,
                  icon: const Icon(Icons.expand_more),
                ),
              ],
            ),
            if (moreInfs == true)
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Cabelereiro: ${widget.item.Cabelereiro}',
                          style: const TextStyle(fontFamily: 'PoppinsNormal'),
                        ),
                        Text(
                          'Cliente: ${widget.item.userName}',
                          style: const TextStyle(fontFamily: 'PoppinsNormal'),
                        ),
                      ],
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(color: Colors.orangeAccent, borderRadius: BorderRadius.circular(10)),
                            child: const Icon(
                              Icons.currency_ruble,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 5,),
                          const Text('+1 Ponto', style: TextStyle(fontFamily: 'PoppinsTitle', fontWeight: FontWeight.bold),)
                        ],
                      ),
                    )
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}
