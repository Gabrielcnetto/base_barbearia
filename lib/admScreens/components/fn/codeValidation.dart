import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:projetos/functions/agendaProvider/agendaProvider.dart';
import 'package:projetos/utils/AppRoutes.dart';
import 'package:provider/provider.dart';

class CodeValidation extends StatefulWidget {
  const CodeValidation({super.key});

  @override
  State<CodeValidation> createState() => _CodeValidationState();
}

class _CodeValidationState extends State<CodeValidation> {
  FocusNode field2FocusNode = FocusNode();
  FocusNode field3FocusNode = FocusNode();
  FocusNode field4FocusNode = FocusNode();
  FocusNode field5FocusNode = FocusNode();
  final dataBaseFirestore = FirebaseFirestore.instance;
  final authSettings = FirebaseAuth.instance;

  final finalConfirmCode = TextEditingController();
  final confirm1 = TextEditingController();
  final confirm2 = TextEditingController();
  final confirm3 = TextEditingController();
  final confirm4 = TextEditingController();
  final confirm5 = TextEditingController();

  Future<void> getCodesAndSubmit() async {
    //INICIO => Concatenando os itens
    final String finalCode = await (confirm1.text +
        confirm2.text +
        confirm3.text +
        confirm4.text +
        confirm5.text);
    //FIM => Concatenando os itens
    // Provider.of<AgendaProvider>(context, listen: false).updateIsActive(
    //   randomNumber: finalCode,
    //   selectedDay: '23',
    // );
    await Provider.of<AgendaProvider>(context, listen: false)
        .setAndMyCortesIsActive(finalCode);

    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: Text(
              'Código Confirmado',
              style: TextStyle(
                fontFamily: 'PoppinsTitle',
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            content: Text(
              'Este Corte estava agendado, e foi confirmado',
              style: TextStyle(
                fontFamily: 'PoppinsNormal',
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade600,
              ),
            ),
            actions: [
              ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    Colors.green,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Fechar',
                  style: TextStyle(
                    fontFamily: 'PoppinsNormal',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          );
        });
  }

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
                      onFieldSubmitted: (term) {
                        FocusScope.of(context).requestFocus(field2FocusNode);
                      },
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      controller: confirm1,
                      style: TextStyle(
                        fontFamily: 'PoppinsTitle',
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        counterText: '',
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
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      focusNode: field2FocusNode,
                      onFieldSubmitted: (term) {
                        FocusScope.of(context).requestFocus(field3FocusNode);
                      },
                      controller: confirm2,
                      style: TextStyle(
                        fontFamily: 'PoppinsTitle',
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        counterText: '',
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
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      controller: confirm3,
                      onFieldSubmitted: (term) {
                        FocusScope.of(context).requestFocus(field4FocusNode);
                      },
                      focusNode: field3FocusNode,
                      style: TextStyle(
                        fontFamily: 'PoppinsTitle',
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        counterText: '',
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
                      keyboardType: TextInputType.number,
                      controller: confirm4,
                      onFieldSubmitted: (term) {
                        FocusScope.of(context).requestFocus(field5FocusNode);
                      },
                      focusNode: field4FocusNode,
                      maxLength: 1,
                      style: TextStyle(
                        fontFamily: 'PoppinsTitle',
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        counterText: '',
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
                      onFieldSubmitted: (term) {
                        getCodesAndSubmit();
                      },
                      focusNode: field5FocusNode,
                      keyboardType: TextInputType.number,
                      controller: confirm5,
                      maxLength: 1,
                      style: TextStyle(
                        fontFamily: 'PoppinsTitle',
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        counterText: '',
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
            InkWell(
              onTap: getCodesAndSubmit,
              child: Card(
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
