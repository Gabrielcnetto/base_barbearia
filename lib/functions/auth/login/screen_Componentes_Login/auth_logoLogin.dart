import 'package:flutter/material.dart';

class AuthLogo extends StatelessWidget {
  const AuthLogo({super.key});

  @override
  Widget build(BuildContext context) {
    const String barberLogo =
        'https://static.vecteezy.com/system/resources/previews/016/706/773/original/barber-shop-logo-free-png.png';
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            width: MediaQuery.of(context).size.width / 1.5,
            height: MediaQuery.of(context).size.height / 3.3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Barbearia Padrão',
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'PoppinsTitle',
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  width: 120,
                  height: 120,
                  child: Image.network(
                    barberLogo,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
