import 'package:flutter/material.dart';
import 'package:medical_checkup/core/constants/app_font.dart';

import '../../../core/constants/app_color.dart';

class CustomTextTile extends StatelessWidget {
  final String label;
  final String text;
  const CustomTextTile({super.key, required this.label, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: AppFont.blackText.copyWith(
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(height: 8.0),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              vertical: 14.0,
              horizontal: 12.0,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColor.white,
              border: Border.all(
                color: AppColor.grey,
                width: 1.0,
              ),
            ),
            child: Text(
              text,
              style: AppFont.blackText.copyWith(
                fontSize: 14,
                fontWeight: medium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
