import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'DispalayPictureScreen.dart';
import 'package:sizer/sizer.dart';

class BottomPictureContainer extends StatelessWidget {
  const BottomPictureContainer({
    Key? key,
    required Future<void> initializeControllerFuture,
    required CameraController controller,
  }) : _initializeControllerFuture = initializeControllerFuture, _controller = controller, super(key: key);

  final Future<void> _initializeControllerFuture;
  final CameraController _controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xffF4F4F4),
          borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40))
      ),

      child: Column(
        children: [

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 1.h,vertical: 4.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Image(image: AssetImage('images/Vector (8).png')),
                SizedBox(width: 2.5.w,),

                FutureBuilder<void>(
                  future: _initializeControllerFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return ClipRRect(

                          borderRadius: BorderRadius.circular(300),
                          child: Container(
                            width: 200,
                            height: 200,

                            child: AspectRatio(aspectRatio: 1,
                                child: CameraPreview(_controller)),
                          ));
                    } else {
                      // Otherwise, display a loading indicator.
                      return const Center(child: CircularProgressIndicator());
                    }
                  },


                ),
                SizedBox(width: 2.5.w,),
                Image(image: AssetImage('images/Vector (9).png')),

              ],
            ),
          ),
          Text('Click your meal',style: GoogleFonts.andika(
              color: Color(0xff3C3C3C),
              fontWeight: FontWeight.w400,
              fontSize: 20.sp
          ),),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 1.h,vertical: 1.h),
            child: SizedBox(
              height: 64,width: 64,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shadowColor: Colors.black,
                      elevation: 5,
                      primary: Color(0xff3E8B3A),
                      shape: CircleBorder()
                  ), onPressed: () async {
                try {
                  await _initializeControllerFuture;
                  final image = await _controller.takePicture();
                  await Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DisplayPictureScreen1(
                        imagePath: image.path,
                      ),
                    ),
                  );
                } catch (e) {
                  print(e);
                }
              },child: Image(image: AssetImage('images/Vector (7).png'),)),
            ),
          )
        ],
      ),
    );
  }
}

