import 'package:flutter/material.dart';
import 'package:hotel_booking_admin_panel/screens/booking_screen.dart';
import 'package:hotel_booking_admin_panel/screens/hotel_screen.dart';
import 'package:hotel_booking_admin_panel/screens/notification_screen.dart';
import 'package:hotel_booking_admin_panel/widgets/side_bar_button.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int index = 0;
  List<Widget> screens = const [
    HotelScreen(),
    BookingScreen(),
    NotificationScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Sidebar
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Container(
              color: Colors.brown.shade900,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40, bottom: 40),
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.amber,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10,
                            spreadRadius: 2,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.person,
                        size: 60,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  SideBarButton(
                    buttonText: "Hotels",
                    onTap: () => setState(() => index = 0),
                  ),
                  const SizedBox(height: 20),
                  SideBarButton(
                    buttonText: "Bookings",
                    onTap: () => setState(() => index = 1),
                  ),
                  const SizedBox(height: 20),
                  SideBarButton(
                    buttonText: "Notifications",
                    onTap: () => setState(() => index = 2),
                  ),
                ],
              ),
            ),
          ),

          // Main content area
          Flexible(
            flex: 4,
            fit: FlexFit.tight,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (widget, animation) =>
                  FadeTransition(opacity: animation, child: widget),
              child: Container(
                key: ValueKey<int>(index),
                color: Colors.white,
                child: screens[index],
              ),
            ),
          )
        ],
      ),
    );
  }
}
