import 'package:document_mobile/src/bussiness/auth/bloc/auth_bloc.dart';
import 'package:document_mobile/src/data/model/login/login_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app.dart';
import '../../../app/animation/routes_animation.dart';
import '../../../app/util/util.dart';
import '../../../app/widget/widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPasswordVisible = true;
  // late AuthBloc _authBloc;
  final _userController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    AppDimemsions().init(context);
    // _authBloc = context.read<AuthBloc>();
    // final formGroup = _authBloc.formGroup;
    // print('Form Group $formGroup');

    return BlocProvider(
      create: (context) =>
          AuthBloc(loginRepository: RepositoryProvider.of(context))
            ..add(const AuthLoginEvent()),
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthErrorState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          }
          // if (state is AuthLoginState) {
          //   Navigator.of(context).push(CustomRoutesPage(widget: const App()));
          // }
        },
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return Material(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: AppDimemsions.screenHeight / 2.88,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              AppDimemsions.screenHeight / 14.4)),
                      child: Image.asset(
                        "${AppImage.path}/${AppImage.documentLogo}",
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: AppDimemsions.screenHeight / 28.8,
                    ),
                    const TextTitle(title: 'Document Management'),
                    SizedBox(
                      height: AppDimemsions.screenHeight / 43.4,
                    ),
                    Container(
                        padding:
                            EdgeInsets.all(AppDimemsions.screenHeight / 43.4),
                        child: Column(
                          children: [
                            AppTextField(
                              controller: _userController,
                              controlName: 'username',
                              label: "UserName",
                              isRequired: true,
                              isPasswordVisible: false,
                            ),
                            SizedBox(
                              height: AppDimemsions.screenHeight / 43.4,
                            ),
                            AppTextField(
                              controller: _passwordController,
                              controlName: 'password',
                              label: "Password",
                              onTap: () {
                                setState(() {
                                  isPasswordVisible = !isPasswordVisible;
                                });
                              },
                              isPasswordVisible: isPasswordVisible,
                              isRequired: true,
                            ),
                          ],
                        )),
                    SizedBox(height: AppDimemsions.screenHeight / 43.4),
                    Container(
                      // color: Colors.red,
                      padding:
                          EdgeInsets.all(AppDimemsions.screenHeight / 43.4),
                      height: AppDimemsions.screenHeight / 8.67,
                      width: double.maxFinite,
                      // width: ,
                      child: ElevatedButton(
                        onPressed: () {
                          LoginUser loginUser = LoginUser(
                              username: _userController.text,
                              password: _passwordController.text);

                          // context
                          //     .read<AuthBloc>()
                          //     .add(AuthLoginEvent(loginUser: loginUser));

                          // if (state is AuthLoginEvent) {
                          Navigator.of(context)
                              .push(CustomRoutesPage(widget: const App()));
                          // } else if (state is AuthInitialState) {
                          //   ScaffoldMessenger.of(context).showSnackBar(
                          //       const SnackBar(
                          //           content: Text(
                          //               'Login Failure, Please check username and password')));
                          // }
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll<Color>(
                                HexColor.fromHex(AppColor.primaryBtnColor))),
                        child: state is AuthInitialState
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Center(
                                      child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      SizedBox(
                                        height: 25.0,
                                        width: 25.0,
                                        child: CupertinoActivityIndicator(),
                                      )
                                    ],
                                  ))
                                ],
                              )
                            : Text(
                                'Login',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: AppConstant.poppinsFont,
                                    color: HexColor.fromHex(
                                        AppColor.whiteTextColor),
                                    fontSize: 16),
                              ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
