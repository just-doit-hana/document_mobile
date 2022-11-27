import 'package:document_mobile/src/bussiness/folder/bloc/folder_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:document_mobile/src/bussiness/auth/bloc/auth_bloc.dart';
import 'package:document_mobile/src/data/model/login/login_user.dart';

import '../../../app.dart';
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
  final _userController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _passwordController.dispose();
    _userController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppDimemsions().init(context);

    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: ((context) =>
                  AuthBloc(loginRepository: RepositoryProvider.of(context))
                    ..add(const AuthLoginEvent()))),
          BlocProvider(
              create: ((context) => FolderBloc(RepositoryProvider.of(context))
                ..add(LoadFolderPublicEvent())))
        ],
        child: BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
          if (state is AuthenticationAuthenticated) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => const App()));
          }
          if (state is AuthErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                dismissDirection: DismissDirection.up,
                content: Text('UserName and Password Is Not Correct')));
          }
        }, builder: (context, state) {
          if (state is AuthenticationNotAuthenticated) {
            var scaffold = Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Form(
                      key: _formKey,
                      child: Container(
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
                      padding:
                          EdgeInsets.all(AppDimemsions.screenHeight / 43.4),
                      height: AppDimemsions.screenHeight / 8.67,
                      width: double.maxFinite,
                      child: ElevatedButton(
                          onPressed: () {
                            LoginUser loginUser = LoginUser(
                                username: _userController.text,
                                password: _passwordController.text);
                            if (_formKey.currentState!.validate()) {
                              context
                                  .read<AuthBloc>()
                                  .add(AuthLoginEvent(loginUser: loginUser));
                            }
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                  HexColor.fromHex(AppColor.primaryBtnColor))),
                          child: state is AuthenticationLoading
                              ? (const CircularProgressIndicator())
                              : (Text(
                                  'Login',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: AppConstant.poppinsFont,
                                      color: HexColor.fromHex(
                                          AppColor.whiteTextColor),
                                      fontSize: 16),
                                ))),
                    )
                  ],
                ),
              ),
            );
            return scaffold;
          }
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Container(
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
                    padding: EdgeInsets.all(AppDimemsions.screenHeight / 43.4),
                    height: AppDimemsions.screenHeight / 8.67,
                    width: double.maxFinite,
                    child: ElevatedButton(
                        onPressed: () {
                          LoginUser loginUser = LoginUser(
                              username: _userController.text,
                              password: _passwordController.text);
                          if (_formKey.currentState!.validate()) {
                            context
                                .read<AuthBloc>()
                                .add(AuthLoginEvent(loginUser: loginUser));
                          }
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll<Color>(
                                HexColor.fromHex(AppColor.primaryBtnColor))),
                        child: state is AuthenticationLoading
                            ? (const CircularProgressIndicator())
                            : (Text(
                                'Login',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: AppConstant.poppinsFont,
                                    color: HexColor.fromHex(
                                        AppColor.whiteTextColor),
                                    fontSize: 16),
                              ))),
                  )
                ],
              ),
            ),
          );
        }));
  }

  // );
}

  // void _authenticateWithEmailAndPassword(context, LoginUser loginUser) {
  //   if (_formKey.currentState!.validate()) {
  //     BlocProvider.of<AuthBloc(RepositoryProvider.of(context))>(context)..add(
  //       AuthLoginEvent(loginUser: loginUser),
  //     );
  //     // BlocProvider(create: ((context) => AuthBloc(loginRepository:RepositoryProvider.of(context) )))
  //   }
  // }

