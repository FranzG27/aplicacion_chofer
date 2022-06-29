import 'package:flutter/material.dart';
import 'package:aplicacion_chofer/Business/PhotoBusiness.dart';
import 'package:aplicacion_chofer/Data/DataResponse.dart';
import 'package:aplicacion_chofer/Entities/Photo.dart';
import 'package:aplicacion_chofer/Presentation/Layouts/header.dart';
import 'package:aplicacion_chofer/Presentation/Photo/edit.dart';
import 'package:aplicacion_chofer/assets/widgets/dialog.dart';
import 'package:aplicacion_chofer/assets/widgets/styles.dart';
import 'package:aplicacion_chofer/route_generator.dart';

import 'package:aplicacion_chofer/env.dart';

class AllPhoto extends StatefulWidget{
  const AllPhoto({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return __AllPhotoState();
  }

}

class __AllPhotoState extends State<AllPhoto>{

  PhotoBusiness photoBusiness=new PhotoBusiness();
  List<Widget> listaDeCards=List.generate(0, (index) =>SizedBox(height: 1,));

  @override
  void initState() {
    super.initState();
    loadPhoto(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Style().backgroundColor(),
      appBar: headerAppBar(context),
      drawer: SideNav(),
      floatingActionButton:  FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context,photoCreateRoute());
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
                listOfPhoto()
              ],
            ),
          )
      );

  }

  void loadPhoto(BuildContext context) async{

    await Future.delayed(Duration(milliseconds: 10));
    showLoadingIndicator(context,'');
    DataResponse dataResponse=await photoBusiness.index();
    List<Photo> items=dataResponse.data;
    setState(() {
      hideOpenDialog(context);
      items.forEach((item) {
        var c = cardPhoto(context,item);
        listaDeCards.add(c);
      });
    });
  }

  Widget listOfPhoto() {
    return ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemCount: listaDeCards.length,
        padding: new EdgeInsets.only(top: 5.0),
        itemBuilder: (context, index) {
          return listaDeCards[index];
        });
  }

Widget cardPhoto(BuildContext context,Photo photo){
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
                                  Image.network(host+'/storage/'+photo.image,height: 50,),
                                  Text(photo.bus_id),

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
                              Navigator.pushNamed(context, photoEditRoute(),arguments: EditPhotoArguments(photo));
                            },
                          ),
                          SizedBox(width: 8,),
                          IconButton(
                            color: Style().primaryColor(),
                            icon: const Icon(Icons.delete),
                            onPressed: () async{
                              showAlertDialogOptions(context,"Delete Photo","¿Are you sure?",
                                      () async{
                                await deletePhoto(photo);
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

  Future<void> deletePhoto(Photo photo) async{
    showLoadingIndicator(context,'Deleting Photo...');
    DataResponse dataResponse=await photoBusiness.delete(photo.id);
    setState(() {
      hideOpenDialog(context);
      if (dataResponse.status){
        Navigator.pushReplacementNamed(context, photoAllRoute());
      }else{
        showAlertDialog(context, "Error deleting Photo", dataResponse.message);
      }
    });
  }

}

