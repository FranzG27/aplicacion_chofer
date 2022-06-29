import 'package:flutter/material.dart';
import 'package:aplicacion_chofer/splash.dart';
import 'package:aplicacion_chofer/welcome.dart';



void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ruta de Micros',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Colors.green
        ),
        primaryColor: Colors.green,
      ),
      home: SplashPage(duration: 3, goToPage: WelcomePage()),
      // home: MapScreen(),
    );
  }
}





