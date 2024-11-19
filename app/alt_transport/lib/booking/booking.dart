import 'package:flutter/material.dart';


class BookingPage extends StatefulWidget{

  const BookingPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _BookingPageState();
  }
}

class _BookingPageState extends State<BookingPage>{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Icon(Icons.book)
        ],
        title: const Text("Booking"),
      ),

    body: ListView.builder(
      itemCount: 5,
      itemBuilder: (context , index ){
          return ListTile(
          title: Text("Hello World"),
        );
      }
    
    ),
   floatingActionButton: Container(
  width: 200.0, // Set the desired width
  child: FloatingActionButton.extended(
    onPressed: () {
      // Your onPressed code here
    },
    label: const Text("Next Available Seat"),
    tooltip: "Next Seat",
  ),
),

    bottomNavigationBar: BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined),
        label: "Home"
        ),
        BottomNavigationBarItem(icon: Icon(Icons.airplane_ticket_outlined),
        label: "Tickets"
        ),
        BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined),
        label: "Account"
        ),
        BottomNavigationBarItem(icon: Icon(Icons.settings_outlined),
        label: "Setting"
        ),
      ]),
    );
  }

}