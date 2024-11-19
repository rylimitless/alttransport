import 'package:pocketbase/pocketbase.dart';

class PbService {
  final pb = PocketBase('http://127.0.0.1:8090');

  Future<bool> login(String email, String password) async {

    try{
  final authData = await pb.collection('users').authWithPassword(
          email,
          password,
        );
    } catch (e) {
      return false;
      //return false to say it didn't work
      
      print("Email ${email}, ${password}");
      print(e);
    }

    print("Hello");
    print("Password ${pb.authStore.isValid}");
  

    return pb.authStore.isValid;
  }
}
