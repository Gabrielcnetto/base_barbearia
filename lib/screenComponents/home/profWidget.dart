import 'package:flutter/material.dart';
import 'package:projetos/classes/profissionalClass.dart';

class ProfWdiget extends StatefulWidget {
  final ProfissionalClass profInfs;
  const ProfWdiget({
    super.key,
    required this.profInfs,
  });

  @override
  State<ProfWdiget> createState() => _ProfWdigetState();
}

class _ProfWdigetState extends State<ProfWdiget> {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Container(
        padding: EdgeInsets.all(5),
        
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              child: Container(
                width: 100,
                height: 100,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    widget.profInfs.urlPhoto,
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
                  widget.profInfs.name,
                  style: const TextStyle(
                    fontFamily: 'PoppinsNormal',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.profInfs.topCut,
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
                        ' R\$${widget.profInfs.valueCut.toStringAsFixed(0)} ',
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
