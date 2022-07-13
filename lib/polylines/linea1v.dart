import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:aplicacion_chofer/routes/rutas.dart';

//==================

import 'package:aplicacion_chofer/Business/EntryPointBusiness.dart';
import 'package:aplicacion_chofer/Data/DataResponse.dart';
import 'package:aplicacion_chofer/Entities/EntryPoint.dart';



 Set<Polyline> linea1v = {
        
        
          const Polyline(
            polylineId:  PolylineId('lin1v'),
            color:  Colors.green,
            width: 5,
            points: rutalin1vuelta
            ),
        };
      