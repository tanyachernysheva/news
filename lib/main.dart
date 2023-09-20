import 'package:flutter/material.dart';
import 'package:news/screens/notifications_screen/notifications_screen.dart';
import 'package:news/shared/theme_config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeConfig.themeData,
      home: const NotificationsScreen(),
    );
  }
}
