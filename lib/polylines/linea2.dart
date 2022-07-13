import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:aplicacion_chofer/routes/rutas.dart';




 Set<Polyline> linea2 = {
        
         const Polyline(
            polylineId:  PolylineId('lin2i'),
            color:  Colors.blue,
            width: 5,
            points: rutalin2ida
          ),
          // const Polyline(
          //   polylineId:  PolylineId('lin2v'),
          //   color:  Colors.green,
          //   width: 5,
          //   points: rutalin2vuelta
          //   ),
        };