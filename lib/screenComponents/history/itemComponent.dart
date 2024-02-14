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
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: trueMoreInf,
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                border:
                    Border.all(width: 0.5, color: Colors.grey.withOpacity(0.2)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      if (widget.item.isActive == true)
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: EdgeInsets.all(15),
                          child: Icon(
                            Icons.update,
                            size: 35,
                          ),
                        ),
                      if (widget.item.isActive == false)
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: EdgeInsets.all(15),
                          child: Icon(
                            Icons.check_box,
                            color: Colors.green,
                            size: 35,
                          ),
                        ),
                      SizedBox(
                        width: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          if (widget.item.sobrancela == true)
                            Text(
                              'Corte de Cabelo e Sobrancelha',
                              style: TextStyle(
                                fontFamily: 'PoppinsTitle',
                                color: Colors.black,
                              ),
                            ),
                          if (widget.item.sobrancela == false)
                            Text(
                              'Corte de Cabelo',
                              style: TextStyle(
                                fontFamily: 'PoppinsTitle',
                                color: Colors.black,
                              ),
                            ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 2),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                width: 1.5,
                                color: Colors.blue.shade800.withOpacity(0.5),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Icon(
                                    Icons.monetization_on,
                                    color: Colors.white,
                                    size: 10,
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '+1 Ponto',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'PoppinsTitle',
                                    color: Colors.orange,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '${widget.item.day}/${widget.item.month}/${widget.item.year}',
                        style: TextStyle(
                          fontFamily: 'PoppinsNormal',
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade500,
                        ),
                      ),
                      Text(
                        'R\$15',
                        style: TextStyle(
                          fontFamily: 'PoppinsTitle',
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          if (moreInfs == true)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 6,
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.elliptical(20, 20),
                  bottomRight: Radius.elliptical(20, 20),
                ),
              ),
              child: Column(
                //primeiro step
                children: [
                  Row(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 1,
                            height: 20,
                            decoration: BoxDecoration(color: Colors.black),
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Icon(
                            Icons.not_started,
                            color: Colors.black,
                            size: 18,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Agendou o Corte, Dia: ${widget.item.day}/${widget.item.month}',
                        style: TextStyle(
                          fontFamily: 'PoppinsTitle',
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // segundo step
                  Row(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 1,
                            height: 20,
                            decoration: BoxDecoration(color: Colors.black),
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Icon(
                            Icons.switch_account,
                            color: Colors.black,
                            size: 18,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Escolha de Barbeiro: ${widget.item.Cabelereiro}',
                        style: TextStyle(
                          fontFamily: 'PoppinsTitle',
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //terceiro step
                  Row(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 1,
                            height: 20,
                            decoration: BoxDecoration(color: Colors.black),
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Icon(
                            Icons.search,
                            color: Colors.black,
                            size: 18,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Código Único Gerado: ${widget.item.ramdomNumber}',
                        style: TextStyle(
                          fontFamily: 'PoppinsTitle',
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  //ponto recebido
                  SizedBox(
                    height: 10,
                  ),
                  if(widget.item.isActive == false)
                  Row(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 1,
                            height: 20,
                            decoration: BoxDecoration(color: Colors.black),
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.black,
                            size: 18,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Você Recebeu Pontos: +1',
                        style: TextStyle(
                          fontFamily: 'PoppinsTitle',
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  if(widget.item.isActive == true)
                                    Row(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 1,
                            height: 20,
                            decoration: BoxDecoration(color: Colors.black),
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Icon(
                            Icons.star_half,
                            color: Colors.black,
                            size: 18,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Pontuação Disponível em Breve',
                        style: TextStyle(
                          fontFamily: 'PoppinsTitle',
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
