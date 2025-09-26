import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app_using_api/controller/cart_controller.dart';
import 'package:shopping_app_using_api/controller/details_Screen_controller.dart';
import 'package:shopping_app_using_api/controller/home_screen_controller.dart';
import 'package:shopping_app_using_api/controller/search_screen_controller.dart';
import 'package:shopping_app_using_api/servises/sql_services/sql_services.dart';
import 'package:shopping_app_using_api/view/splash_screen/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SqlServices.initDb();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeScreenController()),
        ChangeNotifierProvider(create: (context) => DetailsScreenController()),
        ChangeNotifierProvider(create: (context) => SearchScreenController()),
        ChangeNotifierProvider(create: (context) => CartController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
