import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_intro_slider/screen/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'utils/intro_slider.dart';

bool? isViewed;

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isViewed = prefs.getBool('isFirstTime');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: isViewed != true ? IntroSliderPage() : HomePage(),
    );
  }
}
