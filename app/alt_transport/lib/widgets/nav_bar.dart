import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.book_outlined), label: "Booking"),

          BottomNavigationBarItem(
              icon: Icon(Icons.airplane_ticket_outlined),
              label: "Tickets"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined), label: "Account"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined), label: "Setting"),
        ]);
  }
}