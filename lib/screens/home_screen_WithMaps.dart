import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:projetos/functions/agendaProvider/agendaProvider.dart';
import 'package:projetos/screens/MyHairCutsScreen.dart';
import 'package:projetos/screens/MyProfileScreen.dart';
import 'package:projetos/screens/agendar.dart';
import 'package:projetos/screens/principalHome.dart';
import 'package:projetos/screens/scheduleScreen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  
  int screen = 0;
  List<Map<String, Object>>? _screensSelect;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _screensSelect = [
      {
        'tela': const PrincipalHomeScreen(),
      },
      {
        'tela': const ScheduleScreen(),
      },
      {
        'tela': const AgendarFunctionScreen(),
      },
      {
        'tela': const MyHairCutScreen(),
      },
      {
        'tela': const MyProfileScreen(),
      },
    ];
  }

  void attScren(int index) {
    setState(() {
      screen = index;
    });
    Provider.of<AgendaProvider>(context, listen: false).loadHistoryCortes();
    Provider.of<AgendaProvider>(context, listen: false).totalHairFeitos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _screensSelect![screen]['tela'] as Widget,
      bottomNavigationBar: CurvedNavigationBar(
        height: 50,
        animationDuration: const Duration(milliseconds: 300),
        onTap: attScren,
        backgroundColor: Colors.green,
        items: const [
          Icon(
            Icons.home,
          ),
          Icon(
            Icons.calendar_month,
          ),
          Icon(
            Icons.add,
          ),
          Icon(
            Icons.manage_search,
          ),
          Icon(
            Icons.account_circle,
          ),
        ],
      ),
    );
  }
}
