import 'package:flutter/material.dart';
import 'package:medical_checkup/core/components/custom_button.dart';
import 'package:medical_checkup/core/components/spaces.dart';
import 'package:medical_checkup/core/constants/app_color.dart';
import 'package:medical_checkup/core/constants/app_font.dart';
import 'package:medical_checkup/core/constants/app_image.dart';
import 'package:medical_checkup/presentation/auth/pages/register_page.dart';
import 'package:medical_checkup/presentation/auth/widgets/role_tile.dart';

class RegisterRolePage extends StatefulWidget {
  const RegisterRolePage({
    super.key,
  });

  @override
  State<RegisterRolePage> createState() => _RegisterRolePageState();
}

class _RegisterRolePageState extends State<RegisterRolePage> {
  String _selectedRole = 'pasien';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const SizedBox(height: 40),
          Text(
            'Select Role',
            style: AppFont.blackText.copyWith(
              fontSize: 20,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(height: 30),
          RoleTile(
            roleImage: AppImage.icPasien,
            selectedRole: _selectedRole,
            roleName: 'pasien',
            onTap: () {
              setState(() {
                _selectedRole = 'pasien';
              });
            },
          ),
          const SizedBox(height: 16),
          RoleTile(
            roleImage: AppImage.icPetugas,
            selectedRole: _selectedRole,
            roleName: 'petugas',
            onTap: () {
              setState(() {
                _selectedRole = 'petugas';
              });
            },
          ),
          const SizedBox(height: 30),
          CustomButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RegisterPage(
                    role: _selectedRole,
                  ),
                ),
              );
            },
            text: 'Continue',
          ),
          const SpaceHeight(20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Already have an account? ',
                style: AppFont.blackText.copyWith(),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Login',
                  style: AppFont.primaryText.copyWith(
                    fontWeight: medium,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
