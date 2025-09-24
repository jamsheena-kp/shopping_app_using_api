import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app_using_api/controller/home_screen_controller.dart';
import 'package:shopping_app_using_api/view/splash_screen/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeScreenController())
      ],
      child: MaterialApp(debugShowCheckedModeBanner: false, home: SplashScreen()));
  }
}
