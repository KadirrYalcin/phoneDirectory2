import 'package:flutter/material.dart';
import 'package:phonediretory2/core/service/client/rest_client.dart';

class PersonPhotoCircle extends StatelessWidget {
  const PersonPhotoCircle({
    super.key,
    required this.photoUrl,
    required this.radius,
  });

  final String photoUrl;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.network(
          fit: BoxFit.cover,
          height: radius,
          width: radius,
          servicePhotoUrl + photoUrl),
    );
  }
}
