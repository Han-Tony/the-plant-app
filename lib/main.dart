import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'ui/onboarding_screen.dart';

void main (){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Onboarding Screen',
      home: OnboardingScreen(),    
    );
  }
}