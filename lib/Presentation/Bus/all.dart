import 'package:flutter/material.dart';
import 'package:aplicacion_chofer/Business/BusBusiness.dart';
import 'package:aplicacion_chofer/Data/DataResponse.dart';
import 'package:aplicacion_chofer/Entities/Bus.dart';
import 'package:aplicacion_chofer/Presentation/Layouts/header.dart';
import 'package:aplicacion_chofer/Presentation/Bus/edit.dart';
import 'package:aplicacion_chofer/assets/widgets/dialog.dart';
import 'package:aplicacion_chofer/assets/widgets/styles.dart';
import 'package:aplicacion_chofer/route_generator.dart';

import 'package:aplicacion_chofer/env.dart';

class AllBus extends StatefulWidget{
  const AllBus({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return __AllBusState();
  }

}

class __AllBusState extends State<AllBus>{

  BusBusiness busBusiness=new BusBusiness();
  List<Widget> listaDeCards=List.generate(0, (index) =>SizedBox(height: 1,));

  @override
  void initState() {
    super.initState();
    loadBus(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Style().backgroundColor(),
      appBar: headerAppBar(context),
      drawer: SideNav(),
      floatingActionButton:  FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context,busCreateRoute());
          },
          child: const Icon(Icons.add),
          backgroundColor: Colors.black
      ),
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
                //searchBar(context),
                listOfBus()
              ],
            ),
          )
      );

  }

  void loadBus(BuildContext context) async{

    await Future.delayed(Duration(milliseconds: 10));
    showLoadingIndicator(context,'');
    DataResponse dataResponse=await busBusiness.index();
    List<Bus> items=dataResponse.data;
    setState(() {
      hideOpenDialog(context);
      items.forEach((item) {
        var c = cardBus(context,item);
        listaDeCards.add(c);
      });
    });
  }

  Widget listOfBus() {
    return ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemCount: listaDeCards.length,
        padding: new EdgeInsets.only(top: 5.0),
        itemBuilder: (context, index) {
          return listaDeCards[index];
        });
  }

Widget cardBus(BuildContext context,Bus bus){
    return Card(
      child:Container(
        height: 200,
        color: Style().backgroundColor(),
        child: Row(
          children: [
            Expanded(
              child:Container(
                alignment: Alignment.topLeft,
                child: Column(
                  children: [
                    Expanded(
                      flex: 5,
                      child: InkWell(
                        child: SingleChildScrollView(
                            child: Container(
                              padding: EdgeInsets.all(10.0),
                              alignment: Alignment.center,
                              child: Column(
                                children: <Widget>[
                                  Text(bus.placa),
                                  Text(bus.modelo),
                                  Text(bus.cantidad_asientos),
                                  Text(bus.fecha_asignacion),
                                  Text(bus.fecha_baja),
                                  Text(bus.numero_interno),
                                  Text(bus.esta_en_recorrido.toString()),
                                  Text(bus.user_id),
                                  Text(bus.bus_route_id),

                                ],
                              ),
                            )
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            color: Style().primaryColor(),
                            icon: const Icon(Icons.edit),
                            onPressed: () {
                              Navigator.pushNamed(context, busEditRoute(),arguments: EditBusArguments(bus));
                            },
                          ),
                          SizedBox(width: 8,),
                          IconButton(
                            color: Style().primaryColor(),
                            icon: const Icon(Icons.delete),
                            onPressed: () async{
                              showAlertDialogOptions(context,"Delete Bus","¿Are you sure?",
                                      () async{
                                await deleteBus(bus);
                              });
                            },
                          ),
                          SizedBox(width: 8,)
                        ],
                      ),
                    )
                  ],
                ),
              ),
              flex:8 ,
            ),
          ],
        ),
      ),
      elevation: 8,
      margin: EdgeInsets.all(10),
    );
  }

  Future<void> deleteBus(Bus bus) async{
    showLoadingIndicator(context,'Deleting Bus...');
    DataResponse dataResponse=await busBusiness.delete(bus.id);
    setState(() {
      hideOpenDialog(context);
      if (dataResponse.status){
        Navigator.pushReplacementNamed(context, busAllRoute());
      }else{
        showAlertDialog(context, "Error deleting Bus", dataResponse.message);
      }
    });
  }

}

