import 'package:flutter/material.dart';
import 'package:projetos/classes/profissionalClass.dart';

class ProfWdiget extends StatelessWidget {
  final ProfissionalClass profInfs;
  const ProfWdiget({
    super.key,
    required this.profInfs,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              child: Container(
                width: 110,
                height: 110,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    profInfs.urlPhoto,
                  ),
                  maxRadius: 40,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  profInfs.name,
                  style: const TextStyle(
                    fontFamily: 'PoppinsNormal',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  profInfs.topCut,
                  style: const TextStyle(
                    fontFamily: 'PoppinsTitle',
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.green,
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.monetization_on,
                        color: Colors.white,
                        size: 20,
                      ),
                      Text(
                        ' R\$${profInfs.valueCut.toStringAsFixed(0)} ',
                        style: const TextStyle(
                            fontFamily: 'PoppinsNormal',
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.white),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
