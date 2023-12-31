import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:inext_assignment/Pages/Loginpage.dart';
import 'package:inext_assignment/Pages/SplashScreen.dart';
import 'package:provider/provider.dart';

import 'Pages/HomePage.dart';
import 'Provider/authprovider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
        ChangeNotifierProvider(create: (_) =>  Authprovider()),
      ],
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    ),

    );
  }
}

