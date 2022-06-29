import 'package:flutter/material.dart';
import 'package:aplicacion_chofer/map_screen.dart';
import 'package:aplicacion_chofer/splash.dart';

class WelcomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Stack(
          children: [
            Positioned.fill(
              child: Opacity(
                opacity: 0.3,
                child: Image.asset(
                  'lib/assets/images/SantaCruzWelcome.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 50,),
                  const Text('Bienvenidos',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 40,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                  const SizedBox(height: 40,),
                  const Text('Aplicación de Rutas de Micros',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.lightGreen,
                    fontSize: 18,
                  ),
                  ),
                 
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: FlatButton(
                      onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SplashPage(duration: 4, goToPage: MapScreen()),
                      ),
                    );
                  },
                                shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)
                      ),
                      color: (Colors.green),
                      padding: const EdgeInsets.all(25),
                      child: const Text('Iniciar',
                        style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                    const Text('Santa Cruz - Bolivia',
                    textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.lightGreen,
                    fontSize: 18,
                   ),
                  ), 
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}