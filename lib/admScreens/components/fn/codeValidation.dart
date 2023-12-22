import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CodeValidation extends StatefulWidget {
  const CodeValidation({super.key});

  @override
  State<CodeValidation> createState() => _CodeValidationState();
}

class _CodeValidationState extends State<CodeValidation> {
  final finalConfirmCode = TextEditingController();
  final confirm1 = TextEditingController();
  final confirm2 = TextEditingController();
  final confirm3 = TextEditingController();
  final confirm4 = TextEditingController();
  final confirm5 = TextEditingController();

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
            Container(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  width: 1,
                  color: Colors.grey.shade900.withOpacity(0.3),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //Primeiro Número
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        width: 1,
                        color: Colors.grey.shade900.withOpacity(0.5),
                      ),
                    ),
                    width: 60,
                    height: 60,
                    child: TextFormField(
                      controller: confirm1,
                      style: TextStyle(
                        fontFamily: 'PoppinsTitle',
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  //Segundo Número
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        width: 1,
                        color: Colors.grey.shade900.withOpacity(0.5),
                      ),
                    ),
                    width: 60,
                    height: 60,
                    child: TextFormField(
                      controller: confirm2,
                      style: TextStyle(
                        fontFamily: 'PoppinsTitle',
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  //terceiro número
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        width: 1,
                        color: Colors.grey.shade900.withOpacity(0.5),
                      ),
                    ),
                    width: 60,
                    height: 60,
                    child: TextFormField(
                      controller: confirm3,
                      style: TextStyle(
                        fontFamily: 'PoppinsTitle',
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  //quarto número
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        width: 1,
                        color: Colors.grey.shade900.withOpacity(0.5),
                      ),
                    ),
                    width: 60,
                    height: 60,
                    child: TextFormField(
                      controller: confirm4,
                      style: TextStyle(
                        fontFamily: 'PoppinsTitle',
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  //quinto número
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        width: 1,
                        color: Colors.grey.shade900.withOpacity(0.5),
                      ),
                    ),
                    width: 60,
                    height: 60,
                    child: TextFormField(
                      controller: confirm5,
                      style: TextStyle(
                        fontFamily: 'PoppinsTitle',
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
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
