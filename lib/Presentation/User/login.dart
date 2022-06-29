import 'package:flutter/material.dart';
import 'package:aplicacion_chofer/Business/UserBusiness.dart';
import 'package:aplicacion_chofer/Data/DataResponse.dart';
import 'package:aplicacion_chofer/assets/widgets/buttons.dart';
import 'package:aplicacion_chofer/assets/widgets/dialog.dart';
import 'package:aplicacion_chofer/assets/widgets/inputs.dart';
import 'package:aplicacion_chofer/assets/widgets/styles.dart';
import 'package:aplicacion_chofer/env.dart';
import 'package:aplicacion_chofer/route_generator.dart';


class Login extends StatefulWidget{
  const Login({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return __LoginState();
  }

}

class __LoginState extends State<Login>{
  UserBusiness userBusiness=new UserBusiness();

  final controllerEmail = TextEditingController();
  final controllerPass = TextEditingController();
  String email = "";
  String pass = "";

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    controllerEmail.addListener(() {
      email = controllerEmail.text;
    });
    controllerPass.addListener(() {
      pass = controllerPass.text;
    });
    return Scaffold(
      backgroundColor: Style().backgroundColor(),
      body: SafeArea(
        child: SizedBox.expand(
          child: Stack(
            children: <Widget>[
              //appBackground(),
              SingleChildScrollView(
                child: todo(context),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget todo(BuildContext context) {
    return
      SafeArea(
          child: Container(
            padding: EdgeInsets.all(20.0),
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                Image.asset(assetURL()+"logo.png", alignment: Alignment.center, height: 300, width: 300,),
                CustomInputField( Icon(Icons.person, color: Colors.white), "E-MAIL", controllerEmail, false),
                SizedBox(height: 20.0),
                CustomInputField( Icon(Icons.lock, color: Colors.white), "Contraseña", controllerPass, true),
                SizedBox(height: 20.0),
                buttonPrimary(context, "INICIAR SESION", login),
                SizedBox(height: 20.0),
                buttonSeccondary(context, "REGISTRARME", signUp),

              ],
            ),
          )
      );
  }

  Future<void> login() async{
    showLoadingIndicator(context,'Iniciando sesion');

    //DataResponse dataResponse=await userBusiness.login(email,pass);
    DataResponse dataResponse=await userBusiness.login('user@example.com','123123123');
    setState(() {
      hideOpenDialog(context);
      if (dataResponse.status){
        Navigator.pushReplacementNamed(context,menuRoute());
      }else{
        
        showAlertDialog(context, "Error al iniciar Sesion", dataResponse.message);
      }
    });
  }

  Future<void> signUp() async{
    Navigator.pushReplacementNamed(context, signupRoute());
  }




}



