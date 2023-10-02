import 'package:flutter/material.dart';
import '../../../constants/colors.dart';
import '../../../router.dart';
import '../models/user.dart';

class ProfileHeader extends StatelessWidget {
  final AppUser user;

  const ProfileHeader({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2.8,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12),
        ),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 20,
            left: 12,
            child: InkWell(
              onTap: () {
                router.pop();
              },
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: Icon(
                    Icons.arrow_back,
                    color: kBlack,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -135,
            left: MediaQuery.of(context).size.width / 6,
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SizedBox(
                  height: 270,
                  width: 270,
                  child: Image.network(
                    user.imageUrl!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
