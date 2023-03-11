import 'package:whatsapp_clone/models/chat_model.dart';

List<ChatModel> contacts = [
  ChatModel(
    name: "Anna",
    imgUrl: "",
    isGroup: true,
    currentMessage: "Who am i to diss a brie?",
    savedContacts: true,
    selected: true,
  ),
  ChatModel(
    name: "Emma",
    imgUrl:
        "https://upload.wikimedia.org/wikipedia/commons/7/7f/Emma_Watson_2013.jpg",
    currentMessage: "Love will make your day",
    savedContacts: true,
  ),
  ChatModel(
    name: "Daniel",
    imgUrl:
        "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a2/Daniel_Radcliffe_SDCC_2014.jpg/800px-Daniel_Radcliffe_SDCC_2014.jpg",
    currentMessage: "Hello, i m using WhatsApp",
    savedContacts: true,
    selected: true,
  ),
  ChatModel(
      name: "Emil",
      imgUrl: "",
      currentMessage: "Never eat yellow snow!",
      savedContacts: true),
];
