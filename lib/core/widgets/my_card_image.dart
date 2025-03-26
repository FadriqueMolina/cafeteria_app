import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MyCardImage extends StatelessWidget {
  final String imageUrl;
  const MyCardImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: 60,
      height: 60,
      fit: BoxFit.cover,
      placeholder: (context, url) => CircularProgressIndicator(),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
