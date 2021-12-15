
import 'package:camapp/HomePage.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'BottomPictureContainer.dart';
import 'package:sizer/sizer.dart';


class ClickPicturePage extends StatefulWidget {
  final CameraDescription camera;
  const ClickPicturePage({Key? key, required this.camera}) : super(key: key);


  @override
  _ClickPicturePageState createState() => _ClickPicturePageState();
}

class _ClickPicturePageState extends State<ClickPicturePage> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.medium,
    );

    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      body: Column(
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 1.h,vertical: 3.h),
            child: Row(
              children: [

                ElevatedButton(
                  style:
                  ElevatedButton.styleFrom(shadowColor: Colors.black,
                  elevation: 5,primary: Color(0xff3E8B3A), shape: CircleBorder(),),

                  onPressed: (){

                  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage(camera: widget.camera)));

                    },

                  child:Icon(Icons.arrow_back,size: 6.h,),),],),),


          Container( height: 30.h,width: 90.w, decoration: BoxDecoration(image: DecorationImage(image:AssetImage('images/tig.png'),fit: BoxFit.fill )),),

          Expanded(child: BottomPictureContainer(initializeControllerFuture: _initializeControllerFuture, controller: _controller)),


        ],
      ),
    );
  }
}

