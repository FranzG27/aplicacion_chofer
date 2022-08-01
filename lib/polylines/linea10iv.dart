import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:aplicacion_chofer/routes/rutas.dart';



 Set<Polyline> linea10iv = {
        
         const Polyline(
            polylineId:  PolylineId('lin10i'),
            color:  Colors.blue,
            width: 5,
            points: rutalin10ida
          ),
           const Polyline(
             polylineId:  PolylineId('lin10v'),
             color:  Colors.green,
             width: 5,
             points: rutalin10vuelta
             ),
        };