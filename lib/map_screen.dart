import 'dart:async';
import 'dart:collection';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:aplicacion_chofer/polylines/polylines.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';
import 'dart:typed_data';//for the car




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
  Marker? _specificLoc;
  Set<Marker> markers = {};
  Set<Circle> _circle = HashSet<Circle>();

  Circle? circlenew; 
  Location _tracker = Location();
  StreamSubscription? _streamSubscription;

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

  //LINEAS DE VUELTA

  void seleccionarLinea1v(){
    setState(() {
      lineaActual=linea1v;
    });
   // print("entra");
  }

  void seleccionarLinea2v(){
    setState(() {
      lineaActual=linea2v;
    });
  }

  void seleccionarLinea5v(){
    setState(() {
      lineaActual=linea5v;
    });
  }
   void seleccionarLinea8v(){
    setState(() {
      lineaActual=linea8v;
    });
  }
   void seleccionarLinea9v(){
    setState(() {
      lineaActual=linea9v;
    });
  }
   void seleccionarLinea10v(){
    setState(() {
      lineaActual=linea10v;
    });
  }
   void seleccionarLinea11v(){
    setState(() {
      lineaActual=linea11v;
    });
  }
   void seleccionarLinea16v(){
    setState(() {
      lineaActual=linea16v;
    });
  }
   void seleccionarLinea17v(){
    setState(() {
      lineaActual=linea17v;
    });
  }
   void seleccionarLinea18v(){
    setState(() {
      lineaActual=linea18v;
    });
  }

  //===============================draw lineas ida y vuelta y buses en recorrido 
  void seleccionarLinea1iv(){
    setState(() {
      lineaActual=linea1iv;
    });
   // print("entra");
  }

  void seleccionarLinea2iv(){
    setState(() {
      lineaActual=linea2iv;
    });
  }

  void seleccionarLinea5iv(){
    setState(() {
      lineaActual=linea5iv;
    });
  }
   void seleccionarLinea8iv(){
    setState(() {
      lineaActual=linea8iv;
    });
  }
   void seleccionarLinea9iv(){
    setState(() {
      lineaActual=linea9iv;
    });
  }
   void seleccionarLinea10iv(){
    setState(() {
      lineaActual=linea10iv;
    });
  }
   void seleccionarLinea11iv(){
    setState(() {
      lineaActual=linea11iv;
    });
  }
   void seleccionarLinea16iv(){
    setState(() {
      lineaActual=linea16iv;
    });
  }
   void seleccionarLinea17iv(){
    setState(() {
      lineaActual=linea17iv;
    });
  }
   void seleccionarLinea18iv(){
    setState(() {
      lineaActual=linea18iv;
    });
  }
  //====================
  @override
  void dispose() {
    _googleMapController?.dispose();
    super.dispose();
  }
  List<String> lineasencontradas =[];
  String lineasenc ="";
  bool lin1=false;
  bool lin2=false;
  bool lin5=false;
  bool lin8=false;
  bool lin9=false;
  bool lin10=false;
  bool lin11=false;
  bool lin16=false;
  bool lin17=false;
  bool lin18=false;
  bool lin1v=false;
  bool lin2v=false;
  bool lin5v=false;
  bool lin8v=false;
  bool lin9v=false;
  bool lin10v=false;
  bool lin11v=false;
  bool lin16v=false;
  bool lin17v=false;
  bool lin18v=false;

