import 'package:flutter/material.dart';

class ChatModel {
  final String? name;
  final String? imgUrl;
  final bool? isGroup;
  final String? time;
  final bool? isRead;
  final String? currentMessage;
  final IconData? icon;
  final bool? savedContacts;
  bool selected;

  ChatModel({
    this.name,
    this.imgUrl,
    this.currentMessage,
    this.isRead,
    this.time,
    this.isGroup,
    this.icon,
    this.savedContacts,
    this.selected = false,
  });
}
