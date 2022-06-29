import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:aplicacion_chofer/routes/rutas.dart';



 Set<Polyline> linea8 = {
        
         const Polyline(
            polylineId:  PolylineId('lin8i'),
            color:  Colors.blue,
            width: 5,
            points: rutalin8ida
          ),
          const Polyline(
            polylineId:  PolylineId('lin8v'),
            color:  Colors.green,
            width: 5,
            points: rutalin8vuelta
            ),
        };