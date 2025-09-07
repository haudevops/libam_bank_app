import 'package:flutter/material.dart';
import 'package:libam_bank_app/cores/cores.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  static const routeName = '/HomeView';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: ResponsiveCore.screenWidth,
        height: ResponsiveCore.screenHeight,
        color: Colors.black26,
      ),
    );
  }
}
