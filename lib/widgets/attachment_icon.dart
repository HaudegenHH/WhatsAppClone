import 'package:flutter/material.dart';

class AttachmentIcon extends StatelessWidget {
  final Color color;
  final Icon icon;
  final String name;

  const AttachmentIcon({
    Key? key,
    required this.color,
    required this.icon,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 26,
          backgroundColor: color,
          child: icon,
        ),
        const SizedBox(height: 5),
        Text(name),
      ],
    );
  }
}
