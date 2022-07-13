import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:aplicacion_chofer/routes/rutas.dart';



 Set<Polyline> linea18 = {
        
         const Polyline(
            polylineId:  PolylineId('lin18i'),
            color:  Colors.blue,
            
            width: 5,
            points: rutalin18ida
          ),
          // const Polyline(
          //   polylineId:  PolylineId('lin18v'),
          //   color:  Colors.green,
          //   width: 5,
          //   points: rutalin18vuelta
          //   ),
        };