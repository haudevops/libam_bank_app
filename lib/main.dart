import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:libam_bank_app/cores/loading/app_loading.dart';
import 'package:libam_bank_app/generated/l10n.dart';
import 'package:libam_bank_app/routes/route_settings.dart';
import 'package:toastification/toastification.dart';
import 'pages/app_bloc/app_bloc.dart';
import 'pages/pages.dart';

import 'cores/cores.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefs.init();
  ToastCore.init(navigatorKey);
  AppLoading.init(navigatorKey);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    ResponsiveCore.init(context);
  }

  @override
  Widget build(BuildContext context) {
    ResponsiveCore.init(context);

    return AppBlocs.providers(
      child: ToastificationWrapper(
        child: MaterialApp(
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          ),
          supportedLocales: S.delegate.supportedLocales,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          locale: const Locale('vi'),
          onGenerateRoute: CustomRouter.allRoutes,
          home: LoginView(),
        ),
      ),
    );
  }
}
