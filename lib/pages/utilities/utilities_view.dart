import 'package:flutter/material.dart';
import 'package:libam_bank_app/cores/cores.dart';

class UtilitiesView extends StatefulWidget {
  const UtilitiesView({super.key});

  static const routeName = "/UtilitiesView";

  @override
  State<UtilitiesView> createState() => _UtilitiesViewState();
}

class _UtilitiesViewState extends State<UtilitiesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: ResponsiveCore.screenWidth,
        height: ResponsiveCore.screenHeight,
      ),
    );
  }
}
