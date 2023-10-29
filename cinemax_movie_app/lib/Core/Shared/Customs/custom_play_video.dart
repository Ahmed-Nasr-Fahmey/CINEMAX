import 'package:cinemax_movie_app/Core/Services/API/cinemax_api.dart';
import 'package:flutter/material.dart';

class CustomPlayVideo extends StatelessWidget {
  const CustomPlayVideo({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
      child: Image.network(
        '${API.imageBaseUrl}$imageUrl',
        width: 100,
        height: 80,
        fit: BoxFit.cover,
      ),
    );
  }
}
