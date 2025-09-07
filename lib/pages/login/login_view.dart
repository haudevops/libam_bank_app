import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libam_bank_app/cores/cores.dart';
import 'package:libam_bank_app/cores/loading/app_loading.dart';
import 'package:libam_bank_app/generated/l10n.dart';
import 'package:libam_bank_app/utils/constants.dart';
import 'package:libam_bank_app/widgets/widgets.dart';
import 'package:libam_bank_app/pages/pages.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  static const routeName = '/LoginView';

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late LoginBloc bloc;

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  final userNameFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  final userNameKey = GlobalKey<FormFieldState>();
  final passwordKey = GlobalKey<FormFieldState>();

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<LoginBloc>(context);
  }

  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    userNameFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  Future<void> handleStream(BuildContext context, LoginState state) async {
    if (state is LoginLoadingState) {
      if (state.isLoading) {
        AppLoading.show();
      } else {
        AppLoading.hide();
      }
    }

    if (state is LoginValidateState) {
      await SharedPrefs().setString(Constants.TOKEN, state.token);
      
      ToastCore.show(message: S.current.login_success, primaryColor: Colors.green);

      Navigator.pushNamedAndRemoveUntil(
        context,
        NavigationView.routeName,
        (_) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: handleStream,
        builder: (context, state) {
          return Container(
            width: ResponsiveCore.screenWidth,
            height: ResponsiveCore.screenHeight,
            padding: EdgeInsets.symmetric(
              horizontal: ResponsiveCore.w(50),
              vertical: ResponsiveCore.h(80),
            ),
            decoration: BoxDecoration(color: Color(0xFFFFFFFF)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    width: ResponsiveCore.w(150),
                    height: ResponsiveCore.h(200),
                    child: Image.asset(
                      'assets/imgs/icc_wavy_buddies.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: ResponsiveCore.h(30)),
                  BlingTextField(
                    controller: userNameController,
                    focusNode: userNameFocusNode,
                    key: userNameKey,
                    label: S.current.user_name,
                    onSubmitted: (value) {
                      passwordFocusNode.requestFocus();
                    },
                  ),
                  SizedBox(height: ResponsiveCore.h(10)),
                  BlingTextField(
                    controller: passwordController,
                    focusNode: passwordFocusNode,
                    key: passwordKey,
                    label: S.current.password,
                    onSubmitted: (value) {
                      userNameKey.currentState?.validate();
                      passwordKey.currentState?.validate();
                    },
                  ),
                  SizedBox(height: ResponsiveCore.h(50)),
                  SizedBox(
                    width: ResponsiveCore.w(200),
                    height: ResponsiveCore.h(40),

                    child: FilledButton.tonal(
                      onPressed: () {},
                      style: FilledButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            ResponsiveCore.sp(5),
                          ),
                        ),
                        backgroundColor: Color(0xFFF8A442),
                      ),
                      child: Text(
                        S.current.login.toUpperCase(),
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: ResponsiveCore.sp(16),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: ResponsiveCore.h(5)),
                  TextButton(
                    onPressed: () {
                      bloc.add(
                        LoginValidateEvent(
                          userName: userNameController.text,
                          password: passwordController.text,
                        ),
                      );
                    },
                    child: Text(
                      S.current.login_with_guest,
                      style: TextStyle(color: Color(0xFFFF6600)),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
