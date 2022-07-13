import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:aplicacion_chofer/routes/rutas.dart';




 Set<Polyline> linea5v = {
        
        
          const Polyline(
            polylineId:  PolylineId('lin5v'),
            color:  Colors.green,
            width: 5,
            points: rutalin5vuelta
            ),
        };