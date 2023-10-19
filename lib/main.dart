import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:realestate/firebase_options.dart';



import 'Login_Page.dart';
import 'Registration_Screen.dart';
import 'Home_Screen.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),

    );

    }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  void initState() {
    // TODO: implement initState
    Timer(
        Duration(milliseconds: 3000), () =>
    FirebaseAuth.instance.currentUser!= null? Navigator.pushReplacement(
        context, 
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        )
    )
        : Navigator.pushReplacement(
        context, 
        MaterialPageRoute(builder: (context)=> LoginPage(),)
    )
    );
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text("Wellcome to RealEstate Agency", style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w800,
          color: Colors.white
        ),),
      ),
    );
  }
}


