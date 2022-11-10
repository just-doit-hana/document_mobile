import 'package:document_appmobile/app.dart';
import 'package:document_appmobile/app/animation/routes_animation.dart';
import 'package:document_appmobile/app/util/util.dart';
import 'package:document_appmobile/app/widget/app_text_field.dart';
import 'package:document_appmobile/app/widget/text_title.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPasswordVisible = true;
  // late AuthBloc _authBloc;

  @override
  Widget build(BuildContext context) {
    AppDimemsions().init(context);
    // _authBloc = context.read<AuthBloc>();
    // final formGroup = _authBloc.formGroup;
    // print('Form Group $formGroup');

    return Material(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: AppDimemsions.screenHeight / 2.88,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(AppDimemsions.screenHeight / 14.4)),
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
                padding: EdgeInsets.all(AppDimemsions.screenHeight / 43.4),
                child: Column(
                  children: [
                    const AppTextField(
                      controlName: 'username',
                      label: "UserName",
                      isRequired: true,
                      isPasswordVisible: false,
                    ),
                    SizedBox(
                      height: AppDimemsions.screenHeight / 43.4,
                    ),
                    AppTextField(
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
              padding: EdgeInsets.all(AppDimemsions.screenHeight / 43.4),
              height: AppDimemsions.screenHeight / 8.67,
              width: double.maxFinite,
              // width: ,
              child: ElevatedButton(
                onPressed: () {
                  // print('value $value');
                  // _authBloc.add(AuthLogin(loginUser: LoginUser.fromMap(value)));
                  Navigator.of(context)
                      .push(CustomRoutesPage(widget: const App()));
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(
                        HexColor.fromHex(AppColor.primaryBtnColor))),
                child: Text(
                  'Login',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: AppConstant.poppinsFont,
                      color: HexColor.fromHex(AppColor.whiteTextColor),
                      fontSize: 16),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
