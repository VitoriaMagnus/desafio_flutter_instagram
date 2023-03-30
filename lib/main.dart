import 'package:desafio_flutter/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Desafio Instagram',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: const ColorScheme(
            brightness: Brightness.light,
            primary: Colors.black,
            onPrimary: Colors.white,
            secondary: Colors.white,
            onSecondary: Colors.white,
            error: Colors.red,
            onError: Colors.red,
            background: Colors.black,
            onBackground: Colors.black,
            surface: Colors.black,
            onSurface: Colors.black,
          ),
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          appBarTheme: const AppBarTheme(
            color: Colors.black,
          ),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Colors.black,
            selectedIconTheme: IconThemeData(
              color: Colors.white,
            ),
            unselectedIconTheme: IconThemeData(
              color: Colors.white,
            ),
          ),
        ),
        routes: {
          '/': (context) => const HomePage(),
        });
  }
}
