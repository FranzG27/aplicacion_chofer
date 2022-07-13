import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:aplicacion_chofer/routes/rutas.dart';



 Set<Polyline> linea17 = {
        
         const Polyline(
            polylineId:  PolylineId('lin17i'),
            color:  Colors.blue,
            width: 5,
            points: rutalin17ida
          ),
          // const Polyline(
          //   polylineId:  PolylineId('lin17v'),
          //   color:  Colors.green,
          //   width: 5,
          //   points: rutalin17vuelta
          //   ),
        };