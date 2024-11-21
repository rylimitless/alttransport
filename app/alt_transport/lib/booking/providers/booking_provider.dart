import 'package:alt_transport/services/pocketbase/pb_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:pocketbase/pocketbase.dart';


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

  late ResultList<RecordModel>  results;
  var uwi = [];
  var utech = [];
  // late ResultList<RecordModel> utech;


  BookingProvider(){
    getDate();
    print(avaliableDays);
    //Call the function to get the list of availbale dates? 
    notifyListeners();
  }

  void getDate(){
    DateTime today = DateTime.now();
    while(avaliableDays.length < 7){
      if(today.weekday != DateTime.saturday && today.weekday!= DateTime.sunday){
        avaliableDays.add(today);
        print(today.weekday);
      }
      today = today.add(const Duration(days: 1));
    }
  }

  void sortIntoSchools(){

      uwi.clear();
      utech.clear();
      if(results.totalItems > 0){
        for(var item in results.items){
          if(item.getStringValue('departure_location') == "UWI"){
            uwi.add(item);
          }else {
            print("utech");
            utech.add(item);
          }
        }
      }

      notifyListeners();
  }

  Future<void> list(index) async{
    print("The index is ${index}");
    final service = GetIt.I.get<PbService>();
    results = await service.listAvailableBookings(avaliableDays[index]);
    notifyListeners();
    sortIntoSchools();
  }
}