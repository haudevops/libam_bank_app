import 'package:flutter/material.dart';
import 'package:libam_bank_app/cores/responsive/responsive.dart';
import 'package:libam_bank_app/generated/l10n.dart';

class SettingView extends StatefulWidget {
  const SettingView({super.key});

  static const routeName = '/SettingView';

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: ResponsiveCore.screenWidth,
        height: ResponsiveCore.screenHeight,
        padding: EdgeInsets.symmetric(horizontal: ResponsiveCore.sp(10), vertical: ResponsiveCore.sp(80)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              cardWidget(text: S.current.info_account),
              cardWidget(text: S.current.logout),
            ],
          ),
        ),
      ),
    );
  }

  Widget cardWidget({String? text}) {
    return Card(
      color: Colors.white,
      elevation: 1,
      child: Container(
        width: ResponsiveCore.screenWidth,
        height: ResponsiveCore.sp(50),
        padding: EdgeInsets.symmetric(horizontal: ResponsiveCore.sp(10)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.account_balance, color: Colors.amber),
            SizedBox(width: ResponsiveCore.sp(10)),
            Text(
              (text ?? '').toUpperCase(),
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
