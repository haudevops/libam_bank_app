import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libam_bank_app/pages/pages.dart';

class AppBlocs {
  static MultiBlocProvider providers({required Widget child}) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (_) => LoginBloc(),
        ),
        BlocProvider<HomeBloc>(
          create: (_) => HomeBloc(),
        ),
        BlocProvider<NavigationBloc>(
          create: (_) => NavigationBloc(),
        ),
        BlocProvider<HistoryBloc>(
          create: (_) => HistoryBloc(),
        ),
        BlocProvider<UtilitiesBloc>(
          create: (_) => UtilitiesBloc(),
        ),
      ],
      child: child,
    );
  }
}
