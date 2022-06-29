import 'package:flutter/material.dart';
import 'package:aplicacion_chofer/welcome.dart';


class IconFont extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return const Text('a',
    style: TextStyle(
      color: Colors.white,
      fontSize: 100,
      fontFamily: 'bus'
      ),
    );
  }
}

class SplashPage  extends StatelessWidget{
  int duration = 0;
  Widget goToPage;

  SplashPage({Key? key,
    required this.goToPage,
     required this.duration,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Future.delayed(Duration(seconds: duration), (){
      Navigator.push(
        context, MaterialPageRoute(builder: (context) => goToPage)
        );
    });

    return Scaffold(
      body: Container(
        color: (Colors.green),
        child: Center(
          child: IconFont(),
        ),
      ),
    );
  }
}