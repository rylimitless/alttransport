import 'package:pocketbase/pocketbase.dart';

class PbService {
  final pb = PocketBase('http://127.0.0.1:8090');

  Future<bool> login(String email, String password) async {
    try {
      final authData = await pb.collection('users').authWithPassword(
            email,
            password,
          );
    } catch (e) {
      return false;
    }

    return pb.authStore.isValid;
  }

  Future<ResultList<RecordModel>> listAvailableBookings(DateTime day) async {
    print(day);
    var date = "${day.year}-${day.month}-${day.day}";
    print(date);
    final resultList = await pb.collection('bookings').getList(
          page: 1,
          perPage: 50,
          filter: 'date = "$date"',
        );
    
    print(resultList.totalItems);
    return resultList;
  }
}
