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
        textTheme: GoogleFonts.montserratTextTheme(Theme.of(context).textTheme)
      ),
      locale: Locale('pt', 'BR'),
      debugShowCheckedModeBanner: false,
      initialRoute: Modular.initialRoute,
      navigatorKey: Modular.navigatorKey,
      onGenerateRoute: Modular.generateRoute,
      supportedLocales: [const Locale('pt', 'BR')],
    );
  }
}
