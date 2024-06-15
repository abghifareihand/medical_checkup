import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_checkup/core/constants/app_color.dart';
import 'package:medical_checkup/core/constants/app_font.dart';
import 'package:medical_checkup/presentation/petugas/bloc/get_keluhan/get_keluhan_bloc.dart';

import '../widgets/keluhan_petugas_card.dart';

class RiwayatPetugasPage extends StatelessWidget {
  const RiwayatPetugasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: const Text('Riwayat Keluhan Pasien'),
        centerTitle: true,
        backgroundColor: AppColor.primary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          BlocBuilder<GetKeluhanBloc, GetKeluhanState>(
            builder: (context, state) {
              if (state is GetKeluhanLoaded) {
                final data = state.keluhan;

                if (data.isEmpty) {
                  return Center(
                    child: Text(
                      'Belum ada data keluhan pasien',
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
                    final keluhan = data[index];
                    return KeluhanPetugasCard(keluhan: keluhan);
                  },
                );
              }
              if (state is GetKeluhanError) {
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
