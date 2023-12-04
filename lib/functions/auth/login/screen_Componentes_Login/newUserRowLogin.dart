import 'package:flutter/material.dart';
import 'package:projetos/utils/AppRoutes.dart';

class NewUserLoginRow extends StatelessWidget {
  const NewUserLoginRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Container(
        width: double.infinity,
        height: 30,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Ainda não tem cadastro?',
              style: TextStyle(
                fontFamily: 'PoppinsNormal',
                color: Colors.black,
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.RegisterScreen,
                );
              },
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Text(
                  'Crie sua Conta',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'PoppinsTitle',
                    fontSize: 15,
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
