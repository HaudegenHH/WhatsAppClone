import 'package:flutter/material.dart';
import 'package:whatsapp_clone/helpers/contacts_list.dart';
import 'package:whatsapp_clone/widgets/contact_group_card.dart';
import 'package:whatsapp_clone/widgets/custom_card.dart';

class CreateNewGroupPage extends StatefulWidget {
  const CreateNewGroupPage({super.key});

  @override
  State<CreateNewGroupPage> createState() => _CreateNewGroupPageState();
}

class _CreateNewGroupPageState extends State<CreateNewGroupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Neue Gruppe",
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Mitglieder hinzufügen",
              style: TextStyle(
                fontSize: 13,
                color: Colors.white70,
              ),
            )
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index];
          return InkWell(
            onTap: () {
              setState(() {
                contact.selected = !contact.selected;
              });
            },
            child: ContactGroupCard(contact: contact),
          );
        },
      ),
    );
  }
}
