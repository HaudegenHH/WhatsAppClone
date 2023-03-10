class ChatModel {
  final String name;
  final String imgUrl;
  final bool isGroup;
  final String time;
  final bool isRead;
  final String currentMessage;

  ChatModel(
      {required this.name,
      required this.imgUrl,
      required this.isGroup,
      required this.currentMessage,
      required this.isRead,
      required this.time});
}
