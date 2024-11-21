import 'package:alt_transport/booking/booking_day.dart';
import 'package:alt_transport/booking/providers/booking_provider.dart';
import 'package:alt_transport/widgets/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _BookingPageState();
  }
}

class _BookingPageState extends State<BookingPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
  
      return Consumer<BookingProvider>(
        builder: (context, booking, child) {
          return Scaffold(
            appBar: AppBar(
              actions: const [
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Icon(Icons.book_outlined),
                )
              ],
              title: const Text("Booking"),
            ),
            body: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "This page shows the booking dates for the next 7 business days.",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                Expanded(
                  child: ListView.builder(

                      itemCount: booking.avaliableDays.length,
                      itemBuilder: (context, index) {
                        var date = booking.avaliableDays[index];
                        String formattedDate =
                            DateFormat('dd-MM-yyyy').format(date);
                        String title = DateHandler.getDayFromDate(
                            booking.avaliableDays[index]);
                        //TODO show next 5 days (starting with today)
                        return Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.grey, // Set the border color
                              width: 1.0, // Set the border width
                            ),
                          ),
                          child: ListTile(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> BookingDay(date: date , index:index)));
                            },
                            trailing: const Icon(
                                // color:  Color.fromARGB(
                                //           255,
                                //           3,
                                //           192,
                                //           60,
                                //         ),
                                Icons.arrow_forward_rounded),
                            title: Row(children: [
                              Text(title),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                formattedDate,
                                style: const TextStyle(
                                  fontSize: 12,
                                  // fontStyle: FontStyle.italic
                                ),
                              ),
                            ]),
                          ),
                        );
                      }),
                ),
              ],
            ),
            floatingActionButton: Container(
              width: 150.0, // Set the desired width

              child: FloatingActionButton.extended(
                // backgroundColor:  const Color.fromARGB(
                //                         255,
                //                         3,
                //                         192,
                //                         60,
                //                       ),
                onPressed: () {
                  // Your onPressed code here
                },
                label: const Text(
                  "Next Available Seat",
                  style: TextStyle(color: Colors.black),
                ),
                tooltip: "Next Seat",
              ),
            ),
            bottomNavigationBar: const NavBar(),
          );
        },
      );
  }
}

