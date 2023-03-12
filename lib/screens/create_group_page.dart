import 'package:flutter/material.dart';
import 'package:whatsapp_clone/helpers/contacts_list.dart';
import 'package:whatsapp_clone/models/chat_model.dart';
import 'package:whatsapp_clone/widgets/contact_group_card.dart';

class CreateNewGroupPage extends StatefulWidget {
  const CreateNewGroupPage({super.key});

  @override
  State<CreateNewGroupPage> createState() => _CreateNewGroupPageState();
}

class _CreateNewGroupPageState extends State<CreateNewGroupPage> {
  List<ChatModel> group = [];

  void addToGroup(contact) {
    setState(() {
      contact.selected = true;
      group.add(contact);
    });
  }

  void removeFromGroup(contact) {
    setState(() {
      contact.selected = false;
      group.remove(contact);
    });
  }

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
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.only(top: 75),
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: contacts.length,
                  itemBuilder: (context, index) {
                    final contact = contacts[index];
                    return InkWell(
                      onTap: () {
                        if (contact.selected == false) {
                          addToGroup(contact);
                        } else {
                          removeFromGroup(contact);
                        }
                      },
                      child: ContactGroupCard(contact: contact),
                    );
                  }),
            ),
          ),

          group.isNotEmpty
              ? Container(
                  height: 75,
                  width: double.infinity,
                  color: Colors.white,
                  padding: const EdgeInsets.only(top: 10, left: 14),
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: group.length,
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 10,
                    ),
                    itemBuilder: (context, index) {
                      final contact = group[index];
                      return contact.imgUrl != null &&
                              contact.imgUrl!.isNotEmpty
                          ? Column(
                              children: [
                                Stack(
                                  children: [
                                    ClipOval(
                                      child: Image.network(
                                        contact.imgUrl!,
                                        width: 48,
                                        height: 48,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: InkWell(
                                        onTap: () => removeFromGroup(contact),
                                        child: const CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 12,
                                          child: Icon(Icons.cancel,
                                              color: Colors.grey),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(contact.name!),
                              ],
                            )
                          : Column(
                              children: [
                                Stack(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.blueGrey.shade300,
                                      radius: 23,
                                      child: const Icon(Icons.person,
                                          color: Colors.white),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: InkWell(
                                        onTap: () => removeFromGroup(contact),
                                        child: const CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 12,
                                          child: Icon(Icons.cancel,
                                              color: Colors.grey),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 1),
                                Text(
                                  contact.name!,
                                  style: const TextStyle(fontSize: 15),
                                ),
                              ],
                            );
                    },
                  ),
                )
              : Container(height: 75, color: Colors.white), // SizedBox
        ],
      ),
    );
  }
}
