import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/chat_model.dart';
import 'package:whatsapp_clone/screens/single_chat_page.dart';

class CustomCard extends StatelessWidget {
  final ChatModel chat;

  const CustomCard({required this.chat});

  @override
  Widget build(BuildContext context) {
    return chat.savedContacts == null
        ? InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SingleChatPage(chat: chat)));
            },
            child: ListTile(
              leading: chat.isGroup != null && chat.isGroup == true
                  ? const ClipOval(
                      child: Material(
                        color: Colors.blueGrey,
                        child: InkWell(
                          child:
                              Icon(Icons.groups, color: Colors.white, size: 47),
                        ),
                      ),
                    )
                  : chat.name != null && chat.name!.startsWith("+")
                      ? const ClipOval(
                          child: Material(
                            color: Colors.blueGrey,
                            child: InkWell(
                              child: Icon(Icons.person,
                                  color: Colors.white, size: 47),
                            ),
                          ),
                        )
                      : ClipOval(
                          child: Image.network(
                            chat.imgUrl!,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
              title: Text(
                chat.name!,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Row(
                  children: [
                    chat.isRead != null && chat.isRead == true
                        ? Container(
                            margin: const EdgeInsets.only(right: 5),
                            child: const Icon(Icons.done_all))
                        : const SizedBox(),
                    Expanded(
                      child: Text(
                        chat.currentMessage!,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              trailing: Text(chat.time!),
            ),
          )
        : InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SingleChatPage(chat: chat)));
            },
            child: ListTile(
              leading: chat.isGroup != null
                  ? const ClipOval(
                      child: Material(
                        color: Colors.blueGrey,
                        child: InkWell(
                          child:
                              Icon(Icons.groups, color: Colors.white, size: 45),
                        ),
                      ),
                    )
                  : chat.name != null && chat.name!.startsWith("+")
                      ? const ClipOval(
                          child: Material(
                            color: Colors.blueGrey,
                            child: InkWell(
                              child: Icon(Icons.person,
                                  color: Colors.white, size: 45),
                            ),
                          ),
                        )
                      : chat.imgUrl!.isNotEmpty
                          ? ClipOval(
                              child: Image.network(
                                chat.imgUrl!,
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              ),
                            )
                          : const ClipOval(
                              child: Material(
                                color: Colors.blueGrey,
                                child: InkWell(
                                  child: Icon(Icons.person,
                                      color: Colors.white, size: 45),
                                ),
                              ),
                            ),
              title: Text(
                chat.name!,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  chat.currentMessage!,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          );
  }
}
