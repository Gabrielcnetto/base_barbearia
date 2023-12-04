import 'package:flutter/material.dart';

class PercentDescont extends StatefulWidget {
  const PercentDescont({super.key});

  @override
  State<PercentDescont> createState() => _PercentDescontState();
}

class _PercentDescontState extends State<PercentDescont> {
  final userName = TextEditingController();
  void newAgenda() {}
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 310,
      child: Stack(
        children: [
          Positioned(
            top: 60,
            right: 160,
            left: 15,
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 15,
              ),
              decoration: BoxDecoration(
                color: Colors.grey.shade800,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.elliptical(20, 20),
                  bottomLeft: Radius.elliptical(20, 20),
                ),
              ),
              height: 180,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '-40% Desconto',
                    style: TextStyle(
                      fontFamily: 'PoppinsTitle',
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: 180,
                      child: Text(
                        'Em Agendamentos Feitos Até 10 de Dezembro',
                        overflow: TextOverflow.visible,
                        style: TextStyle(
                          color: Colors.grey.shade100,
                          fontFamily: 'PoppinsNormal',
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      'Agendar Agora',
                      style: TextStyle(
                        fontFamily: 'PoppinsNormal',
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 14,
            right: 14,
            bottom: 14,
            child: Container(
              width: 200,
              height: 300,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.elliptical(40, 40),
                  bottomRight: Radius.elliptical(40, 40),
                  topLeft: Radius.elliptical(40, 40),
                  bottomLeft: Radius.elliptical(40, 40),
                ),
                child: Image.network(
                  'https://img.freepik.com/fotos-gratis/homem-em-um-salao-de-barbearia-fazendo-o-corte-de-cabelo-e-barba_1303-20948.jpg?w=740&t=st=1701023332~exp=1701023932~hmac=509225abe56986fe69901b5731b6229d263498abb3979b8e4911be24ffcc06b7',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
