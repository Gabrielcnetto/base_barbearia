import 'package:flutter/material.dart';
import 'package:projetos/functions/auth/functions/createUser.dart';
import 'package:projetos/functions/auth/login/screen_Componentes_Login/auth_logoLogin.dart';
import 'package:projetos/functions/auth/login/screen_Componentes_Login/newUserRowLogin.dart';
import 'package:projetos/utils/AppRoutes.dart';
import 'package:provider/provider.dart';

class AuthScreenPrimary extends StatefulWidget {
  const AuthScreenPrimary({super.key});

  @override
  State<AuthScreenPrimary> createState() => _AuthScreenPrimaryState();
}

class _AuthScreenPrimaryState extends State<AuthScreenPrimary> {
  final emailControler = TextEditingController();
  final passwordControler = TextEditingController();

  Future<void> dataConnec() async {
    Provider.of<CreateUserProvider>(context, listen: false).login(
      emailControler.text,
      passwordControler.text,
    );
  }

  bool showPass = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const AuthLogo(),
                  //USERINFS
                  Card(
                    color: Colors.white,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        15,
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          15,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      width: double.infinity,
                      child: Column(
                        children: [
                          //INICIO -> E-MAIL
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 5),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: emailControler,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      label: Text(
                                        'E-Mail',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.mail,
                                  color: Colors.grey.shade800,
                                ),
                              ],
                            ),
                          ),
                          //FIM -> E-MAIL
                          //INICIO -> SENHA
                          Container(
                            decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                  color: Colors.black.withOpacity(0.3),
                                ),
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 5),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: passwordControler,
                                    obscureText: showPass,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      label: Text(
                                        'Sua Senha',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      showPass = !showPass;
                                    });
                                  },
                                  child: Icon(
                                    showPass
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.grey.shade800,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          //FIM -> SENHA
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: InkWell(
                      onTap: () {
                        dataConnec();
                        Navigator.of(context)
                            .pushNamed(AppRoutes.homeVerification);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue,
                        ),
                        alignment: Alignment.center,
                        width: double.infinity,
                        height: 50,
                        child: const Text(
                          'Entrar Agora',
                          style: TextStyle(
                            fontFamily: 'PoppinsNormal',
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const NewUserLoginRow(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
