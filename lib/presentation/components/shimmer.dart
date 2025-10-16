import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerPosterDetail extends StatelessWidget {
  const ShimmerPosterDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Image.network(
        'https://media.istockphoto.com/id/1147544807/vector/thumbnail-image-vector-graphic.jpg?s=612x612&w=0&k=20&c=rnCKVbdxqkjlcs3xH87-9gocETqpspHFXu5dIGB4wuM=',
        width: double.infinity,
        height: 390,
        fit: BoxFit.cover,
      ),
    );
  }
}
