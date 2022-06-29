import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:aplicacion_chofer/routes/rutas.dart';

//==================

import 'package:aplicacion_chofer/Business/EntryPointBusiness.dart';
import 'package:aplicacion_chofer/Data/DataResponse.dart';
import 'package:aplicacion_chofer/Entities/EntryPoint.dart';

void loadEntryPoint(BuildContext context) async{
  EntryPointBusiness entrypointBusiness=new EntryPointBusiness();
  DataResponse dataResponse=await entrypointBusiness.indexParamLatLong('1');
}

void loadExitPoint(BuildContext context) async{
  EntryPointBusiness entrypointBusiness=new EntryPointBusiness();
  DataResponse dataResponse=await entrypointBusiness.indexParamLatLong('1');
}

 Set<Polyline> linea1 = {
        
         const Polyline(
            polylineId:  PolylineId('lin1i'),
            color:  Colors.blue,
            width: 5,
            points: rutalin1ida
          ),
          const Polyline(
            polylineId:  PolylineId('lin1v'),
            color:  Colors.green,
            width: 5,
            points: rutalin1vuelta
            ),
        };
      