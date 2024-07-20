import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_checkup/core/constants/app_color.dart';
import 'package:medical_checkup/core/constants/app_font.dart';
import 'package:medical_checkup/presentation/petugas/bloc/get_checkup/get_checkup_bloc.dart';
import 'package:medical_checkup/presentation/petugas/widgets/laporan_petugas_card.dart';

class LaporanPetugasPage extends StatelessWidget {
  const LaporanPetugasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: const Text('Laporan Pasien'),
        centerTitle: true,
        backgroundColor: AppColor.primary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          BlocBuilder<GetCheckupBloc, GetCheckupState>(
            builder: (context, state) {
              if (state is GetCheckupLoaded) {
                final data = state.checkup;

                if (data.isEmpty) {
                  return Center(
                    child: Text(
                      'Belum ada data laporan pasien',
                      style: AppFont.blackText.copyWith(
                        fontWeight: light,
                      ),
                    ),
                  );
                }
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final laporan = data[index];
                    return LaporanPetugasCard(laporan: laporan);
                  },
                );
              }
              if (state is GetCheckupError) {
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
