import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../constants/colors.dart';
import '../../../constants/styles.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_progress_dialog.dart';
import '../bloc/authentication_bloc.dart';
import '../bloc/authentication_event.dart';
import '../bloc/authentication_state.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: Scaffold(
        backgroundColor: secondaryColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 2.5,
              width: MediaQuery.of(context).size.height / 1.2,
              child: Image.asset(
                "assets/Images/auth_img.png",
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40, bottom: 22),
              child: Text(
                'Sign in with',
                style: bodyTextStyle.copyWith(color: primaryColor),
              ),
            ),
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                if (state is UnauthenticatedState) {
                  return const Text('UnauthenticatedState');
                } else {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: CustomButton(
                      backgroundColor: primaryColor,
                      borderColor: primaryColor,
                      width: double.infinity,
                      textColor: kBlack,
                      name: "Google",
                      iconPath: "assets/Images/google.png",
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return const CustomProgressDialog();
                          },
                        );
                        final authBloc = BlocProvider.of<AuthBloc>(context);
                        authBloc.add(SignInWithGoogleEvent());
                      },
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
