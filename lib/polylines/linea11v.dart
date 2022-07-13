import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:aplicacion_chofer/routes/rutas.dart';



 Set<Polyline> linea11v = {
        
        
          const Polyline(
            polylineId:  PolylineId('lin11v'),
            color:  Colors.green,
            width: 5,
            points: rutalin11vuelta
            ),
        };