import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:aplicacion_chofer/routes/rutas.dart';



 Set<Polyline> linea16v = {
        
         
          const Polyline(
            polylineId:  PolylineId('lin16v'),
            color:  Colors.green,
            width: 5,
            points: rutalin16vuelta
            ),
        };