import 'package:dio_busca_cep/pages/busca_cep_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DioBuscaCep extends StatelessWidget {
  const DioBuscaCep({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.redAccent,
        colorScheme: const ColorScheme(
            brightness: Brightness.dark,
            primary: Color.fromARGB(255, 0, 255, 221),
            onPrimary: Colors.black,
            secondary: Colors.white,
            onSecondary: Colors.black,
            error: Colors.redAccent,
            onError: Colors.black,
            background: Color.fromARGB(255, 0, 151, 131),
            onBackground: Color.fromARGB(255, 0, 255, 221),
            surface: Color.fromARGB(255, 0, 124, 108),
            onSurface: Color.fromARGB(255, 0, 255, 221)),
        textTheme: GoogleFonts.mulishTextTheme(),
        snackBarTheme: const SnackBarThemeData(
            backgroundColor: Colors.deepOrange,
            contentTextStyle: TextStyle(color: Colors.white)),
      ),
      home: const BuscaCepPage(),
    );
  }
}
