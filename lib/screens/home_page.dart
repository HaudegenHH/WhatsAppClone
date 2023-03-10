import 'package:flutter/material.dart';
import 'package:whatsapp_clone/screens/chat_page.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: TabBarView(
        physics: const BouncingScrollPhysics(),
        controller: _controller,
        children: [
          Text("Gruppen Chat"),
          ChatPage(),
          Text("Status"),
          Text("Anrufe"),
        ],
      ),
    );
  }

  buildAppBar() {
    return AppBar(
      title: const Text("WhatApp Clone"),
      actions: [
        IconButton(icon: const Icon(Icons.search), onPressed: () {}),
        const SizedBox(width: 15),
        PopupMenuButton<String>(
            onSelected: (value) {
              print(value);
            },
            itemBuilder: (context) {
              return [
                const PopupMenuItem(
                    value: "new group", child: Text("Neue Gruppe")),
                const PopupMenuItem(
                    value: "new bc", child: Text("Neuer Broadcast")),
                const PopupMenuItem(
                    value: "connected devices",
                    child: Text("Verknüpfte Geräte")),
                const PopupMenuItem(
                    value: "marked with star",
                    child: Text("Mit Stern markiert")),
                const PopupMenuItem(
                    value: "settings", child: Text("Einstellungen")),
              ];
            },
            icon: const Icon(Icons.more_vert)),
        const SizedBox(width: 15),
      ],
      bottom: TabBar(
          controller: _controller,
          indicatorColor: Colors.white,
          tabs: const [
            Tab(
              icon: Icon(Icons.groups),
            ),
            Tab(
              text: "Chat",
            ),
            Tab(
              text: "Status",
            ),
            Tab(
              text: "Anrufe",
            ),
          ]),
    );
  }
}
