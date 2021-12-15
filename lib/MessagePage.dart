import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';


class Message extends StatefulWidget {
  const Message({Key? key}) : super(key: key);

  @override
  _MessageState createState() => _MessageState();
}

class _MessageState extends State<Message> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffE5E5E5),

        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 1.h,vertical: 1.h),
          child: Center(
            child: Text('THANKS FOR SHARING\nFOOD WITH ME',style: GoogleFonts.lilitaOne(
              fontSize: 25.sp,
              fontWeight: FontWeight.w400,
              color: Color(0xff3E8B3A)
            ),),
          ),
        )
    );
  }
}
