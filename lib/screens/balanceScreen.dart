import 'package:flutter/material.dart';
import 'package:projetos/screenComponents/balance/payMethotods.dart';

class MyCurrentBalance extends StatelessWidget {
  const MyCurrentBalance({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Icon(
                  Icons.close,
                  size: 30,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Carteira',
                style: TextStyle(
                  color: Colors.grey.shade900,
                  fontSize: 25,
                  fontFamily: 'PoppinsTitle',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  height: MediaQuery.of(context).size.height / 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 1,
                      color: Colors.black.withOpacity(0.3),
                    ),
                    color: Colors.grey.shade200.withOpacity(0.7),
                  ),
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Saldo Disponível',
                            style: TextStyle(
                                fontFamily: 'PoppinsNormal',
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.grey.shade900),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'R\$23.50',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 39,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width / 2.7,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Recarregar',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'PoppinsNormal',
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //Fim do card do saldo
            ],
          ),
        ),
      ),
    );
  }
}
