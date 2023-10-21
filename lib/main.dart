import 'package:flutter/material.dart';
import 'package:sehatku/presentation/screens/authentication/authentication_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sehatku',
      initialRoute: AuthenticationScreen.routeName,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case AuthenticationScreen.routeName:
            return MaterialPageRoute(
              builder: (context) => const AuthenticationScreen(),
            );

          default:
            return MaterialPageRoute(
              builder: (context) => const AuthenticationScreen(),
            );
        }
      },
    );
  }
}
