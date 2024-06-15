import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_checkup/core/components/custom_alert.dart';
import 'package:medical_checkup/core/components/custom_button.dart';
import 'package:medical_checkup/core/components/spaces.dart';
import 'package:medical_checkup/core/constants/app_color.dart';
import 'package:medical_checkup/core/constants/app_font.dart';
import '../../../core/constants/app_image.dart';
import '../../auth/bloc/logout/logout_bloc.dart';
import '../../auth/bloc/user/user_bloc.dart';
import '../../auth/pages/login_page.dart';
import '../widgets/profile_menu.dart';

class ProfilePetugasPage extends StatelessWidget {
  const ProfilePetugasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: const Text('Profile Petugas'),
        centerTitle: true,
        backgroundColor: AppColor.primary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is UserLoaded) {
                final user = state.user;
                return Container(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Image.asset(
                        width: 80,
                        height: 80,
                        AppImage.icPetugas,
                      ),
                      const SpaceWidth(16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user.name,
                            style: AppFont.blackText.copyWith(
                              fontSize: 18,
                              fontWeight: medium,
                            ),
                          ),
                          Text(
                            user.email,
                            style: AppFont.blackText.copyWith(
                              fontWeight: regular,
                            ),
                          ),
                          Text(
                            user.role.toUpperCase(),
                            style: AppFont.blackText.copyWith(
                              fontWeight: medium,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }
              return Container();
            },
          ),
          const SpaceHeight(20),
          ProfileMenu(
            icon: Icons.person,
            title: 'Edit Profile',
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return CustomAlert(
                    title: 'Edit Profile',
                    message: 'Coming soon...',
                    onPressed: () => Navigator.pop(context),
                  );
                },
              );
            },
          ),
          ProfileMenu(
            icon: Icons.privacy_tip,
            title: 'Privacy & Policy',
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return CustomAlert(
                    title: 'Privacy & Policy',
                    message: 'Coming soon...',
                    onPressed: () => Navigator.pop(context),
                  );
                },
              );
            },
          ),
          ProfileMenu(
            icon: Icons.info,
            title: 'About App',
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return CustomAlert(
                    title: 'About App',
                    message: 'Coming soon...',
                    onPressed: () => Navigator.pop(context),
                  );
                },
              );
            },
          ),
          ProfileMenu(
            icon: Icons.settings,
            title: 'Settings',
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return CustomAlert(
                    title: 'Settings',
                    message: 'Coming soon...',
                    onPressed: () => Navigator.pop(context),
                  );
                },
              );
            },
          ),
          const SpaceHeight(20),
          BlocConsumer<LogoutBloc, LogoutState>(
            listener: (context, state) {
              if (state is LogoutLoaded) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                    (route) => false);
              }

              if (state is LogoutError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            builder: (context, state) {
              return CustomButton(
                onPressed: () {
                  context.read<LogoutBloc>().add(Logout());
                },
                text: 'Logout',
                isLoading: state is LogoutLoading,
              );
            },
          ),
        ],
      ),
    );
  }
}
