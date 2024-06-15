import 'package:flutter/material.dart';
import 'package:medical_checkup/data/models/user_response_model.dart';
import 'package:medical_checkup/presentation/petugas/pages/form_pasien_page.dart';

import '../../../core/components/spaces.dart';
import '../../../core/constants/app_color.dart';
import '../../../core/constants/app_font.dart';
import '../../../core/constants/app_image.dart';

class PasienCard extends StatelessWidget {
  final UserResponseModel pasien;
  const PasienCard({
    super.key,
    required this.pasien,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FormPasienPage(pasien: pasien),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: AppColor.lightgrey,
            width: 1.0,
          ),
        ),
        child: Row(
          children: [
            Image.asset(
              width: 40,
              height: 40,
              AppImage.icPasien,
            ),
            const SpaceWidth(8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pasien.email,
                    style: AppFont.blackText.copyWith(
                      fontWeight: medium,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    pasien.role.toUpperCase(),
                    style: AppFont.blackText.copyWith(
                      fontWeight: regular,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
