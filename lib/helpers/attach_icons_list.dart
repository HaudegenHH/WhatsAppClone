import 'package:flutter/material.dart';
import 'package:whatsapp_clone/widgets/attachment_icon.dart';

final attachIcons = [
  const AttachmentIcon(
    color: Colors.indigoAccent,
    icon: Icon(Icons.insert_drive_file, color: Colors.white),
    name: "Dokumente",
  ),
  const AttachmentIcon(
    color: Colors.red,
    icon: Icon(Icons.camera_alt, color: Colors.white),
    name: "Kamera",
  ),
  const AttachmentIcon(
    color: Colors.purple,
    icon: Icon(Icons.insert_photo, color: Colors.white),
    name: "Galerie",
  ),
  AttachmentIcon(
    color: Colors.orange.shade400,
    icon: const Icon(Icons.headphones, color: Colors.white),
    name: "Audio",
  ),
  const AttachmentIcon(
    color: Colors.green,
    icon: Icon(Icons.pin_drop, color: Colors.white),
    name: "Location",
  ),
  const AttachmentIcon(
    color: Colors.blue,
    icon: Icon(Icons.person, color: Colors.white),
    name: "Kontakt",
  ),
];
