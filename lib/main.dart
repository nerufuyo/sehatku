import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:sehatku/presentation/bloc/product/product_bloc.dart';
import 'package:sehatku/presentation/bloc/user/user_bloc.dart';
import 'package:sehatku/presentation/screens/authentication/authentication_screen.dart';
import 'package:sehatku/presentation/screens/home/home_screen.dart';
import 'package:sehatku/injection.dart' as di;
import 'package:sehatku/presentation/screens/profile/profile_screen.dart';

void main() {
  runApp(const MyApp());
  di.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(create: (context) => di.locator<ProductBloc>()),
        BlocProvider(create: (context) => di.locator<UserBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Sehatku',
        initialRoute: AuthenticationScreen.routeName,
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case AuthenticationScreen.routeName:
              return MaterialPageRoute(
                builder: (context) => const AuthenticationScreen(),
              );
            case HomeScreen.routeName:
              return MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              );
            case ProfileScreen.routeName:
              return MaterialPageRoute(
                builder: (context) => const ProfileScreen(),
              );

            default:
              return MaterialPageRoute(
                builder: (context) => const AuthenticationScreen(),
              );
          }
        },
      ),
    );
  }
}
