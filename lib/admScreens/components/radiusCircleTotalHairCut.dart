import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TotalCircularHCut extends StatefulWidget {
  const TotalCircularHCut({super.key});

  @override
  State<TotalCircularHCut> createState() => _TotalCircularHCutState();
}

class _TotalCircularHCutState extends State<TotalCircularHCut> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 3.5,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                // CircularProgress com valor fixo de 1
                SizedBox(
                  width: 150,
                  height: 150,
                  child: CircularProgressIndicator(
                    value: 1,
                    color: Colors.grey.shade900.withOpacity(0.18),
                    strokeWidth: 15,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Nível Prata',
                      style: TextStyle(
                        fontFamily: 'PoppinsTitle',
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    Icon(
                      Icons.timeline,
                      color: Colors.grey.shade900.withOpacity(0.5),
                    ),
                  ],
                ),
                // CircularProgress que muda de acordo com os valores
                SizedBox(
                  height: 150,
                  width: 150,
                  child: CircularProgressIndicator(
                    value:
                        0.4, // Altere este valor para representar o progresso
                    color: Colors.green,
                    strokeWidth: 15,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Total de Cortes',
                style: TextStyle(
                  fontFamily: 'PoppinsTitle',
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Text(
                '25',
                style: TextStyle(
                    fontFamily: 'PoppinsNormal',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
