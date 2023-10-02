import 'package:flutter/material.dart';
import 'package:shop_sip/features/profile/widgets/profile_header.dart';
import '../../../constants/colors.dart';
import '../models/user.dart';
import 'logout_button.dart';
import 'user_detail_field.dart';

class ProfilePage extends StatelessWidget {
  final AppUser user;

  const ProfilePage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileHeader(user: user),
              const SizedBox(height: 160),
              UserDetailField(fieldName: "Name", fieldValue: user.name!),
              UserDetailField(fieldName: "Email Id", fieldValue: user.email!),
              const LogoutButton(),
            ],
          ),
        ),
      ),
    );
  }
}