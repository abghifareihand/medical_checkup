import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medical_checkup/core/constants/app_color.dart';
import 'package:medical_checkup/core/constants/app_font.dart';
import 'package:medical_checkup/core/constants/date_time_ext.dart';
import 'package:medical_checkup/data/models/keluhan_model.dart';
import 'package:medical_checkup/presentation/petugas/pages/petugas_detail_page.dart';

class KeluhanPetugasCard extends StatelessWidget {
  final KeluhanModel keluhan;
  const KeluhanPetugasCard({super.key, required this.keluhan});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: keluhan.status == 'diproses'
          ? () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PetugasDetailPage(keluhan: keluhan),
                ),
              );
            }
          : null,
      child: Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color:
                  keluhan.status == 'diproses' ? AppColor.red : AppColor.green,
              width: 1.0, // Lebar border
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
              Divider(
                color: AppColor.grey.withOpacity(0.5),
              ),
              Text(
                'Nama Pasien :',
                style: AppFont.blackText.copyWith(
                  fontWeight: medium,
                ),
              ),
              Text(
                keluhan.namaPasien,
                style: AppFont.blackText.copyWith(
                  fontWeight: light,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Keluhan Pasien :',
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
              if (keluhan.tanggalKembali != null) ...[
                const SizedBox(height: 8),
                Text(
                  'Catatan Petugas :',
                  style: AppFont.blackText.copyWith(
                    fontWeight: medium,
                  ),
                ),
                Text(
                  keluhan.catatanPetugas!,
                  style: AppFont.blackText.copyWith(
                    fontWeight: light,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Tanggal Kembali :',
                  style: AppFont.blackText.copyWith(
                    fontWeight: medium,
                  ),
                ),
                Text(
                  '${keluhan.tanggalKembali!.toFormattedDate()} ${DateFormat.Hm().format(keluhan.tanggalKembali!)}',
                  style: AppFont.blackText.copyWith(
                    fontWeight: light,
                  ),
                ),
              ],
            ],
          )),
    );
  }
}
