import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TotalCircularHCut extends StatelessWidget {
  const TotalCircularHCut({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height / 3.5,
        color: Colors.red,
      ),
    );
  }
}
