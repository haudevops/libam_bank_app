import 'package:flutter/material.dart';
import 'package:libam_bank_app/cores/responsive/responsive.dart';

class HistoryView extends StatefulWidget {
  const HistoryView({super.key});

  static const routeName = "/HistoryView";

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
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
