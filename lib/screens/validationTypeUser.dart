import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:projetos/functions/auth/functions/createUser.dart';
import 'package:projetos/screens/home_screen_WithMaps.dart';
import 'package:projetos/screens/isProffScreen.dart';

class ValidationTypeUser extends StatefulWidget {
  const ValidationTypeUser({super.key});

  @override
  State<ValidationTypeUser> createState() => _ValidationTypeUserState();
}

class _ValidationTypeUserState extends State<ValidationTypeUser> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadTypeUser();
  }

  bool? isProffUser;

  Future<void> loadTypeUser() async {
    bool? typeisProffUser = await CreateUserProvider().getIsProff();
    if (typeisProffUser == true) {
      setState(() {
        isProffUser = true;
      });
    } else {
      setState(() {
        isProffUser = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return isProffUser == true ? IsProffScren() : HomeScreen();
  }
}
