import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  final String? imageUrl;
  final String name;

  const UserAvatar({super.key, this.imageUrl, required this.name});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage:
          imageUrl == null || imageUrl!.isEmpty ? null : AssetImage(imageUrl!),
      child: imageUrl == null || imageUrl!.isEmpty ? Text(name[0]) : null,
    );
  }
}
