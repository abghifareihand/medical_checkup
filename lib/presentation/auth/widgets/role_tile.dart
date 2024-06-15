import 'package:flutter/material.dart';
import 'package:medical_checkup/core/constants/app_color.dart';
import 'package:medical_checkup/core/constants/app_font.dart';
import '../../../../core/components/spaces.dart';

class RoleTile extends StatelessWidget {
  final String selectedRole;
  final String roleName;
  final String roleImage;
  final VoidCallback onTap;

  const RoleTile({
    super.key,
    required this.selectedRole,
    required this.roleName,
    required this.onTap,
    required this.roleImage,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(24.0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(12.0),
          ),
          color: AppColor.white,
          border: roleName == selectedRole
              ? Border.all(
                  color: AppColor.primary,
                  width: 1,
                )
              : Border.all(
                  color: AppColor.lightgrey,
                  width: 1,
                ),
        ),
        child: Row(
          children: [
            Image.asset(
              width: 40,
              height: 40,
              roleImage,
            ),
            const SpaceWidth(8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    roleName.toUpperCase(),
                    style: AppFont.blackText.copyWith(
                      fontWeight: medium,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Register sebagai $roleName',
                    style: AppFont.greyText.copyWith(
                      fontWeight: light,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            const SpaceWidth(12),
            Icon(
              roleName == selectedRole
                  ? Icons.radio_button_checked
                  : Icons.circle_outlined,
              color: roleName == selectedRole
                  ? AppColor.primary
                  : AppColor.lightgrey,
            ),
          ],
        ),
      ),
    );
  }
}
