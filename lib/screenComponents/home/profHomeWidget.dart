import 'package:flutter/material.dart';
import 'package:projetos/classes/profissionalClass.dart';
import 'package:projetos/lists/ProfissionalList.dart';
import 'package:projetos/screenComponents/home/profWidget.dart';

class ProffHomeWidget extends StatefulWidget {
  const ProffHomeWidget({super.key});

  @override
  State<ProffHomeWidget> createState() => _ProffHomeWidgetState();
}

class _ProffHomeWidgetState extends State<ProffHomeWidget> {
  final List<ProfissionalClass> profList = profiList;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 5),
        width: double.infinity,
        height: MediaQuery.of(context).size.height / 3,
        color: Colors.grey.shade200.withOpacity(0.5),
        child: Padding(
          padding: const EdgeInsets.only(left: 14, right: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nossos Profissionais',
                style: TextStyle(
                    fontFamily: 'PoppinsTitle',
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.grey.shade900),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: profList.map((pf) {
                        return ProfWdiget(
                          profInfs: pf,
                        );
                      }).toList()),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
