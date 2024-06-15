import 'package:flutter/material.dart';
import 'package:medical_checkup/core/components/spaces.dart';
import 'package:medical_checkup/core/constants/app_color.dart';
import 'package:medical_checkup/core/constants/app_font.dart';

class ProfileMenu extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  const ProfileMenu({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                Icon(icon),
                const SpaceWidth(16.0),
                Text(
                  title,
                  style: AppFont.blackText.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 16,
                ),
              ],
            ),
          ),
        ),
        Divider(
          color: AppColor.grey.withOpacity(0.5),
        ),
      ],
    );
  }
}
