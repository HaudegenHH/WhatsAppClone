import 'package:flutter/material.dart';
import 'package:whatsapp_clone/screens/home_page.dart';

const primaryColor = Color(0xFF267064);

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        appBarTheme: const AppBarTheme(
          color: primaryColor,
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.teal),
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
