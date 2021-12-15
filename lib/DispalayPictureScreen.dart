import 'dart:io';
import 'package:camapp/MessagePage.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:sizer/sizer.dart';

class DisplayPictureScreen1 extends StatefulWidget {

  final String imagePath;

  const DisplayPictureScreen1({Key? key, required this.imagePath})
      : super(key: key);

  @override
  _DisplayPictureScreen1State createState() => _DisplayPictureScreen1State();
}

class _DisplayPictureScreen1State extends State<DisplayPictureScreen1> {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),

      body:
      Column(
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 1.h,vertical: 3.h),
            child: Row(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shadowColor: Colors.black,
                    elevation: 5,

                    primary: Color(0xff3E8B3A),
                    shape: CircleBorder(),

                  ),
                  onPressed: (){}, child:Icon(Icons.arrow_back,size: 45,),),
              ],
            ),
          ),
          Container(
            height: 30.h,width: 90.w,
            decoration: BoxDecoration(
                image: DecorationImage(image:AssetImage('images/tig.png'),fit: BoxFit.fill )
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xffF4F4F4),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40))
              ),
              child: Column(
                children: [

                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 35),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(300),
                          child: Container(
                           height: 200,width: 200,
                            decoration: BoxDecoration(


                            image: DecorationImage(image: FileImage(File(widget.imagePath)),fit: BoxFit.fill)
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text('Will you eat this?',style: GoogleFonts.andika(
                      color: Color(0xff3C3C3C),
                      fontWeight: FontWeight.w400,
                      fontSize: 20.sp
                  ),),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    child: SizedBox(
                      height: 64,width: 64,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shadowColor: Colors.black,
                            elevation: 5,

                          primary: Color(0xff3E8B3A), shape: CircleBorder()
                        ),
                        onPressed: ()
                          {
                            setState(() {

                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Message()));
                              storage.ref().child('folder/image').putFile(File(widget.imagePath));
                      });
                      }, child:  Image(image: AssetImage('images/Vector (10).png')),),
                    ),
                  )
                ],
              ),
            ),
          ),

        ],
      ),

    );
  }
}
