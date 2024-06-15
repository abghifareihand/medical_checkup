import 'package:flutter/material.dart';
import 'package:medical_checkup/core/constants/app_font.dart';
import 'package:medical_checkup/data/models/berita_response_model.dart';
import 'package:medical_checkup/presentation/pasien/widgets/berita_detail.dart';

class BeritaTile extends StatelessWidget {
  final BeritaResponseModel berita;
  const BeritaTile({super.key, required this.berita});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return BeritaDetail(berita: berita);
            },
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.only(bottom: 16),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                berita.imageUrl,
                width: 120,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    berita.judul,
                    style: AppFont.blackText.copyWith(
                      fontSize: 14,
                      fontWeight: medium,
                    ),
                  ),
                  Text(
                    berita.deskripsi,
                    style: AppFont.greyText.copyWith(
                      fontSize: 12,
                      fontWeight: light,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
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
