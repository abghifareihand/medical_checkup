import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_checkup/core/constants/app_color.dart';
import 'package:medical_checkup/presentation/petugas/bloc/get_pasien/get_pasien_bloc.dart';
import 'package:medical_checkup/presentation/petugas/widgets/pasien_card.dart';

import '../../../core/constants/app_font.dart';

class HomePetugasPage extends StatelessWidget {
  const HomePetugasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: const Text('Data Pasien'),
        centerTitle: true,
        backgroundColor: AppColor.primary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          BlocBuilder<GetPasienBloc, GetPasienState>(
            builder: (context, state) {
              if (state is GetPasienLoaded) {
                final data = state.pasien;

                if (data.isEmpty) {
                  return Center(
                    child: Text(
                      'Belum ada data pasien',
                      style: AppFont.blackText.copyWith(
                        fontWeight: light,
                      ),
                    ),
                  );
                }
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final pasien = data[index];
                    return PasienCard(pasien: pasien);
                  },
                );
              }
              if (state is GetPasienError) {
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
