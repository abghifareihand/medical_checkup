import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medical_checkup/core/components/custom_button.dart';
import 'package:medical_checkup/core/constants/app_color.dart';
import 'package:medical_checkup/core/constants/app_font.dart';
import 'package:medical_checkup/core/constants/date_time_ext.dart';
import 'package:medical_checkup/data/models/keluhan_model.dart';

class KeluhanPasienDetailPage extends StatelessWidget {
  final KeluhanModel keluhan;
  const KeluhanPasienDetailPage({super.key, required this.keluhan});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        elevation: 0,
        title: const Text('Detail Keluhan'),
        centerTitle: true,
        backgroundColor: AppColor.primary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          HistoryTile(
            label: 'Tanggal Kedatangan',
            title:
                '${keluhan.tanggalDatang.toFormattedDate()} ${DateFormat.Hm().format(keluhan.tanggalDatang)}', // Menggunakan DateFormat untuk mengambil jam dan menit dari timestamp,
          ),
          HistoryTile(
            label: 'Tanggal Harus Kembali',
            title:
                '${keluhan.tanggalKembali!.toFormattedDate()} ${DateFormat.Hm().format(keluhan.tanggalKembali!)}', // Menggunakan DateFormat untuk mengambil jam dan menit dari timestamp ,
          ),
          HistoryTile(
            label: 'Catatan Petugas',
            title: keluhan.catatanPetugas ?? '',
          ),
          HistoryTile(
            label: 'Status',
            title: keluhan.status,
          ),
          const SizedBox(height: 30),
          CustomButton(
            onPressed: () {
              Navigator.pop(context);
            },
            text: 'Kembali',
          ),
        ],
      ),
    );
  }
}

class HistoryTile extends StatelessWidget {
  final String label;
  final String title;
  const HistoryTile({
    super.key,
    required this.label,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: AppFont.blackText.copyWith(
              fontSize: 14,
              fontWeight: semiBold,
            ),
          ),
          Text(
            title,
            style: AppFont.blackText.copyWith(
              fontSize: 14,
              fontWeight: regular,
            ),
          ),
          const Divider(
            color: AppColor.grey,
          ),
        ],
      ),
    );
  }
}
