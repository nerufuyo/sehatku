import 'package:flutter/material.dart';
import 'package:sehatku/presentation/screens/authentication/login_screen.dart';
import 'package:sehatku/presentation/style/typography.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sehatku',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case LoginScreen.routeName:
            return MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            );

          default:
            return MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            );
        }
      },
    );
  }
}
