import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import 'package:stc_health_test/constants/styles.dart';
import 'package:flutter_svg/svg.dart';

import '../products/product_vu.dart';
import '../widgets/buttons.dart';
import 'login_vm.dart';

class LoginViewScreen extends StackedView<LoginViewModel> {
  const LoginViewScreen({super.key});
  @override
  Widget builder(
      BuildContext context, LoginViewModel viewModel, Widget? child) {
    return Scaffold(
      body: Column(
        children: [
          upperContent(),
          lowerContent(viewModel, context),
        ],
      ),
    );
  }

  @override
  LoginViewModel viewModelBuilder(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: StcHealthStyles.primaryColor));
    return LoginViewModel();
  }
}

Widget upperContent() {
  return Flexible(
    flex: 1,
    child: Container(
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        const Color(0xff188095),
        StcHealthStyles.primaryColor,
      ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
      child: Stack(children: [
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'STC',
                  style: StcHealthStyles.displaylargeStyle,
                ),
                Text(
                  'HEALTH',
                  style: StcHealthStyles.displaylargeStyle,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: 36,
          right: 0,
          bottom: 25,
          child: Text(
            'Log In',
            style: StcHealthStyles.displaylargeStyle.copyWith(
                fontFamily: 'SF Pro Display',
                fontWeight: FontWeight.w700,
                fontSize: 34),
          ),
        ),
      ]),
    ),
  );
}

Widget lowerContent(LoginViewModel viewModel, BuildContext context) {
  return Flexible(
    flex: 1,
    child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 45),
        child: Form(
          key: viewModel.formKey,
          child: Column(
            children: [
              TextFormField(
                  cursorColor: Colors.grey,
                  onSaved: viewModel.onUserNameSaved,
                  validator: viewModel.usernameValidator,
                  decoration: InputDecoration(
                      labelText: 'UserName',
                      suffixIcon:
                          SvgPicture.asset('assets/images/email_suffix.svg'),
                      labelStyle: const TextStyle(color: Colors.grey),
                      enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)))),
              const SizedBox(height: 24),
              TextFormField(
                  cursorColor: Colors.grey,
                  obscureText: viewModel.obsecureText,
                  keyboardType: TextInputType.visiblePassword,
                  onSaved: viewModel.onPasswordSaved,
                  validator: viewModel.passwordValidator,
                  decoration: InputDecoration(
                      labelText: 'Password',
                      suffixIcon: GestureDetector(
                        onTap: () => viewModel.onObsecure(),
                        child: SvgPicture.asset(
                            'assets/images/password_suffix.svg'),
                      ),
                      labelStyle: const TextStyle(color: Colors.grey),
                      enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)))),
              const SizedBox(height: 24),
              viewModel.isBusy
                  ? const CircularProgressIndicator()
                  : STCHealthButton(
                      onTap: () {
                        viewModel.login().then((value) {
                          if (value) {
                            viewModel.showSnackbar(context, 'Login Successful');
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ProductListViewScreen()));
                          } else {
                            viewModel.showSnackbar(
                                context, viewModel.responseMessage);
                          }
                        });
                      },
                      height: 74,
                      btnLabel: 'Submit',
                    ),
              const SizedBox(height: 36),
              const Text(
                'NEED HELP?',
                style: TextStyle(
                    fontFamily: 'SF Pro Text',
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff000000)),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
