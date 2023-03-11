import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/chat_model.dart';
import 'package:whatsapp_clone/screens/select_contact_page.dart';
import 'package:whatsapp_clone/widgets/custom_card.dart';

class ChatPage extends StatefulWidget {
  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatModel> chats = [
    ChatModel(
        name: "Familiengruppe",
        imgUrl: "",
        isGroup: true,
        time: "20:34",
        currentMessage: "Hello everyone",
        isRead: true),
    ChatModel(
        name: "Emma",
        imgUrl:
            "https://upload.wikimedia.org/wikipedia/commons/7/7f/Emma_Watson_2013.jpg",
        isGroup: false,
        time: "10:24",
        currentMessage: "Wanne read some books together with me? ",
        isRead: false),
    ChatModel(
        name: "Daniel",
        imgUrl:
            "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a2/Daniel_Radcliffe_SDCC_2014.jpg/800px-Daniel_Radcliffe_SDCC_2014.jpg",
        isGroup: false,
        time: "11:04",
        currentMessage: "Lets ride the broom for a while!?",
        isRead: true),
    ChatModel(
        name: "+49 177 1234567",
        imgUrl: "",
        isGroup: false,
        time: "08:12",
        currentMessage:
            "This is a long example text to show the TextOverflow ellipsis abbreviation!!!",
        isRead: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => SelectContactPage()));
        },
        child: const Icon(Icons.chat),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: ListView.builder(
            itemCount: chats.length,
            itemBuilder: (context, index) {
              final chat = chats[index];
              return CustomCard(chat: chat);
            }),
      ),
    );
  }
}
