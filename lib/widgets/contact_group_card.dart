import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/chat_model.dart';

class ContactGroupCard extends StatelessWidget {
  final ChatModel contact;

  const ContactGroupCard({Key? key, required this.contact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 53,
        width: 50,
        child: Stack(
          children: [
            contact.imgUrl != null && contact.imgUrl!.isNotEmpty
                ? ClipOval(
                    child: Image.network(
                      contact.imgUrl!,
                      width: 48,
                      height: 48,
                      fit: BoxFit.cover,
                    ),
                  )
                : CircleAvatar(
                    backgroundColor: Colors.blueGrey.shade300,
                    radius: 23,
                    child: const Icon(Icons.person, color: Colors.white),
                  ),
            contact.selected
                ? const Positioned(
                    bottom: 4,
                    right: 5,
                    child: CircleAvatar(
                      backgroundColor: Colors.teal,
                      radius: 11,
                      child: Icon(Icons.check, color: Colors.white),
                    ),
                  )
                : Container()
          ],
        ),
      ),
      title: Text(
        contact.name!,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Text(
          contact.currentMessage!,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
