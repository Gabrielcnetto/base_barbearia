import 'package:flutter/material.dart';

class PaymentMethodsComponent extends StatelessWidget {
  const PaymentMethodsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Métodos de pagamento',
              style: TextStyle(
                fontFamily: 'PoppinsTitle',
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
