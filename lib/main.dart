import 'package:app_santander/views/comprovante.dart';
import 'package:app_santander/views/pix_1.dart';
import 'package:flutter/material.dart';
import 'views/splash_screen.dart';

main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}