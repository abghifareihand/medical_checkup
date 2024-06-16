import 'package:flutter/material.dart';
import 'package:medical_checkup/core/components/spaces.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCheckup extends StatelessWidget {
  const ShimmerCheckup({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 180,
            height: 14,
            color: Colors.white,
          ),
          const SpaceHeight(4),
          Container(
            width: 100,
            height: 14,
            color: Colors.white,
          ),
          const SpaceHeight(8),
          Container(
            width: 180,
            height: 14,
            color: Colors.white,
          ),
          const SpaceHeight(4),
          Container(
            width: 100,
            height: 14,
            color: Colors.white,
          ),
          const SpaceHeight(8),
          Container(
            width: 180,
            height: 14,
            color: Colors.white,
          ),
          const SpaceHeight(4),
          Container(
            width: 100,
            height: 14,
            color: Colors.white,
          ),
          const SpaceHeight(8),
          Container(
            width: 180,
            height: 14,
            color: Colors.white,
          ),
          const SpaceHeight(4),
          Container(
            width: 100,
            height: 14,
            color: Colors.white,
          ),
          const SpaceHeight(8),
          Container(
            width: 180,
            height: 14,
            color: Colors.white,
          ),
          const SpaceHeight(4),
          Container(
            width: 100,
            height: 14,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
