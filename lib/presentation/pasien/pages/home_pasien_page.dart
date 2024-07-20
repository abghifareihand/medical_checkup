import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_checkup/core/components/spaces.dart';
import 'package:medical_checkup/core/constants/app_font.dart';
import 'package:medical_checkup/core/constants/app_color.dart';
import 'package:medical_checkup/core/constants/date_time_ext.dart';
import 'package:medical_checkup/data/models/berita_response_model.dart';
import 'package:medical_checkup/presentation/auth/bloc/user/user_bloc.dart';
import 'package:medical_checkup/presentation/pasien/bloc/get_checkup_pasien/get_checkup_pasien_bloc.dart';
import 'package:medical_checkup/presentation/pasien/pages/reminder_pasien_page.dart';
import 'package:medical_checkup/presentation/pasien/widgets/berita_tile.dart';
import 'package:medical_checkup/presentation/pasien/widgets/shimmer_checkup.dart';
import 'package:medical_checkup/presentation/pasien/widgets/shimmer_user.dart';

class HomePasienPage extends StatelessWidget {
  const HomePasienPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          /// User Card
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BlocBuilder<UserBloc, UserState>(
                  builder: (context, state) {
                    if (state is UserLoaded) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Selamat Datang',
                            style: AppFont.blackText.copyWith(
                              fontSize: 14,
                              fontWeight: regular,
                            ),
                          ),
                          Text(
                            state.user.name,
                            style: AppFont.blackText.copyWith(
                              fontSize: 14,
                              fontWeight: semiBold,
                            ),
                          ),
                        ],
                      );
                    }

                    if (state is UserLoading) {
                      return const ShimmerUser();
                    }

                    if (state is UserError) {
                      return Center(
                        child: Text(state.message),
                      );
                    }

                    return const ShimmerUser();
                  },
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ReminderPasienPage(),
                      ),
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.notifications,
                    ),
                  ),
                ),
              ],
            ),
          ),

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
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'No. RM',
                      style: AppFont.blackText.copyWith(
                        fontWeight: semiBold,
                      ),
                    ),
                    Text(
                      data.rekamMedis,
                      style: AppFont.blackText.copyWith(
                        fontWeight: regular,
                      ),
                    ),
                    const SpaceHeight(8),
                    Text(
                      'Tanggal Kedatangan',
                      style: AppFont.blackText.copyWith(
                        fontWeight: semiBold,
                      ),
                    ),
                    Text(
                      data.tanggalDatang.toFormattedDate(),
                      style: AppFont.blackText.copyWith(
                        fontWeight: regular,
                      ),
                    ),
                    const SpaceHeight(8),
                    Text(
                      'Tahap Pengobatan',
                      style: AppFont.blackText.copyWith(
                        fontWeight: semiBold,
                      ),
                    ),
                    Text(
                      '${data.tahapPengobatan} kali',
                      style: AppFont.blackText.copyWith(
                        fontWeight: regular,
                      ),
                    ),
                    const SpaceHeight(8),
                    Text(
                      'Jenis Obat',
                      style: AppFont.blackText.copyWith(
                        fontWeight: semiBold,
                      ),
                    ),
                    Text(
                      data.jenisObat,
                      style: AppFont.blackText.copyWith(
                        fontWeight: regular,
                      ),
                    ),
                    const SpaceHeight(8),
                    Text(
                      'Tanggal Harus Kembali',
                      style: AppFont.blackText.copyWith(
                        fontWeight: semiBold,
                      ),
                    ),
                    Text(
                      data.tanggalKembali.toFormattedDate(),
                      style: AppFont.blackText.copyWith(
                        fontWeight: regular,
                      ),
                    ),
                    const SpaceHeight(8),
                    Text(
                      'Catatan',
                      style: AppFont.blackText.copyWith(
                        fontWeight: semiBold,
                      ),
                    ),
                    Text(
                      data.catatan,
                      style: AppFont.blackText.copyWith(
                        fontWeight: regular,
                      ),
                    ),
                  ],
                );
              }

              if (state is GetCheckupPasienLoading) {
                return const ShimmerCheckup();
              }

              if (state is GetCheckupPasienError) {
                return Center(
                  child: Text(state.message),
                );
              }

              return const ShimmerCheckup();
            },
          ),

          /// Top doctor
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Berita Terkini',
                  style: AppFont.blackText.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  itemCount: dummyBeritaList.length,
                  itemBuilder: (context, index) {
                    return BeritaTile(
                      berita: dummyBeritaList[index],
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
