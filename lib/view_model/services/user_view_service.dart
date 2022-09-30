import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../../model/user_model.dart';
import '../../utils/routes/route_name.dart';
import '../user_view_model.dart';

class SplashServices{

  Future<UserModel> getUserData() => UserViewModel().getUser();

  void checkAuthentication(BuildContext context)async{
    getUserData().then((value) async {
      print(value.token.toString());
      if (value.token == 'null' || value.token == ''){
        await Future.delayed(Duration(seconds: 3));
        Navigator.pushNamed(context, RouteNames.login);
      }else{
        await Future.delayed(Duration(seconds: 3));
        Navigator.pushNamed(context, RouteNames.home);
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
