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
      backgroundColor: Colors.white,
      body: Container(
        width: ResponsiveCore.screenWidth,
        height: ResponsiveCore.screenHeight,
        child: CustomScrollView(
          slivers: [
            const SliverAppBar(
              pinned: true,
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                title: Text("Custom Sliver Demo"),
                background: FlutterLogo(),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => ListTile(title: Text("Item $index")),
                childCount: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
