import 'package:flutter/material.dart';
import 'package:projetos/utils/AppRoutes.dart';

class FormsUserRegister extends StatefulWidget {
  final void Function(String, String, String, String) onRegister;
  const FormsUserRegister({super.key, required this.onRegister});

  @override
  State<FormsUserRegister> createState() => _FormsUserRegisterState();
}

class _FormsUserRegisterState extends State<FormsUserRegister> {
  final userNameControler = TextEditingController();
  final emailControler = TextEditingController();
  final numberControler = TextEditingController();
  final passwordControler = TextEditingController();
  bool showPass = true;

  void submitInfs() {
    setState(() {
      widget.onRegister(
        userNameControler.text,
        emailControler.text,
        passwordControler.text,
        numberControler.text,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 1.6,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //INICIO -> BOX DO NOME
          Card(
            color: Colors.grey.shade200,
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  width: 1,
                  color: Colors.black.withOpacity(0.3),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.account_circle,
                    color: Colors.grey,
                    size: 30,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: userNameControler,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        label: Text(
                          'Seu Nome',
                          style: TextStyle(
                            fontFamily: 'PoppinsNormal',
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          //FIM -> BOX DO NOME
          const SizedBox(
            height: 10,
          ),
          //INICIO ->CARD DO EMAIL
          Card(
            color: Colors.grey.shade200,
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  width: 1,
                  color: Colors.black.withOpacity(0.3),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.mail,
                    color: Colors.grey,
                    size: 30,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: emailControler,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        label: Text(
                          'E-mail',
                          style: TextStyle(
                            fontFamily: 'PoppinsNormal',
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          //FIM ->CARD DO EMAIL
          const SizedBox(
            height: 10,
          ),
          //INICIO -> CARD TELEFONE
          Card(
            color: Colors.grey.shade200,
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  width: 1,
                  color: Colors.black.withOpacity(0.3),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.call,
                    color: Colors.grey,
                    size: 30,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: numberControler,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        label: Text(
                          'Digite seu Telefone',
                          style: TextStyle(
                            fontFamily: 'PoppinsNormal',
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          //FIM -> CARD TELEFONE
          const SizedBox(
            height: 10,
          ), //INICIO ->CARD DA SENHA
          Card(
            color: Colors.grey.shade200,
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  width: 1,
                  color: Colors.black.withOpacity(0.3),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.lock,
                    color: Colors.grey,
                    size: 30,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: passwordControler,
                      obscureText: showPass,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        label: Text(
                          'Sua Senha',
                          style: TextStyle(
                            fontFamily: 'PoppinsNormal',
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 10,
                    ),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          showPass = !showPass;
                        });
                      },
                      child: const Icon(
                        Icons.visibility,
                        color: Colors.grey,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          //FIM -->CARD DA SENHA
          const SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {
              submitInfs();
              Navigator.of(context).pushNamed(
                AppRoutes.homeVerification,
              );
            },
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 70,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Text(
                'Criar Conta',
                style: TextStyle(
                  fontFamily: 'PoppinsTitle',
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
