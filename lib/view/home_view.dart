import 'package:curved_navigation_bar/curved_navigation_bar.dart';
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
      backgroundColor: Color(0xfffbefe3),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
           children: [
             InkWell(
                 onTap: (){
                   _userPreference.remove().then((value){
                     Navigator.pushNamed(context, RouteNames.login);
                   });
                 },
                 child: Text("Logout",
                   style: TextStyle(color: Colors.black87),)),
           ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        items: [
          Icon(Icons.contacts_outlined, size: 35,color: Colors.red,),
          Icon(Icons.add,size: 35,color: Colors.red),
          Icon(Icons.person, size: 35 ,color: Colors.red),
        ],
        backgroundColor: Color(0xfffbefe3),
        color: Colors.amber,
        animationDuration: Duration(milliseconds: 300),
      ),
    );

  }
}