//===========para el infowindow de la ruta en lugar de pin especifico
  void getlinesinfo(double currentLat,double currentLong){
    lineasenc ="";
    linea1.elementAt(0).points.forEach((element) {
      if (isInsideRadius(currentLong,currentLat,element.longitude,element.latitude)) {
         print("linea 1==================================================1");
         if(lin1==false){
         lineasenc=lineasenc+"1I - ";
         lin1=true;
         }
         
      }
    });

    linea1v.elementAt(0).points.forEach((element) {
      if (isInsideRadius(currentLong,currentLat,element.longitude,element.latitude)) {
         print("linea 1==================================================2");
        if(lin1v==false){
         lineasenc=lineasenc+"1V - ";
         lin1v=true;
        }
         
      }
    });
    //===========linea 2
    linea2.elementAt(0).points.forEach((element) {
      if (isInsideRadius(currentLong,currentLat,element.longitude,element.latitude)) {
         print("linea 2==================================================1");
         if(lin2==false){
         lineasenc=lineasenc+"2I - ";
         lin2=true;
         }
      }
    });
    linea2v.elementAt(0).points.forEach((element) {
      if (isInsideRadius(currentLong,currentLat,element.longitude,element.latitude)) {
         print("linea 2==================================================2");
        if(lin2v==false){
         lineasenc=lineasenc+"2V - ";
         lin2v =true;
         }
      }
    });
//===========linea 5
    linea5.elementAt(0).points.forEach((element) {
      if (isInsideRadius(currentLong,currentLat,element.longitude,element.latitude)) {
         print("linea 5==================================================1");
        if(lin5==false){
        lineasenc=lineasenc+"5I - ";
        lin5=true;
        }
        
      }
      
    });
    linea5v.elementAt(0).points.forEach((element) {
      if (isInsideRadius(currentLong,currentLat,element.longitude,element.latitude)) {
         print("linea 5==================================================2");
         if(lin5v==false){
         lineasenc=lineasenc+"5V - ";
         lin5v=true;
         }
      }
    });
    //===========linea 8
    linea8.elementAt(0).points.forEach((element) {
      if (isInsideRadius(currentLong,currentLat,element.longitude,element.latitude)) {
         print("linea 8==================================================1");
          if(lin8==false){
          lineasenc=lineasenc+"8I - ";
          lin8=true;
          }
      }
    });
    linea8v.elementAt(0).points.forEach((element) {
      if (isInsideRadius(currentLong,currentLat,element.longitude,element.latitude)) {
         print("linea 8==================================================2");
        if(lin8v==false){
        lineasenc=lineasenc+"8V - ";
        lin8v=true;
        }
      }
    });
    //===========linea 9
    linea9.elementAt(0).points.forEach((element) {
      if (isInsideRadius(currentLong,currentLat,element.longitude,element.latitude)) {
         print("linea 9==================================================1");
        if(lin9==false){
        lineasenc=lineasenc+"9I - ";
        lin9=true;
        }
      }
    });
    linea9v.elementAt(0).points.forEach((element) {
      if (isInsideRadius(currentLong,currentLat,element.longitude,element.latitude)) {
         print("linea 9==================================================2");
        if(lin9v==false){
        lineasenc=lineasenc+"9V - ";
        lin9v=true;
        }
      }
    });

    //===========linea 10
    linea10.elementAt(0).points.forEach((element) {
      if (isInsideRadius(currentLong,currentLat,element.longitude,element.latitude)) {
         print("linea 10==================================================1");
        if(lin10==false){
        lineasenc=lineasenc+"10I - ";
        lin10=true;
        }
      }
    });
    linea10v.elementAt(0).points.forEach((element) {
      if (isInsideRadius(currentLong,currentLat,element.longitude,element.latitude)) {
         print("linea 10==================================================2");
        if(lin10v==false){
        lineasenc=lineasenc+"10V - ";
        lin10v=true;
        }
      }
    });
     //===========linea 11
    linea11.elementAt(0).points.forEach((element) {
      if (isInsideRadius(currentLong,currentLat,element.longitude,element.latitude)) {
         print("linea 11==================================================1");
        if(lin11==false){
        lineasenc=lineasenc+"11I - ";
        lin11=true;
        }
      }
    });
    linea11v.elementAt(0).points.forEach((element) {
      if (isInsideRadius(currentLong,currentLat,element.longitude,element.latitude)) {
         print("linea 11==================================================2");
        if(lin11v==false){
        lineasenc=lineasenc+"11V - ";
        lin11v=true;
        }
      }
    });
     //===========linea 16
    linea16.elementAt(0).points.forEach((element) {
      if (isInsideRadius(currentLong,currentLat,element.longitude,element.latitude)) {
         print("linea 16==================================================1");
        if(lin16==false){
        lineasenc=lineasenc+"16I - ";
        lin16=true;
        }
      }
    });
    linea16v.elementAt(0).points.forEach((element) {
      if (isInsideRadius(currentLong,currentLat,element.longitude,element.latitude)) {
         print("linea 16==================================================2");
        if(lin16v==false){
        lineasenc=lineasenc+"16V - ";
        lin16v=true;
        }
      }
    });
 //===========linea 17
    linea17.elementAt(0).points.forEach((element) {
      if (isInsideRadius(currentLong,currentLat,element.longitude,element.latitude)) {
         print("linea 17==================================================1");
        if(lin17==false){
        lineasenc=lineasenc+"17I - ";
        lin17=true;
        }
      }
    });
    linea17v.elementAt(0).points.forEach((element) {
      if (isInsideRadius(currentLong,currentLat,element.longitude,element.latitude)) {
         print("linea 17==================================================2");
        if(lin17v==false){
        lineasenc=lineasenc+"17V - ";
        lin17v=true;
        }
      }
    });
     //===========linea 18
    linea18.elementAt(0).points.forEach((element) {
      if (isInsideRadius(currentLong,currentLat,element.longitude,element.latitude)) {
         print("linea 18==================================================1");
        if(lin18==false){
        lineasenc=lineasenc+"18I - ";
        lin18=true;
        }
      }
    });
    linea18v.elementAt(0).points.forEach((element) {
      if (isInsideRadius(currentLong,currentLat,element.longitude,element.latitude)) {
        print("linea 18==================================================2");
        if(lin18v==false){
        lineasenc=lineasenc+"18V - ";
        lin18v=true;
        }
      }
    });
  }
 ///==============================================================================
  void getRoutesInsideCircles(double currentLat,double currentLong){
    lineasenc ="";
    Set <Polyline> capturedRoutes ={};  
    linea1.elementAt(0).points.forEach((element) {
      if (isInsideRadius(currentLong,currentLat,element.longitude,element.latitude)) {
        capturedRoutes.add(linea1.elementAt(0));
         print("linea 1==================================================1");
         if(lin1==false){
         lineasencontradas.add("linea 1 ida");
         lineasenc=lineasenc+"1I - ";
         lin1=true;
         }
         
      }
    });
    linea1v.elementAt(0).points.forEach((element) {
      if (isInsideRadius(currentLong,currentLat,element.longitude,element.latitude)) {
        capturedRoutes.add(linea1v.elementAt(0));
         print("linea 1==================================================2");
        if(lin1v==false){
        lineasencontradas.add("linea 1 vuelta");
         lineasenc=lineasenc+"1V - ";
         lin1v=true;
        }
         
      }
    });
    //===========linea 2
    linea2.elementAt(0).points.forEach((element) {
      if (isInsideRadius(currentLong,currentLat,element.longitude,element.latitude)) {
        capturedRoutes.add(linea2.elementAt(0));
         print("linea 2==================================================1");
         if(lin2==false){
         lineasencontradas.add("linea 2 ida");
         lineasenc=lineasenc+"2I - ";
         lin2=true;
         }
      }
    });
    linea2v.elementAt(0).points.forEach((element) {
      if (isInsideRadius(currentLong,currentLat,element.longitude,element.latitude)) {
        capturedRoutes.add(linea2v.elementAt(0));
         print("linea 2==================================================2");
        if(lin2v==false){
         lineasencontradas.add("linea 2 vuelta");
         lineasenc=lineasenc+"2V - ";
         lin2v =true;
         }
      }
    });
//===========linea 5
    linea5.elementAt(0).points.forEach((element) {
      if (isInsideRadius(currentLong,currentLat,element.longitude,element.latitude)) {
        capturedRoutes.add(linea5.elementAt(0));
         print("linea 5==================================================1");
        if(lin5==false){
        lineasencontradas.add("linea 5 ida");
        lineasenc=lineasenc+"5I - ";
        lin5=true;
        }
        
      }
      
    });
    linea5v.elementAt(0).points.forEach((element) {
      if (isInsideRadius(currentLong,currentLat,element.longitude,element.latitude)) {
        capturedRoutes.add(linea5v.elementAt(0));
         print("linea 5==================================================2");
         if(lin5v==false){
         lineasencontradas.add("linea 5 vuelta"); 
         lineasenc=lineasenc+"5V - ";
         lin5v=true;
         }
      }
    });
    //===========linea 8
    linea8.elementAt(0).points.forEach((element) {
      if (isInsideRadius(currentLong,currentLat,element.longitude,element.latitude)) {
        capturedRoutes.add(linea8.elementAt(0));
         print("linea 8==================================================1");
          if(lin8==false){
          lineasencontradas.add("linea 8 ida");
          lineasenc=lineasenc+"8I - ";
          lin8=true;
          }
      }
    });
    linea8v.elementAt(0).points.forEach((element) {
      if (isInsideRadius(currentLong,currentLat,element.longitude,element.latitude)) {
        capturedRoutes.add(linea8v.elementAt(0));
         print("linea 8==================================================2");
        if(lin8v==false){
        lineasencontradas.add("linea 8 vuelta");
        lineasenc=lineasenc+"8V - ";
        lin8v=true;
        }
      }
    });
    //===========linea 9
    linea9.elementAt(0).points.forEach((element) {
      if (isInsideRadius(currentLong,currentLat,element.longitude,element.latitude)) {
        capturedRoutes.add(linea9.elementAt(0));
         print("linea 9==================================================1");
        if(lin9==false){
        lineasencontradas.add("linea 9 ida");
        lineasenc=lineasenc+"9I - ";
        lin9=true;
        }
      }
    });
    linea9v.elementAt(0).points.forEach((element) {
      if (isInsideRadius(currentLong,currentLat,element.longitude,element.latitude)) {
        capturedRoutes.add(linea9v.elementAt(0));
         print("linea 9==================================================2");
        if(lin9v==false){
        lineasencontradas.add("linea 9 vuelta");
        lineasenc=lineasenc+"9V - ";
        lin9v=true;
        }
      }
    });

    //===========linea 10
    linea10.elementAt(0).points.forEach((element) {
      if (isInsideRadius(currentLong,currentLat,element.longitude,element.latitude)) {
        capturedRoutes.add(linea10.elementAt(0));
         print("linea 10==================================================1");
        if(lin10==false){
        lineasencontradas.add("linea 10 ida");
        lineasenc=lineasenc+"10I - ";
        lin10=true;
        }
      }
    });
    linea10v.elementAt(0).points.forEach((element) {
      if (isInsideRadius(currentLong,currentLat,element.longitude,element.latitude)) {
        capturedRoutes.add(linea10v.elementAt(0));
         print("linea 10==================================================2");
        if(lin10v==false){
        lineasencontradas.add("linea 10 vuelta");
        lineasenc=lineasenc+"10V - ";
        lin10v=true;
        }
      }
    });
     //===========linea 11
    linea11.elementAt(0).points.forEach((element) {
      if (isInsideRadius(currentLong,currentLat,element.longitude,element.latitude)) {
        capturedRoutes.add(linea11.elementAt(0));
         print("linea 11==================================================1");
        if(lin11==false){
        lineasencontradas.add("linea 11 ida");
        lineasenc=lineasenc+"11I - ";
        lin11=true;
        }
      }
    });
    linea11v.elementAt(0).points.forEach((element) {
      if (isInsideRadius(currentLong,currentLat,element.longitude,element.latitude)) {
        capturedRoutes.add(linea11v.elementAt(0));
         print("linea 11==================================================2");
        if(lin11v==false){
        lineasencontradas.add("linea 11 vuelta");
        lineasenc=lineasenc+"11V - ";
        lin11v=true;
        }
      }
    });
     //===========linea 16
    linea16.elementAt(0).points.forEach((element) {
      if (isInsideRadius(currentLong,currentLat,element.longitude,element.latitude)) {
        capturedRoutes.add(linea16.elementAt(0));
         print("linea 16==================================================1");
        if(lin16==false){
        lineasencontradas.add("linea 16 ida");
        lineasenc=lineasenc+"16I - ";
        lin16=true;
        }
      }
    });
    linea16v.elementAt(0).points.forEach((element) {
      if (isInsideRadius(currentLong,currentLat,element.longitude,element.latitude)) {
        capturedRoutes.add(linea16v.elementAt(0));
         print("linea 16==================================================2");
        if(lin16v==false){
        lineasencontradas.add("linea 16 vuelta");
        lineasenc=lineasenc+"16V - ";
        lin16v=true;
        }
      }
    });
 //===========linea 17
    linea17.elementAt(0).points.forEach((element) {
      if (isInsideRadius(currentLong,currentLat,element.longitude,element.latitude)) {
        capturedRoutes.add(linea17.elementAt(0));
         print("linea 17==================================================1");
        if(lin17==false){
        lineasencontradas.add("linea 17 ida");
        lineasenc=lineasenc+"17I - ";
        lin17=true;
        }
      }
    });
    linea17v.elementAt(0).points.forEach((element) {
      if (isInsideRadius(currentLong,currentLat,element.longitude,element.latitude)) {
        capturedRoutes.add(linea17v.elementAt(0));
         print("linea 17==================================================2");
        if(lin17v==false){
        lineasencontradas.add("linea 17 vuelta");
        lineasenc=lineasenc+"17V - ";
        lin17v=true;
        }
      }
    });
     //===========linea 18
    linea18.elementAt(0).points.forEach((element) {
      if (isInsideRadius(currentLong,currentLat,element.longitude,element.latitude)) {
        capturedRoutes.add(linea18.elementAt(0));
         print("linea 18==================================================1");
        if(lin18==false){
        lineasencontradas.add("linea 18 ida");
        lineasenc=lineasenc+"18I - ";
        lin18=true;
        }
      }
    });
    linea18v.elementAt(0).points.forEach((element) {
      if (isInsideRadius(currentLong,currentLat,element.longitude,element.latitude)) {
        capturedRoutes.add(linea18v.elementAt(0));
        print("linea 18==================================================2");
        if(lin18v==false){
        lineasencontradas.add("linea 18 vuelta");
        lineasenc=lineasenc+"18V - ";
        lin18v=true;
        }
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

      seleccionarLinea1v,
      seleccionarLinea2v,
      seleccionarLinea5v,
      seleccionarLinea8v,
      seleccionarLinea9v,
      seleccionarLinea10v,
      seleccionarLinea11v,
      seleccionarLinea16v,
      seleccionarLinea17v,
      seleccionarLinea18v,

      seleccionarLinea1iv,
      seleccionarLinea2iv,
      seleccionarLinea5iv,
      seleccionarLinea8iv,
      seleccionarLinea9iv,
      seleccionarLinea10iv,
      seleccionarLinea11iv,
      seleccionarLinea16iv,
      seleccionarLinea17iv,
      seleccionarLinea18iv,
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
        //markers: markers,
        circles: _circle,
        initialCameraPosition: _initialCameraPosition,
        onMapCreated: (controller) => _googleMapController = controller,
        polylines: lineaActual,
        markers: {
          if (_specificLoc != null) _specificLoc!,
        },
        //====================
      
         onLongPress: _addMarker,
        
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

                //usando el specific loc marker 
                _specificLoc = Marker(
                markerId: const MarkerId('current location'),
         
                infoWindow: InfoWindow(
                title: 'Lineas dentro de rango',
                snippet: lineasenc,

              ),
               icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
               position: LatLng(position.latitude, position.longitude),
               );
                
                //================

                /*markers.clear();
                markers.add(Marker(
                markerId: const MarkerId('currentLocation'),
                position: LatLng(position.latitude, position.longitude)));
                setState(() {});
                //getRoutesInsideCircles(position.longitude,position.latitude);
                */
              setState(() {});
            },
            child: const Icon(Icons.location_on_outlined),
          ),
          
          FloatingActionButton(  //====================boton de ubicacion especifica para lineas en ese rango
            heroTag: "btn4",
            backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Colors.black,
            onPressed: () async {
             // onLongPress: _addMarker;
             _circle.clear(); 
             
              _circle.add(
              Circle(
                circleId: const CircleId("0"),
                 center: LatLng(_specificLoc!.position.latitude, _specificLoc!.position.longitude),
                  radius:  300,
                  strokeWidth: 2,
                   fillColor:  const Color.fromARGB(74, 12, 151, 121)
              )
              );

              getRoutesInsideCircles(_specificLoc!.position.latitude, _specificLoc!.position.longitude);
              lineaActual;
             // _specificLoc!.infoWindow.title!(lineasenc);
             // _specificLoc?.infoWindow.title;
              
            },
            child: const Icon(Icons.local_library_outlined),
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
          //=======================
          FloatingActionButton( //boton para cortar 
          heroTag: "btn5",
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Colors.black,
          onPressed: () {
                      _streamSubscription!.cancel();
                      },
          
          child: const Icon(Icons.refresh),
          ),
          //=======================
          FloatingActionButton( //boton de radio==============================================
            heroTag: "btn3",
            backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Colors.black,
            onPressed: ()async{
              Position position = await _determinePosition();
              _circle.clear();

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



               //=============== adding marker current location
              /*markers.clear();
              markers.add(Marker(
              markerId: const MarkerId('currentLocation'),
              position: LatLng(position.latitude, position.longitude),
              infoWindow: InfoWindow(
                title: 'Lineas dentro de rango',
                snippet: lineasenc,

              ),
              )
              );*/

              //====================probando a usar el marker de specificloc para poner el current location
              //getlinesinfo(position.latitude, position.longitude);
              _specificLoc = Marker(
              markerId: const MarkerId('ubicacion'),
         
                infoWindow: InfoWindow(
                title: 'Lineas dentro de rango',
                snippet: lineasenc,

              ),
               icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
               position: LatLng(position.latitude, position.longitude),
               );
              //==============================
              
              setState(() {});
              //=============
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
  VoidCallback action18,

  VoidCallback action1v,
  VoidCallback action2v,
  VoidCallback action5v,
  VoidCallback action8v,
  VoidCallback action9v,
  VoidCallback action10v,
  VoidCallback action11v,
  VoidCallback action16v,
  VoidCallback action17v,
  VoidCallback action18v,

  VoidCallback action1iv,
  VoidCallback action2iv,
  VoidCallback action5iv,
  VoidCallback action8iv,
  VoidCallback action9iv,
  VoidCallback action10iv,
  VoidCallback action11iv,
  VoidCallback action16iv,
  VoidCallback action17iv,
  VoidCallback action18iv,
  
  ){

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
                //getCurrentLocationCar();
                Navigator.pop(context);
              }
            ),
             buildMenuItem(
              text: 'linea 1 vuelta',
              onClicked: () { 
                action1v();
                Navigator.pop(context);
              }
            ),
             buildMenuItem(//===============================pedir linea 1
              text: 'ver buses lin 1',
              onClicked: () { 
                action1iv();
                getCurrentLocationCar();
                Navigator.pop(context);
              }
            ),
            buildMenuItem(
              text: 'linea 2',
              onClicked: () { action2(); 
              Navigator.pop(context);}
            ),
             buildMenuItem(
              text: 'linea 2 vuelta',
              onClicked: () {
               action2v(); 
              Navigator.pop(context);}
            ),
             buildMenuItem(//===============================pedir linea 2
              text: 'ver buses lin 2',
              onClicked: () { 
                action2iv();
                getCurrentLocationCar();
                Navigator.pop(context);
              }
            ),
            buildMenuItem(
              text: 'linea 5',
              onClicked: () { action5(); 
              Navigator.pop(context);}
            ),
            buildMenuItem(
              text: 'linea 5 vuelta',
              onClicked: () {
               action5v(); 
              Navigator.pop(context);}
            ),
             buildMenuItem(//===============================pedir linea 5
              text: 'ver buses lin 5',
              onClicked: () { 
                action5iv();
                getCurrentLocationCar();
                Navigator.pop(context);
              }
            ),
            buildMenuItem(
              text: 'linea 8',
              onClicked: () { action8(); 
              Navigator.pop(context);}
            ),
             buildMenuItem(
              text: 'linea 8 vuelta',
              onClicked: () { action8v(); 
              Navigator.pop(context);}
            ),
             buildMenuItem(//===============================pedir linea 8
              text: 'ver buses lin 8',
              onClicked: () { 
                action8iv();
                getCurrentLocationCar();
                Navigator.pop(context);
              }
            ),
            buildMenuItem(
              text: 'linea 9',
              onClicked: () { action9(); 
              Navigator.pop(context);}
            ),
             buildMenuItem(
              text: 'linea 9 vuelta',
              onClicked: () { action9v(); 
              Navigator.pop(context);}
            ),
             buildMenuItem(//===============================pedir linea 9
              text: 'ver buses lin 9',
              onClicked: () { 
                action9iv();
                getCurrentLocationCar();
                Navigator.pop(context);
              }
            ),
            buildMenuItem(
              text: 'linea 10',
              onClicked: () { action10(); 
              Navigator.pop(context);}
            ),
             buildMenuItem(
              text: 'linea 10 vuelta',
              onClicked: () { action10v(); 
              Navigator.pop(context);}
            ),
             buildMenuItem(//===============================pedir linea 10
              text: 'ver buses lin1',
              onClicked: () { 
                action10iv();
                getCurrentLocationCar();
                Navigator.pop(context);
              }
            ),
            buildMenuItem(
              text: 'linea 11',
              onClicked: () { action11(); 
              Navigator.pop(context);}
            ),
            buildMenuItem(
              text: 'linea 11 vuelta',
              onClicked: () { action11v(); 
              Navigator.pop(context);}
            ),
             buildMenuItem(//===============================pedir linea 11
              text: 'ver buses lin 11',
              onClicked: () { 
                action11iv();
                getCurrentLocationCar();
                Navigator.pop(context);
              }
            ),
            buildMenuItem(
              text: 'linea 16',
              onClicked: () { action16(); 
              Navigator.pop(context);}
            ),
            buildMenuItem(
              text: 'linea 16 vuelta',
              onClicked: () { action16v(); 
              Navigator.pop(context);}
            ),
             buildMenuItem(//===============================pedir linea 16
              text: 'ver buses lin 16',
              onClicked: () { 
                action16iv();
                getCurrentLocationCar();
                Navigator.pop(context);
              }
            ),
            buildMenuItem(
              text: 'linea 17',
              onClicked: () { action17(); 
              Navigator.pop(context);}
            ),
             buildMenuItem(
              text: 'linea 17 vuelta',
              onClicked: () { action17v(); 
              Navigator.pop(context);}
            ),
             buildMenuItem(//===============================pedir linea 17
              text: 'ver buses lin 17',
              onClicked: () { 
                action17iv();
                getCurrentLocationCar();
                Navigator.pop(context);
              }
            ),
            buildMenuItem(
              text: 'linea 18',
              onClicked: () { action18(); 
              Navigator.pop(context);}
            ),
            buildMenuItem(
              text: 'linea 18 vuelta',
              onClicked: () { action18v(); 
              Navigator.pop(context);}
            ),
             buildMenuItem(//===============================pedir linea 18
              text: 'ver buses lin 18',
              onClicked: () { 
                action18iv();
                getCurrentLocationCar();
                Navigator.pop(context);
              }
            ),

            //LINEAS DE VUELTA
           /* buildMenuItem(
              text: 'linea 1 vuelta',
              onClicked: () { 
                action1v();
                Navigator.pop(context);
              }
            ),
            buildMenuItem(
              text: 'linea 2 vuelta',
              onClicked: () {
               action2v(); 
              Navigator.pop(context);}
            ),
            buildMenuItem(
              text: 'linea 5 vuelta',
              onClicked: () {
               action5v(); 
              Navigator.pop(context);}
            ),
            buildMenuItem(
              text: 'linea 8 vuelta',
              onClicked: () { action8v(); 
              Navigator.pop(context);}
            ),
            buildMenuItem(
              text: 'linea 9 vuelta',
              onClicked: () { action9v(); 
              Navigator.pop(context);}
            ),
            buildMenuItem(
              text: 'linea 10 vuelta',
              onClicked: () { action10v(); 
              Navigator.pop(context);}
            ),
            buildMenuItem(
              text: 'linea 11 vuelta',
              onClicked: () { action11v(); 
              Navigator.pop(context);}
            ),
            buildMenuItem(
              text: 'linea 16 vuelta',
              onClicked: () { action16v(); 
              Navigator.pop(context);}
            ),
            buildMenuItem(
              text: 'linea 17 vuelta',
              onClicked: () { action17v(); 
              Navigator.pop(context);}
            ),
            buildMenuItem(
              text: 'linea 18 vuelta',
              onClicked: () { action18v(); 
              Navigator.pop(context);}
            ),*/
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

  
  void _addMarker(LatLng pos) {
    getlinesinfo(pos.latitude, pos.longitude);
    if (_specificLoc == null ) {
      setState(() {
        _specificLoc = Marker(
          markerId: const MarkerId('ubicacion'),
          //infoWindow: const InfoWindow(title: 'ubicacion'),
         
          infoWindow: InfoWindow(
                title: 'Lineas dentro de rango',
                snippet: lineasenc,

              ),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          position: pos,
        );
      });
    } else{
      setState(() {
        _specificLoc = Marker(
          markerId: const MarkerId('ubicacion'),
          infoWindow: InfoWindow(
                title: 'Lineas dentro de rango',
                snippet: lineasenc,

              ),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          position: pos,
        );
      });
    }
  }
  //function to get car image
  Future<Uint8List> getMarkerCar() async {
    ByteData byteData =
        await DefaultAssetBundle.of(context).load("lib/assets/images/auto.png");
    return byteData.buffer.asUint8List();
  }

  //Function for updateMarkerAndCircle
  void updateMarker(LocationData newLocalData, Uint8List imageData) {
    LatLng latlng = LatLng(newLocalData.latitude!, newLocalData.longitude!);
    this.setState(() {
      _specificLoc = Marker(
          markerId: MarkerId("marcador"),
          position: latlng,
          rotation: newLocalData.heading!,
          draggable: false,
          zIndex: 2,
          flat: true,
          anchor: Offset(0.5, 0.5),
          icon: BitmapDescriptor.fromBytes(imageData));
      circlenew = Circle(
          circleId: CircleId("carro"),
          radius: newLocalData.accuracy!,
          zIndex: 1,
          strokeColor: Colors.blue,
          center: latlng,
          fillColor: Colors.blue.withAlpha(70));
    });
  }

  //Function for capture your current position
  void getCurrentLocationCar() async {
    try {
      Uint8List imageData = await getMarkerCar();
      var location = await _tracker.getLocation(); //aqui podriamos llamar datos de la db

      updateMarker(location, imageData);

      if (_streamSubscription != null) {
        _streamSubscription?.cancel();
      }

      _streamSubscription = _tracker.onLocationChanged.listen((newLocalData) {
        if (_googleMapController != null) {
          _googleMapController
              ?.animateCamera(CameraUpdate.newCameraPosition(new CameraPosition(
                  bearing: 100,
                  target: LatLng(newLocalData.latitude!, newLocalData.longitude!),
                  tilt: 0,
                  zoom: 13.00)));
          updateMarker(newLocalData, imageData);
        }
      });
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        debugPrint("Permission Denied");
      }
    }
  }

}





