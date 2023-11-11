import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:valorant_app/provider/agents_provider.dart';
import 'package:valorant_app/screens/intro.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AgentsProvider>(
      create: (context) {
        return AgentsProvider();
      },
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'Rubik',
          useMaterial3: true,
        ),
        title: 'Material App',
        home: const IntroScreen(),
      ),
    );
  }
}
