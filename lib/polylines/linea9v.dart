import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:aplicacion_chofer/routes/rutas.dart';



 Set<Polyline> linea9v = {
        
        
          const Polyline(
            polylineId:  PolylineId('lin9v'),
            color:  Colors.green,
            width: 5,
            points: rutalin9vuelta
            ),
        };