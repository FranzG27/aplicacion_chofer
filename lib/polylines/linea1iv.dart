import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:aplicacion_chofer/routes/rutas.dart';

//==================



 Set<Polyline> linea1iv = {
        
         const Polyline(
            polylineId:  PolylineId('lin1i'),
            color:  Colors.blue,
            width: 5,
            points: rutalin1ida
          ),
           const Polyline(
            polylineId:  PolylineId('lin1v'),
             color:  Colors.green,
            width: 5,
            points: rutalin1vuelta
           ),
        };
      