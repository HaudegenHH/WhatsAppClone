import 'package:flutter/material.dart';
import 'package:whatsapp_clone/screens/create_group_page.dart';
import 'package:whatsapp_clone/widgets/contact_card.dart';
import 'package:whatsapp_clone/helpers/contacts_list.dart';
import 'package:whatsapp_clone/widgets/custom_card.dart';

class SelectContactPage extends StatefulWidget {
  const SelectContactPage({super.key});

  @override
  State<SelectContactPage> createState() => _SelectContactPageState();
}

class _SelectContactPageState extends State<SelectContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Kontakt wählen",
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "104 Kontakte",
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
          PopupMenuButton<String>(
            onSelected: (value) {
              print(value);
            },
            itemBuilder: (context) {
              return [
                const PopupMenuItem(
                  value: "Recommend WhatsApp",
                  child: Text("WhatsApp empfehlen"),
                ),
                const PopupMenuItem(
                  value: "Contacts",
                  child: Text("Kontakte"),
                ),
                const PopupMenuItem(
                  value: "Refresh",
                  child: Text("Aktualisieren"),
                ),
                const PopupMenuItem(
                  value: "Help",
                  child: Text("Hilfe"),
                ),
              ];
            },
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: ListView(
        children: [
          ContactCard(
              icon: const Icon(Icons.group, color: Colors.white, size: 30),
              text: "Neue Gruppe",
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const CreateNewGroupPage()));
              }),
          ContactCard(
              icon: const Icon(Icons.person_add, color: Colors.white, size: 30),
              text: "Neuer Kontakt",
              onTap: () {}),
          ContactCard(
              icon: const Icon(Icons.groups, color: Colors.white, size: 30),
              text: "Neue Community",
              onTap: () {}),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Kontakte auf WhatsApp"),
          ),
          buildContactList(contacts),
        ],
      ),
    );
  }

  Widget buildContactList(contacts) {
    return SingleChildScrollView(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index];
          return CustomCard(chat: contact);
        },
      ),
    );
  }
}
