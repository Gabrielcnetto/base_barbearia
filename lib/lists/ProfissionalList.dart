import 'dart:math';

import 'package:projetos/classes/profissionalClass.dart';

List<ProfissionalClass> profiList = [
  ProfissionalClass(
    id: Random().nextDouble().toString(),
    name: 'Cléber',
    topCut: 'Mid Fade',
    urlPhoto:
        'https://img.freepik.com/fotos-gratis/elegante-homem-sentado-em-uma-barbearia_1157-24956.jpg?size=626&ext=jpg&ga=GA1.1.812314629.1701018470&semt=ais',
    description: 'Corto Cabelo há 7 anos',
    valueCut: 25,
  ),
  ProfissionalClass(
    id: Random().nextDouble().toString(),
    name: 'Lucas Henrique',
    topCut: 'Top Fade',
    urlPhoto:
        'https://img.freepik.com/fotos-premium/foto-de-perfil-de-um-jovem-barbeiro-aparando-o-cabelo-de-seu-cliente-com-um-barbeador-eletrico-e-um-pente-em-uma-barbearia_283617-3218.jpg?size=626&ext=jpg&ga=GA1.1.812314629.1701018470&semt=ais',
    description: 'Sou o Dono da Barbearia',
    valueCut: 45,
  ),
  ProfissionalClass(
    id: Random().nextDouble().toString(),
    name: 'Pedro Luiz',
    topCut: 'Raspar',
    urlPhoto:
        'https://img.freepik.com/fotos-gratis/retrato-de-barbeiro-em-pe-com-o-braco-cruzado_107420-94783.jpg?size=626&ext=jpg&ga=GA1.1.812314629.1701018470&semt=ais',
    description: 'Comecei há 2 Anos na Barbearia',
    valueCut: 15,
  ),
];
