import 'package:flutter/material.dart';
import 'package:emoji_picker_2/emoji_picker_2.dart';

import 'package:whatsapp_clone/models/chat_model.dart';
import 'package:whatsapp_clone/widgets/attachment_icon.dart';
import 'package:whatsapp_clone/helpers/attach_icons_list.dart';

class SingleChatPage extends StatefulWidget {
  final ChatModel chat;

  const SingleChatPage({Key? key, required this.chat}) : super(key: key);

  @override
  State<SingleChatPage> createState() => _SingleChatPageState();
}

class _SingleChatPageState extends State<SingleChatPage> {
  bool showEmojis = false;
  FocusNode focusNode = FocusNode();
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          showEmojis = false;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: buildAppBar(),
      body: Container(
        width: width,
        height: height,
        child: WillPopScope(
          child: Stack(
            children: [
              // to have a scrollable List for now i take a..
              ListView(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width - 60,
                          child: Card(
                            margin: const EdgeInsets.only(
                                left: 5, right: 5, bottom: 8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: TextFormField(
                              controller: _controller,
                              focusNode: focusNode,
                              textAlignVertical: TextAlignVertical.center,
                              keyboardType: TextInputType.multiline,
                              maxLines: 5,
                              minLines: 1,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Nachricht",
                                prefixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      focusNode.unfocus();
                                      focusNode.canRequestFocus;
                                      showEmojis = !showEmojis;
                                    });
                                  },
                                  icon: const Icon(Icons.emoji_emotions),
                                ),
                                suffixIcon: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        showModalBottomSheet(
                                          backgroundColor: Colors.transparent,
                                          context: context,
                                          builder: (_) {
                                            return attachmentBottomSheet();
                                          },
                                        );
                                      },
                                      icon: const Icon(Icons.attach_file),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.camera_alt),
                                    ),
                                  ],
                                ),
                                contentPadding: const EdgeInsets.only(left: 5),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.teal,
                            child: IconButton(
                              onPressed: () {
                                //print("microphone");
                              },
                              icon: const Icon(Icons.mic,
                                  size: 25, color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                    showEmojis ? selectEmoji() : const SizedBox()
                  ],
                ),
              ),
            ],
          ),
          onWillPop: () {
            if (showEmojis) {
              setState(() {
                showEmojis = false;
              });
            } else {
              Navigator.of(context).pop();
            }
            return Future.value(false);
          },
        ),
      ),
    );
  }

  buildAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(60),
      child: AppBar(
        leadingWidth: 90,
        titleSpacing: 0,
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back,
                size: 20,
              ),
            ),
            widget.chat.isGroup
                ? const ClipOval(
                    child: Material(
                      color: Colors.blueGrey,
                      child: InkWell(
                        child:
                            Icon(Icons.groups, color: Colors.white, size: 30),
                      ),
                    ),
                  )
                : widget.chat.name.startsWith("+")
                    ? const ClipOval(
                        child: Material(
                          color: Colors.blueGrey,
                          child: InkWell(
                            child: Icon(Icons.person,
                                color: Colors.white, size: 30),
                          ),
                        ),
                      )
                    : ClipOval(
                        child: Image.network(
                          widget.chat.imgUrl,
                          width: 35,
                          height: 35,
                          fit: BoxFit.cover,
                        ),
                      ),
          ],
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.chat.name,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 16),
            ),
            const Text(
              "Zuletzt online um 19:23 Uhr",
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.videocam,
              size: 20,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.phone,
              size: 20,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
              size: 20,
            ),
          ),
          const SizedBox(width: 3),
        ],
      ),
    );
  }

  Widget attachmentBottomSheet() {
    return Container(
      height: 280,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: const EdgeInsets.all(20),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(25, 15, 25, 15),
          child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemCount: attachIcons.length,
            itemBuilder: (context, index) {
              return attachIcons[index];
            },
          ),
        ),
      ),
    );
  }

  Widget selectEmoji() {
    return EmojiPicker2(
      rows: 3,
      columns: 7,
      onEmojiSelected: (emoji, category) {
        setState(() {
          _controller.text += emoji.emoji;
        });
      },
    );
  }
}
