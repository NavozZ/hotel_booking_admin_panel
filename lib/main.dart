import 'package:flutter/material.dart';
import 'package:hotel_booking_admin_panel/main_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hotel Booking System Admin Panel',
      home: const MainLayout(),
    );
  }
}
