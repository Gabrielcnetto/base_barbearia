import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:projetos/admScreens/components/fn/codeValidation.dart';
import 'package:projetos/utils/AppRoutes.dart';

class ProffOptionsComponent extends StatefulWidget {
  const ProffOptionsComponent({super.key});

  @override
  State<ProffOptionsComponent> createState() => _ProffOptionsComponentState();
}

class _ProffOptionsComponentState extends State<ProffOptionsComponent> {
  void openValidationFunction() {
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return CodeValidation();
        });
  }

  void goToClientMenu() {
    Navigator.of(context).pushReplacementNamed(
      AppRoutes.HomeScreen,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 3.5,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: InkWell(
              onTap: openValidationFunction,
              child: Card(
                elevation: 2,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      width: 0.5,
                      color: Colors.black.withOpacity(0.4),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Icon(Icons.check_circle),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Código',
                            style: TextStyle(
                              fontFamily: 'PoppinsTitle',
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Icon(
                        Icons.grid_view,
                        color: Colors.grey.shade900,
                        size: 60,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Clique para Validar',
                        style: TextStyle(
                          fontFamily: 'PoppinsNormal',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: goToClientMenu,
                      child: Card(
                        elevation: 2,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              width: 0.5,
                              color: Colors.black.withOpacity(0.4),
                            ),
                          ),
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Icon(Icons.home),
                                  ),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Text(
                                    'Area Cliente',
                                    style: TextStyle(
                                      fontFamily: 'PoppinsTitle',
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Icon(
                                Icons.cloud_sync,
                                color: Colors.grey.shade900,
                                size: 30,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Voltar ao Menu',
                                style: TextStyle(
                                  fontFamily: 'PoppinsNormal',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      elevation: 2,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            width: 0.5,
                            color: Colors.black.withOpacity(0.4),
                          ),
                        ),
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Icon(Icons.splitscreen),
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  'Todos',
                                  style: TextStyle(
                                    fontFamily: 'PoppinsTitle',
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Icon(
                              Icons.receipt_long,
                              color: Colors.grey.shade900,
                              size: 30,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Todos os Cortes',
                              style: TextStyle(
                                fontFamily: 'PoppinsNormal',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
