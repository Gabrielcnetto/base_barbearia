import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projetos/utils/AppRoutes.dart';

class AuthValidationScree extends StatefulWidget {
  const AuthValidationScree({super.key});

  @override
  State<AuthValidationScree> createState() => _AuthValidationScreeState();
}

class _AuthValidationScreeState extends State<AuthValidationScree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (ctx, snpshot) {
        if (snpshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        if (snpshot.hasData) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.of(context).pushNamed(
              AppRoutes.HomeScreen,
            );
          });
        } else {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.of(context).pushNamed(AppRoutes.AuthScreenPrimary);
          });
        }
        return Container();
      },
    );
  }
}
