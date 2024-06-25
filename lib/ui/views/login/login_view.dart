import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'login_viewmodel.dart';

class LoginView extends StackedView<LoginViewModel> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
    Widget? child,
  ) {
    return SignInScreen(
      showAuthActionSwitch: true,
      oauthButtonVariant: OAuthButtonVariant.icon_and_text,
      providers: [EmailAuthProvider()],
      actions: [
        AuthStateChangeAction<SignedIn>((context, state) {
          viewModel.fetchAccountAndNavigate();
        }),
      ],
    );
  }

  @override
  LoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginViewModel();
}
