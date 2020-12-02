import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Domain',
      theme: ThemeData(
        primaryColor: Colors.white,
        accentColor: Color(0xFF00384C),
        textTheme: GoogleFonts.montserratTextTheme(Theme.of(context).textTheme)
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: Modular.initialRoute,
      navigatorKey: Modular.navigatorKey,
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
