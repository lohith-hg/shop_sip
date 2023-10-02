import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../constants/colors.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_progress_dialog.dart';
import '../../authentication/bloc/authentication_bloc.dart';
import '../../authentication/bloc/authentication_event.dart';
import '../../authentication/bloc/authentication_state.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthenticatedState) {
          return const Text('Authenticated');
        } else {
          return Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 40),
            child: CustomButton(
              backgroundColor: kRed,
              borderColor: kRed,
              textColor: primaryColor,
              name: 'Logout',
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return const CustomProgressDialog();
                  },
                );
                final authBloc = BlocProvider.of<AuthBloc>(context);
                authBloc.add(SignOutEvent());
              },
            ),
          );
        }
      },
    );
  }
}
