import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Neworkimagecached extends StatelessWidget {
  const Neworkimagecached({super.key, this.index, this.photo});

  final int? index;
  final String? photo;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: photo!,
      fit: BoxFit.cover,
      placeholder: (context, url) =>
          const Center(child: CircularProgressIndicator()),
    );
  }
}
