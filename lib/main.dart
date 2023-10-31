import 'dart:async';
import 'package:flutter/material.dart';
import 'package:imagecroper/screen/profile.dart';
import 'package:imagecroper/theme.dart';

void main() async {

  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ThemeData().colorScheme.copyWith(
          primary: Mytheme().primary,
        ),
        primaryColor:  Mytheme().primary,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<MyHomePage> {

  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 2),
          () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => const Profileedit())),

    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Mytheme().primary,
      body: Container(

        decoration:  BoxDecoration(
          color: Mytheme().primary,
        ),
        child: const Center(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Text('CMRMonster',textAlign:TextAlign.center,style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.w500),),
          ),
        ),
      ),
    );
  }
}