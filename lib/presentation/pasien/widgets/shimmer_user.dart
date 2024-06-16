import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerUser extends StatelessWidget {
  const ShimmerUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 150,
            height: 14,
            color: Colors.white,
          ),
          const SizedBox(height: 4),
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
