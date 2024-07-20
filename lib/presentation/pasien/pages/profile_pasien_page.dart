import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_checkup/core/components/custom_button.dart';
import 'package:medical_checkup/core/components/spaces.dart';
import 'package:medical_checkup/core/constants/app_color.dart';
import 'package:medical_checkup/core/constants/app_font.dart';
import 'package:medical_checkup/core/constants/date_time_ext.dart';
import 'package:medical_checkup/presentation/auth/bloc/user/user_bloc.dart';
import 'package:medical_checkup/presentation/pasien/bloc/get_checkup_pasien/get_checkup_pasien_bloc.dart';
import '../../../core/constants/app_image.dart';
import '../../auth/bloc/logout/logout_bloc.dart';
import '../../auth/pages/login_page.dart';

class ProfilePasienPage extends StatelessWidget {
  const ProfilePasienPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: const Text('Profile Pasien'),
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
                        AppImage.icPasien,
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

          /// Get Data Pasien
          BlocBuilder<GetCheckupPasienBloc, GetCheckupPasienState>(
            builder: (context, state) {
              if (state is GetCheckupPasienLoaded) {
                if (state.checkup.isEmpty) {
                  return Center(
                    child: Text(
                      'Belum ada data pasien',
                      style: AppFont.blackText.copyWith(
                        fontWeight: medium,
                      ),
                    ),
                  );
                }

                final data = state.checkup.first;
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Alamat',
                        style: AppFont.blackText.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                      Text(
                        data.alamat,
                        style: AppFont.blackText.copyWith(
                          fontWeight: regular,
                        ),
                      ),
                      const SpaceHeight(8),
                      Text(
                        'Umur',
                        style: AppFont.blackText.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                      Text(
                        '${formatDecimal(data.umur)} tahun',
                        style: AppFont.blackText.copyWith(
                          fontWeight: regular,
                        ),
                      ),
                      const SpaceHeight(8),
                      Text(
                        'Tinggi Badan',
                        style: AppFont.blackText.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                      Text(
                        '${formatDecimal(data.tinggiBadan)} cm',
                        style: AppFont.blackText.copyWith(
                          fontWeight: regular,
                        ),
                      ),
                      const SpaceHeight(8),
                      Text(
                        'Berat Badan',
                        style: AppFont.blackText.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                      Text(
                        '${formatDecimal(data.beratBadan)} kg',
                        style: AppFont.blackText.copyWith(
                          fontWeight: regular,
                        ),
                      ),
                      const SpaceHeight(8),
                      Text(
                        'Status Kawin',
                        style: AppFont.blackText.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                      Text(
                        data.statusKawin,
                        style: AppFont.blackText.copyWith(
                          fontWeight: regular,
                        ),
                      ),
                      const SpaceHeight(8),
                      Text(
                        'Jenis Kelamin',
                        style: AppFont.blackText.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                      Text(
                        data.jenisKelamin,
                        style: AppFont.blackText.copyWith(
                          fontWeight: regular,
                        ),
                      ),
                    ],
                  ),
                );
              }

              if (state is GetCheckupPasienError) {
                return Center(
                  child: Text(state.message),
                );
              }

              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),

          const SpaceHeight(20),

          /// Logout
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
