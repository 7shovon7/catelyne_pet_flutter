import 'package:catelyne_pet_flutter/ui/common/theme/color_schemes.g.dart';
import 'package:catelyne_pet_flutter/ui/common/ui_constants.dart';
import 'package:catelyne_pet_flutter/ui/pages/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Catelyne Store',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: lightColorScheme,
        primaryColor: UiConstants.primaryColor,
        useMaterial3: true,
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
        appBarTheme: const AppBarTheme(
          centerTitle: false,
        ),
        scaffoldBackgroundColor: UiConstants.scaffoldBackgroundColor,
      ),
      home: const HomePage(),
    );
  }
}
