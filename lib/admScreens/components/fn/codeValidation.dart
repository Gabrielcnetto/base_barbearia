import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CodeValidation extends StatefulWidget {
  const CodeValidation({super.key});

  @override
  State<CodeValidation> createState() => _CodeValidationState();
}

class _CodeValidationState extends State<CodeValidation> {
  final numberClient = TextEditingController();
  late String finalCode;
  late int num1, num2, num3, num4, num5;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    numberClient.text = '12345'; // Exemplo de entrada
    finalCode = numberClient.text;
    num1 = int.parse(finalCode[0]);
    num2 = int.parse(finalCode[1]);
    num3 = int.parse(finalCode[2]);
    num4 = int.parse(finalCode[3]);
    num5 = int.parse(finalCode[4]);
  }

  bool updateNumber = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 1,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 15,
          right: 15,
          top: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Insira o Código de Agendamento',
                  style: TextStyle(
                    fontFamily: 'PoppinsTitle',
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                  'Peça o Código ao seu Cliente',
                  style: TextStyle(
                    fontFamily: 'PoppinsNormal',
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade900.withOpacity(0.7),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {},
              child: Container(
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
                child: Row(
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
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 10,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(15),
                ),
                alignment: Alignment.center,
                child: Text(
                  'Confirmar',
                  style: TextStyle(
                    fontFamily: 'PoppinsTitle',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
