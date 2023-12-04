import 'dart:math';

class HairStyle {
  final String id;
  final String name;
  final String description;
  final String photoUrl;

  HairStyle({
    required this.description,
    required this.id,
    required this.name,
    required this.photoUrl,
  });
}

List<HairStyle> listHairStyles = [
  HairStyle(
    description: 'Disfarçe com inicio na Zero, com fios altos em cima',
    id: Random().nextDouble().toString(),
    name: 'Mid Fade',
    photoUrl:
        'https://blog.oceane.com.br/wp-content/uploads/2023/05/DESTAQUE_HAIR_0305.jpg',
  ),
  HairStyle(
    description: 'Comum Raspar em cima e manter Disfarce alto',
    id: Random().nextDouble().toString(),
    name: 'Low Fade',
    photoUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcToao0t_CH_zzAYrnP9H5Mbm5vAXrv7GfgHRNqbo42AwQ&s',
  ),
];
