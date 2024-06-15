import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medical_checkup/core/constants/app_color.dart';
import 'package:medical_checkup/core/constants/app_font.dart';
import 'package:medical_checkup/core/constants/date_time_ext.dart';
import 'package:medical_checkup/data/models/keluhan_model.dart';

class KeluhanCard extends StatelessWidget {
  final KeluhanModel keluhan;
  const KeluhanCard({
    super.key,
    required this.keluhan,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: keluhan.status == 'diproses'
          ? null
          : () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) =>
              //         HistoryPasienDetailPage(keluhan: keluhan),
              //   ),
              // );
            },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: AppColor.grey.withOpacity(0.5),
            width: 1.0, // Lebar border
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Text(
                //   keluhan.tanggalDatang.toFormattedDate(), // Menggunakan DateFormat untuk mengambil jam dan menit dari timestamp
                //   style: AppFont.blackText.copyWith(
                //     fontWeight: medium,
                //   ),
                // ),
                Text(
                  '${keluhan.tanggalDatang.toFormattedDate()} ${DateFormat.Hm().format(keluhan.tanggalDatang)}',
                  style: AppFont.blackText.copyWith(
                    fontWeight: medium,
                  ),
                ),
                Text(
                  keluhan.status.toUpperCase(),
                  style: keluhan.status == 'diproses'
                      ? AppFont.redText.copyWith(
                          fontWeight: medium,
                        )
                      : AppFont.greenText.copyWith(
                          fontWeight: medium,
                        ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Keluhan :',
              style: AppFont.blackText.copyWith(
                fontWeight: medium,
              ),
            ),
            Text(
              keluhan.keluhanPasien,
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
