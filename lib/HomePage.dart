import 'package:camapp/ClickPicturePage.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';



class HomePage extends StatefulWidget {
  final CameraDescription camera;
  const HomePage({Key? key, required this.camera}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),

      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            bottom: 10.h,
            child: ElevatedButton(

              style: ElevatedButton.styleFrom(
                shadowColor: Colors.black,
                elevation: 5,
                minimumSize: Size(225, 50),
                primary: Color(0xff3E8B3A),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0)
                ),

              ),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ClickPicturePage(camera: widget.camera,)));
              },
              child: Text('Share your meal',style: GoogleFonts.andika(
                fontSize: 20.sp,
                fontWeight: FontWeight.w400,
                  color: Color(0xffFAFAFA),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
