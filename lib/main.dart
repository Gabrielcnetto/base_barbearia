import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projetos/functions/DataBaseInfs/getDataBase.dart';
import 'package:projetos/functions/agendaProvider/agendaProvider.dart';
import 'package:projetos/functions/auth/auth_validation/auth_validationScree.dart';
import 'package:projetos/functions/auth/functions/createUser.dart';
import 'package:projetos/functions/auth/login/screens/auth_ScreenLogin.dart';
import 'package:projetos/functions/auth/register/screens/register_screen.dart';
import 'package:projetos/screens/home_screen_WithMaps.dart';
import 'package:projetos/screens/scheduleScreen.dart';
import 'package:projetos/utils/AppRoutes.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const AlmiranteApp());
}

class AlmiranteApp extends StatelessWidget {
  const AlmiranteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => GetDataBase(),
        ),
        ChangeNotifierProvider(
          create: (_) => CreateUserProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => AgendaProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Almirante Barbearia',
        routes: {
          AppRoutes.homeVerification: (ctx) => const AuthValidationScree(),
          AppRoutes.HomeScreen: (ctx) => const HomeScreen(),
          AppRoutes.AuthScreenPrimary: (ctx) => const AuthScreenPrimary(),
          AppRoutes.RegisterScreen: (ctx) => const RegisterScreen(),
          AppRoutes.ScheduleScreen: (ctx)=>const ScheduleScreen(),
        },
      ),
    );
  }
}
