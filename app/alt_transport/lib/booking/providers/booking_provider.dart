import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


enum Days {
  saturday , sunday
    
}


class DateHandler {

  late DateTime date;


  DateHandler({required this.date});

  
  static String getDayFromDate(DateTime date) {
      Map<int , String>  days  = {
    1 : 'Mon',
    2: 'Tues',
    3 : 'Wed',
    4 : 'Thurs',
    5 : 'Fri',
  };


    int day = date.weekday;
    
    
    return "${days[day]} ";

     

  }
  
}


class BookingProvider extends ChangeNotifier{





  List<DateTime> avaliableDays = []; 

  BookingProvider(){
    getDate();
    print(avaliableDays);
    notifyListeners();
  }

  void getDate(){
    DateTime today = DateTime.now();
    while(avaliableDays.length < 5){
      if(today.weekday != DateTime.saturday && today.weekday!= DateTime.sunday){
        avaliableDays.add(today);
        print(today.weekday);
      }
      today = today.add(const Duration(days: 1));
    }
  }
}