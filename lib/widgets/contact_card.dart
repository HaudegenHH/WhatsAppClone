import 'package:flutter/material.dart';

class ContactCard extends StatelessWidget {
  final Icon icon;
  final String text;
  final Function onTap;

  const ContactCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.teal,
          radius: 23,
          child: icon,
        ),
        title: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
