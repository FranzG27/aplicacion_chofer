import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:aplicacion_chofer/routes/rutas.dart';




 Set<Polyline> linea5 = {
        
         const Polyline(
            polylineId:  PolylineId('lin5i'),
            color:  Colors.blue,
            width: 5,
            points: rutalin5ida
          ),
          // const Polyline(
          //   polylineId:  PolylineId('lin5v'),
          //   color:  Colors.green,
          //   width: 5,
          //   points: rutalin5vuelta
          //   ),
        };