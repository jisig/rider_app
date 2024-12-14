import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rider_app/pages/auth/login.dart';
import 'package:rider_app/pages/splash_screen/screen.dart';
import 'package:rider_app/themes/provider.dart';

void main() {
  // final dio = Dio();
  // final apiService = ApiService();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: SplashScreen(),
    );
  }
}
