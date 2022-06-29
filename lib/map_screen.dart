import 'dart:collection';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:aplicacion_chofer/polylines/polylines.dart';
import 'package:geolocator/geolocator.dart';


class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  static const _initialCameraPosition = CameraPosition(
    target: LatLng(-17.783043629108434, -63.18211937034582),
    zoom: 12.5,
  );

  GoogleMapController? _googleMapController;
  Set<Marker> markers = {};
  Set<Circle> _circle = HashSet<Circle>();

  Set<Polyline> lineaActual=Set<Polyline>();

  void seleccionarLinea1(){
    setState(() {
      lineaActual=linea1;
    });
   // print("entra");
  }

  void seleccionarLinea2(){
    setState(() {
      lineaActual=linea2;
    });
  }

  void seleccionarLinea5(){
    setState(() {
      lineaActual=linea5;
    });
  }
   void seleccionarLinea8(){
    setState(() {
      lineaActual=linea8;
    });
  }
   void seleccionarLinea9(){
    setState(() {
      lineaActual=linea9;
    });
  }
   void seleccionarLinea10(){
    setState(() {
      lineaActual=linea10;
    });
  }
   void seleccionarLinea11(){
    setState(() {
      lineaActual=linea11;
    });
  }
   void seleccionarLinea16(){
    setState(() {
      lineaActual=linea16;
    });
  }
   void seleccionarLinea17(){
    setState(() {
      lineaActual=linea17;
    });
  }
   void seleccionarLinea18(){
    setState(() {
      lineaActual=linea18;
    });
  }

  @override
  void dispose() {
    _googleMapController?.dispose();
    super.dispose();
  }

  void getRoutesInsideCircles(double currentLat,double currentLong){
    Set <Polyline> capturedRoutes ={};  
    linea1.elementAt(0).points.forEach((element) {
      if (isInsideRadius(currentLong,currentLat,element.longitude,element.latitude)) {
        capturedRoutes.add(linea1.elementAt(0));
         print("linea 1==================================================1");
      }
    });
    linea1.elementAt(1).points.forEach((element) {
      if (isInsideRadius(currentLong,currentLat,element.longitude,element.latitude)) {
        capturedRoutes.add(linea1.elementAt(1));
         print("linea 1==================================================2");
      }
    });
    //===========linea 2
    linea2.elementAt(0).points.forEach((element) {
      if (isInsideRadius(currentLong,currentLat,element.longitude,element.latitude)) {
        capturedRoutes.add(linea2.elementAt(0));
         print("linea 2==================================================1");
      }
    });
    linea2.elementAt(1).points.forEach((element) {
      if (isInsideRadius(currentLong,currentLat,element.longitude,element.latitude)) {
        capturedRoutes.add(linea2.elementAt(1));
         print("linea 2==================================================2");
      }
    });
//===========linea 5
    linea5.elementAt(0).points.forEach((element) {
      if (isInsideRadius(currentLong,currentLat,element.longitude,element.latitude)) {
        capturedRoutes.add(linea5.elementAt(0));
         print("linea 5==================================================1");
      }
    });
    linea5.elementAt(1).points.forEach((element) {
      if (isInsideRadius(currentLong,currentLat,element.longitude,element.latitude)) {
        capturedRoutes.add(linea5.elementAt(1));
         print("linea 5==================================================2");
      }
    });
    //===========linea 8
    linea8.elementAt(0).points.forEach((element) {
      if (isInsideRadius(currentLong,currentLat,element.longitude,element.latitude)) {
        capturedRoutes.add(linea8.elementAt(0));
         print("linea 8==================================================1");
      }
    });
    linea8.elementAt(1).points.forEach((element) {
      if (isInsideRadius(currentLong,currentLat,element.longitude,element.latitude)) {
        capturedRoutes.add(linea8.elementAt(1));
         print("linea 8==================================================2");
      }
    });
    //===========linea 9
    linea9.elementAt(0).points.forEach((element) {
      if (isInsideRadius(currentLong,currentLat,element.longitude,element.latitude)) {
        capturedRoutes.add(linea9.elementAt(0));
         print("linea 9==================================================1");
      }
    });
    linea9.elementAt(1).points.forEach((element) {
      if (isInsideRadius(currentLong,currentLat,element.longitude,element.latitude)) {
        capturedRoutes.add(linea9.elementAt(1));
         print("linea 9==================================================2");
      }
    });

    //===========linea 10
    linea10.elementAt(0).points.forEach((element) {
      if (isInsideRadius(currentLong,currentLat,element.longitude,element.latitude)) {
        capturedRoutes.add(linea10.elementAt(0));
         print("linea 10==================================================1");
      }
    });
    linea10.elementAt(1).points.forEach((element) {
      if (isInsideRadius(currentLong,currentLat,element.longitude,element.latitude)) {
        capturedRoutes.add(linea10.elementAt(1));
         print("linea 10==================================================2");
      }
    });
     //===========linea 11
    linea11.elementAt(0).points.forEach((element) {
      if (isInsideRadius(currentLong,currentLat,element.longitude,element.latitude)) {
        capturedRoutes.add(linea11.elementAt(0));
         print("linea 11==================================================1");
      }
    });
    linea11.elementAt(1).points.forEach((element) {
      if (isInsideRadius(currentLong,currentLat,element.longitude,element.latitude)) {
        capturedRoutes.add(linea11.elementAt(1));
         print("linea 11==================================================2");
      }
    });
     //===========linea 16
    linea16.elementAt(0).points.forEach((element) {
      if (isInsideRadius(currentLong,currentLat,element.longitude,element.latitude)) {
        capturedRoutes.add(linea16.elementAt(0));
         print("linea 16==================================================1");
      }
    });
    linea16.elementAt(1).points.forEach((element) {
      if (isInsideRadius(currentLong,currentLat,element.longitude,element.latitude)) {
        capturedRoutes.add(linea16.elementAt(1));
         print("linea 16==================================================2");
      }
    });
 //===========linea 17
    linea17.elementAt(0).points.forEach((element) {
      if (isInsideRadius(currentLong,currentLat,element.longitude,element.latitude)) {
        capturedRoutes.add(linea17.elementAt(0));
         print("linea 17==================================================1");
      }
    });
    linea17.elementAt(1).points.forEach((element) {
      if (isInsideRadius(currentLong,currentLat,element.longitude,element.latitude)) {
        capturedRoutes.add(linea17.elementAt(1));
         print("linea 17==================================================2");
      }
    });
     //===========linea 18
    linea18.elementAt(0).points.forEach((element) {
      if (isInsideRadius(currentLong,currentLat,element.longitude,element.latitude)) {
        capturedRoutes.add(linea18.elementAt(0));
         print("linea 18==================================================1");
      }
    });
    linea18.elementAt(1).points.forEach((element) {
      if (isInsideRadius(currentLong,currentLat,element.longitude,element.latitude)) {
        capturedRoutes.add(linea18.elementAt(1));
        print("linea 18==================================================2");
      }
    });
     setState(() {
      lineaActual=capturedRoutes;
    });
  }


  bool isInsideRadius(
      double currentX, double currentY, double lineX, double lineY) {
    const double radius = 0.002355222456223941;
    double d = sqrt(pow((lineX.abs() - currentX.abs()), 2) +
        pow((lineY.abs() - currentY.abs()), 2));
    return (d <= radius);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(context,
      seleccionarLinea1,
      seleccionarLinea2,
      seleccionarLinea5,
      seleccionarLinea8,
      seleccionarLinea9,
      seleccionarLinea10,
      seleccionarLinea11,
      seleccionarLinea16,
      seleccionarLinea17,
      seleccionarLinea18,
      ),
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'Rutas de Micros',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
      body: GoogleMap(
        myLocationButtonEnabled: true,
        zoomControlsEnabled: false,
        markers: markers,
        circles: _circle,
        initialCameraPosition: _initialCameraPosition,
        onMapCreated: (controller) => _googleMapController = controller,
        polylines: lineaActual,

        //====================

        //====================================
      ),
      //-------------------------------------------------------------------
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton( //boton de ubicacion del user
            heroTag: "btn1",
            backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Colors.black,
            onPressed: () async {
              Position position = await _determinePosition();
              _googleMapController?.animateCamera(
                  CameraUpdate.newCameraPosition(CameraPosition(
                      target: LatLng(position.latitude, position.longitude),
                      zoom: 14)));

              markers.clear();
              markers.add(Marker(
              markerId: const MarkerId('currentLocation'),
              position: LatLng(position.latitude, position.longitude)));
              setState(() {});
              //getRoutesInsideCircles(position.longitude,position.latitude);

            },
            child: const Icon(Icons.location_on_outlined),
          ),
          FloatingActionButton( //boton de centrado
          heroTag: "btn2",
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Colors.black,
          onPressed: () => _googleMapController?.animateCamera(
            
            CameraUpdate.newCameraPosition(_initialCameraPosition),
          ),
          child: const Icon(Icons.center_focus_strong),
          ),
          FloatingActionButton( //boton de radio===========
            heroTag: "btn3",
            backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Colors.black,
            onPressed: ()async{
              Position position = await _determinePosition();
              _circle.add(
              Circle(
                circleId: const CircleId("0"),
                 center: LatLng(position.latitude, position.longitude),
                  radius:  300,
                  strokeWidth: 2,
                   fillColor:  const Color.fromARGB(74, 12, 151, 121)
              )
              );

              getRoutesInsideCircles(position.latitude,position.longitude);
              lineaActual;
            },
            child: const Icon(Icons.radar),
            //circles: _circle,


          ),
        ],
      ),
      
      //------------------------------------------------------------------
    );
    
    
  }
  //====================
  
  //==================================
  Future<Position> _determinePosition() async { //funcion para determinar la posicion del usuario
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error("Location permission denied");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied');
    }

    Position position = await Geolocator.getCurrentPosition();

    return position;
  }

  Future<void> _setCircles() async {
     Position position = await _determinePosition();
    _circle.add(
      Circle(
        circleId: const CircleId("0"),
        center: LatLng(position.latitude, position.longitude),
        radius:  100,
        strokeWidth: 2,
        fillColor:  const Color.fromARGB(74, 12, 151, 121)
      )
    );
  } 
  //========================


  Widget NavigationDrawer(BuildContext context,
  VoidCallback action1,
  VoidCallback action2,
  VoidCallback action5,
  VoidCallback action8,
  VoidCallback action9,
  VoidCallback action10,
  VoidCallback action11,
  VoidCallback action16,
  VoidCallback action17,
  VoidCallback action18,){

  final padding = const EdgeInsets.symmetric(horizontal: 20);

    return Drawer(
      child: Material(
        color: Colors.green,
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 48),
            buildMenuItem(
              text: 'linea 1',
              onClicked: () { 
                action1();
                Navigator.pop(context);
              }
            ),
            buildMenuItem(
              text: 'linea 2',
              onClicked: () { action2(); 
              Navigator.pop(context);}
            ),
            buildMenuItem(
              text: 'linea 5',
              onClicked: () { action5(); 
              Navigator.pop(context);}
            ),
            buildMenuItem(
              text: 'linea 8',
              onClicked: () { action8(); 
              Navigator.pop(context);}
            ),
            buildMenuItem(
              text: 'linea 9',
              onClicked: () { action9(); 
              Navigator.pop(context);}
            ),
            buildMenuItem(
              text: 'linea 10',
              onClicked: () { action10(); 
              Navigator.pop(context);}
            ),
            buildMenuItem(
              text: 'linea 11',
              onClicked: () { action11(); 
              Navigator.pop(context);}
            ),
            buildMenuItem(
              text: 'linea 16',
              onClicked: () { action16(); 
              Navigator.pop(context);}
            ),
            buildMenuItem(
              text: 'linea 17',
              onClicked: () { action17(); 
              Navigator.pop(context);}
            ),
            buildMenuItem(
              text: 'linea 18',
              onClicked: () { action18(); 
              Navigator.pop(context);}
            ),
          ],
        ),
      ),
    );
  }
  Widget buildMenuItem({
    required String text,
    VoidCallback? onClicked,
  }){
    final Color = Colors.white;
    return ListTile(
      leading: Icon(Icons.bus_alert, color: Color),
      title: Text(text, style: TextStyle(color: Color)),
      onTap: onClicked,
    );
  }

  



}

