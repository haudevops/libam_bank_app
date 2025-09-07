import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libam_bank_app/cores/cores.dart';
import 'package:libam_bank_app/generated/l10n.dart';
import 'package:libam_bank_app/pages/pages.dart';

class NavigationView extends StatefulWidget {
  const NavigationView({super.key});

  static const String routeName = '/NavigationView';

  @override
  State<NavigationView> createState() => _NavigationViewState();
}

class _NavigationViewState extends State<NavigationView> {
  late NavigationBloc bloc;
  int selectedIndex = 0;

  @override
  void initState() {
    bloc = BlocProvider.of<NavigationBloc>(context);
    super.initState();
  }

  void _onItemTapped(int index, BuildContext context) {
    setState(() {
      selectedIndex = index;
      // bloc.add(NavigationOnTap(index: index));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: ResponsiveCore.screenHeight,
        width:ResponsiveCore.screenWidth,
        color: Colors.white,
        child: BlocConsumer<NavigationBloc, NavigationState>(
          listener: (context, state) {},
          builder: (context, state) {
            return const HomeView();
          }
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.blueAccent,
        items: [
          BottomNavigationBarItem(
            icon: ShaderMask(
              shaderCallback: (bounds) => LinearGradient(
                colors: [Colors.blueAccent, Colors.blueGrey], // 2 màu
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ).createShader(bounds),
              child: Icon(
                Icons.home,
                size: ResponsiveCore.sp(20),
                color: Colors.white,
              ),
            ),
            label: S.current.home,
          ),
          BottomNavigationBarItem(
            icon: ShaderMask(
              shaderCallback: (bounds) => LinearGradient(
                colors: [Colors.blueAccent, Colors.blueGrey], // 2 màu
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ).createShader(bounds),
              child: Icon(
                Icons.history,
                size: ResponsiveCore.sp(20),
                color: Colors.white, // bắt buộc set màu trắng để gradient hiển thị
              ),
            ),
            label: S.current.history,
          ),
          BottomNavigationBarItem(
            icon: ShaderMask(
              shaderCallback: (bounds) => LinearGradient(
                colors: [Colors.blueAccent, Colors.blueGrey], // 2 màu
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ).createShader(bounds),
              child: Icon(
                Icons.wallet_giftcard_sharp,
                size: ResponsiveCore.sp(20),
                color: Colors.white, // bắt buộc set màu trắng để gradient hiển thị
              ),
            ),
            label: S.current.gift,
          ),
          BottomNavigationBarItem(
            icon: ShaderMask(
              shaderCallback: (bounds) => LinearGradient(
                colors: [Colors.blueAccent, Colors.blueGrey], // 2 màu
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ).createShader(bounds),
              child: Icon(
                Icons.person,
                size: ResponsiveCore.sp(20),
                color: Colors.white, // bắt buộc set màu trắng để gradient hiển thị
              ),
            ),
            label: S.current.account,
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.blueAccent,
        onTap: (index) {
          _onItemTapped(index, context);
        },
      ),
    );
  }

  Widget initPage({int? indexPage}) {
    switch (indexPage) {
      case 0:
        return const HomeView();
      case 1:
        return const HomeView();
      case 2:
        return const HomeView();
      case 3:
        return const HomeView();
      default:
        return const HomeView();
    }
  }
}
