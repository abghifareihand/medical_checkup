import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_checkup/core/components/spaces.dart';
import 'package:medical_checkup/core/constants/app_color.dart';
import 'package:medical_checkup/core/constants/app_font.dart';
import 'package:medical_checkup/presentation/auth/bloc/user/user_bloc.dart';
import 'package:medical_checkup/presentation/pasien/bloc/get_keluhan_pasien/get_keluhan_pasien_bloc.dart';
import 'package:medical_checkup/presentation/pasien/pages/form_keluhan_page.dart';
import 'package:medical_checkup/presentation/pasien/widgets/keluhan_pasien_card.dart';

import '../../../core/constants/app_image.dart';

class KeluhanPasienPage extends StatelessWidget {
  const KeluhanPasienPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: const Text('Keluhan Pasien'),
        centerTitle: true,
        backgroundColor: AppColor.primary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          /// Card to Keluhan
          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is UserLoaded) {
                final user = state.user;
                return Container(
                  padding: const EdgeInsets.all(20),
                  height: 150,
                  decoration: BoxDecoration(
                    color: AppColor.primary.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Apa keluhan\nanda ${user.name} ?',
                            style: AppFont.whiteText.copyWith(
                              fontSize: 16,
                              fontWeight: semiBold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColor.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      FormKeluhanPage(user: user),
                                ),
                              );
                            },
                            child: Text(
                              'Klik disini',
                              style: AppFont.blackText.copyWith(
                                fontWeight: medium,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Image.asset(
                        AppImage.doctor,
                      ),
                    ],
                  ),
                );
              }
              return Container();
            },
          ),
          const SpaceHeight(20),

          /// Get Keluhan Pasien
          BlocBuilder<GetKeluhanPasienBloc, GetKeluhanPasienState>(
            builder: (context, state) {
              if (state is GetKeluhanPasienLoaded) {
                final data = state.keluhan;

                if (data.isEmpty) {
                  return Center(
                    child: Text(
                      'Belum ada riwayat keluhan',
                      style: AppFont.blackText.copyWith(
                        fontSize: 16,
                        fontWeight: medium,
                      ),
                    ),
                  );
                }
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final keluhan = data[index];
                    return KeluhanPasienCard(keluhan: keluhan);
                  },
                );
              }
              if (state is GetKeluhanPasienError) {
                return Center(
                  child: Text(state.message),
                );
              }

              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ],
      ),
    );
  }
}
