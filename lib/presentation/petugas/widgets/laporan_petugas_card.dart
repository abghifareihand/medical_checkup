import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medical_checkup/core/constants/app_color.dart';
import 'package:medical_checkup/core/constants/app_font.dart';
import 'package:medical_checkup/core/constants/date_time_ext.dart';
import 'package:medical_checkup/data/models/checkup_model.dart';
import 'package:medical_checkup/presentation/petugas/pages/detail_laporan_page.dart';

class LaporanPetugasCard extends StatelessWidget {
  final CheckupModel laporan;
  const LaporanPetugasCard({super.key, required this.laporan});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailLaporanPage(laporan: laporan),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: AppColor.grey,
            width: 1.0,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nama Pasien :',
              style: AppFont.blackText.copyWith(
                fontWeight: medium,
              ),
            ),
            Text(
              laporan.nama,
              style: AppFont.blackText.copyWith(
                fontWeight: light,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'No. RM :',
              style: AppFont.blackText.copyWith(
                fontWeight: medium,
              ),
            ),
            Text(
              laporan.rekamMedis,
              style: AppFont.blackText.copyWith(
                fontWeight: light,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
