import 'package:aplicacion_chofer/Data/DataResponse.dart';
import 'package:aplicacion_chofer/Data/ChoferData.dart';
import 'package:aplicacion_chofer/Entities/Chofer.dart';
import 'package:aplicacion_chofer/env.dart';
import 'package:aplicacion_chofer/Session/UserSession.dart';


class ChoferBusiness{
  ChoferData choferData=new ChoferData();


  Future<DataResponse> index() async{
    String user_id='';

    DataResponse dataResponse=await choferData.index(UserSession.user.token ,user_id);
    return dataResponse;
  }

  Future<DataResponse> store(ci,fecha_nacimiento,sexo,telefono,categoria_licencia,foto,user_id) async{
    Chofer chofer=new Chofer();
    chofer.ci=ci;
    chofer.fecha_nacimiento=fecha_nacimiento;
    chofer.sexo=sexo;
    chofer.telefono=telefono;
    chofer.categoria_licencia=categoria_licencia;
    chofer.foto=foto;
    chofer.user_id=user_id;

    DataResponse dataResponse=await choferData.store(UserSession.user.token,chofer);
    return dataResponse;
  }

  Future<DataResponse> update(Chofer chofer) async{
    DataResponse dataResponse=await choferData.update(UserSession.user.token,chofer);
    return dataResponse;
  }

  Future<DataResponse> delete(String id) async{
    return await choferData.delete(UserSession.user.token,id);
  }


}