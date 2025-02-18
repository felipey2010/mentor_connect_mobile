import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  final String? imageUrl;
  final String name;
  final double? radius;

  const UserAvatar({super.key, this.imageUrl, required this.name, this.radius});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundImage:
          imageUrl == null || imageUrl!.isEmpty ? null : AssetImage(imageUrl!),
      child: imageUrl == null || imageUrl!.isEmpty ? Text(name[0]) : null,
    );
  }
}
