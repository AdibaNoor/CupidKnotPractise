import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/routes/route_name.dart';
import '../view_model/user_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final _userPreference = Provider.of<UserViewModel>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
              onTap: (){
                _userPreference.remove().then((value){
                  Navigator.pushNamed(context, RouteNames.login);
                });
              },
              child: Text("Logout"))
        ],
      ),
    );

  }
}
