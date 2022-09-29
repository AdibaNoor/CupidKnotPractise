import 'package:cupid_knot_practise/utils/routes/route.dart';
import 'package:cupid_knot_practise/utils/routes/route_name.dart';
import 'package:cupid_knot_practise/view/home_view.dart';
import 'package:cupid_knot_practise/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(systemNavigationBarColor: Colors.transparent,
        statusBarColor: Colors.transparent));
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> AuthViewModel()),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteNames.login,
      onGenerateRoute: Routes.generateRoute,
    ),);
  }
}

