import 'package:flutter/material.dart';

import '../view_model/services/user_view_service.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  SplashServices  _splashService = SplashServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _splashService.checkAuthentication(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffbefe3),
      body: Center(
          child: Text('CupidKnot',
          style: TextStyle(color: Colors.red, fontSize: 40, fontWeight: FontWeight.bold),)),
    );
  }
}
