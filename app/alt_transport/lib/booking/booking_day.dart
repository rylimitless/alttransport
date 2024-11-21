import 'package:alt_transport/booking/providers/booking_provider.dart';
import 'package:alt_transport/widgets/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:provider/provider.dart';


class BookingDay extends StatefulWidget{

  final DateTime date;
  final int index;

  const BookingDay({required this.date , required this.index, super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return _BookingDayState();
    
  }
}

class _BookingDayState extends State<BookingDay>{


  @override
  void initState() {
    // TODO: implement initState

    Provider.of<BookingProvider>(context, listen: false).list(widget.index);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
        return Consumer<BookingProvider>(
          builder: (context , booking , child){
            return DefaultTabController(
              length: 2,
              initialIndex: 0,
              child: Scaffold(
                appBar: AppBar(
                  title: Text(DateHandler.getDayFromDate(widget.date))
                  ,
                  bottom: const TabBar(tabs: 
                    [
                      Tab(
                        text: 'UWI',
                      ),
                      Tab(
                        text: 'UTECH',
                      ),
                    ]
                  ),
                ),
              
                body: const TabBarView(children: [

                    UWI(),
                    UTECH()

                ]),
              
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
              ),
            );
          }
        );
      }
      
  }


class UTECH extends StatelessWidget {
  const UTECH({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          const Text("Departures",
            style: TextStyle(
              fontWeight: FontWeight.w600
            ),
          ),
          const SizedBox(height: 10,),
            ExpansionTile(
              maintainState: true,

              initiallyExpanded: true,

            title:  Text('Departures ${context.watch<BookingProvider>().results.totalItems}'),
            // subtitle: const Text('R'),
            // trailing: Icon(
            //   _customTileExpanded
            //       ? Icons.arrow_drop_down_circle
            //       : Icons.arrow_drop_down,
            // ),
            children:  <Widget>[
              Container(
                height: MediaQuery.sizeOf(context).height * 0.4,
      
              child: ListView.builder(
                itemCount: context.watch<BookingProvider>().utech.length,
                itemBuilder: (context , index){
                print(context.watch<BookingProvider>().utech);
                  RecordModel item = context.read<BookingProvider>().uwi[index];
                  return ListTile(
                    leading:const  Icon(Icons.departure_board_outlined),
                    isThreeLine: true,
                    title: Text(item.getStringValue('arrival_location')),
                    subtitle: Text(item.getStringValue('departure_time')),
                  );

                }

              ),

              //TODO listview.builder with all today dates. 
              
      
              ),
            ],
            // onExpansionChanged: (bool expanded) {
            //   setState(() {
            //     _customTileExpanded = expanded;
            //   });
            // },
          ),
           Padding(
             padding: const EdgeInsets.only(top: 10),
             child: Text("Arrivals",
              style: TextStyle(
                fontWeight: FontWeight.w600
              ),
              ),
           ),
      
        
        ],),
      ),
    );
  }
}

class UWI extends StatelessWidget {
  const UWI({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          const Text("Departures",
            style: TextStyle(
              fontWeight: FontWeight.w600
            ),
          ),
          const SizedBox(height: 10,),
            ExpansionTile(
              maintainState: true,

              initiallyExpanded: true,

            title:  Text('Departures ${context.watch<BookingProvider>().results.totalItems}'),
            // subtitle: const Text('R'),
            // trailing: Icon(
            //   _customTileExpanded
            //       ? Icons.arrow_drop_down_circle
            //       : Icons.arrow_drop_down,
            // ),
            children:  <Widget>[
              Container(
                height: MediaQuery.sizeOf(context).height * 0.4,
      
              child: ListView.builder(
                itemCount: context.watch<BookingProvider>().uwi.length,
                itemBuilder: (context , index){
                print(context.watch<BookingProvider>().uwi);
                  RecordModel item = context.watch<BookingProvider>().uwi[index];
                  return ListTile(
                    leading:const  Icon(Icons.departure_board_outlined),
                    isThreeLine: true,
                    title: Text(item.getStringValue('arrival_location')),
                    subtitle: Text(item.getStringValue('departure_time')),
                  );

                }

              ),

              //TODO listview.builder with all today dates. 
              
      
              ),
            ],
            // onExpansionChanged: (bool expanded) {
            //   setState(() {
            //     _customTileExpanded = expanded;
            //   });
            // },
          ),
           Padding(
             padding: const EdgeInsets.only(top: 10),
             child: Text("Arrivals",
              style: TextStyle(
                fontWeight: FontWeight.w600
              ),
              ),
           ),
      
        
        ],),
      ),
    );
  }
}

