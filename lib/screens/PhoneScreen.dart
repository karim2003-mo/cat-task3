import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task2/cubit/allstates.dart';
import 'package:task2/cubit/cubitstates.dart';
import 'package:task2/stdpixels/stdpixel.dart';

class PhoneScreen extends StatefulWidget {
  const PhoneScreen({super.key});

  @override
  State<StatefulWidget> createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<StatefulWidget> {
  late Map<String, dynamic> _args;
  late double screenwidth;
  late double screenheight;
  TextEditingController phonenumber=TextEditingController();
  @override
  Widget build(BuildContext context) {
    screenwidth = MediaQuery.of(context).size.width;
    screenheight = MediaQuery.of(context).size.height;
    Pixel pixel = Pixel(screenwidth: screenwidth, screenheight: screenheight);
    _args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.only(
              top: 30 * pixel.verticalpixel(),
              left: 10 * pixel.horizontalpixel(),
              right: 10 * pixel.horizontalpixel()),
          child: Column(
            children: [
              SizedBox(
                width: 45 * pixel.horizontalpixel(),
                child: Image.asset("assets/splash_image/app_icon.png"),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 20 * pixel.verticalpixel(),
                ),
                child: Text(
                  _args["screen3"]["title"],
                  
                  style: GoogleFonts.poppins(
                      fontSize: 14 * pixel.horizontalpixel(),
                      fontWeight: FontWeight.bold),
                ),
              ),

                Container(
                  margin: EdgeInsets.only(
                    top: 15 * pixel.verticalpixel(),
                  ),
                  child: Text(_args["screen3"]["subtitle"],
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        
                        fontSize: 8 * pixel.horizontalpixel(),
                        color: Color.fromRGBO(118, 122, 126, 1),
                        fontWeight: FontWeight.w400,
                      )),
                ),
              
              Container(
                margin: EdgeInsets.only(
                    top: 20 * pixel.verticalpixel(),
                    left: 5 * pixel.horizontalpixel()),
                child: TextField(
                  controller: phonenumber,
                  onChanged:(value){
                    if(validatenumber(value))
                    context.read<ButtonCubit>().blue();
                    else
                    context.read<ButtonCubit>().gry();
                  } ,
                  decoration: InputDecoration(
                      icon: Icon(Icons.call),
                      enabledBorder: InputBorder.none,
                      hintText: _args["screen3"]["fieldhint"]),
                ),
              ),
              BlocListener<ButtonCubit,ButtonColor>(
              listener: (BuildContext context,state) { },
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 20 * pixel.verticalpixel()),
                child: BlocBuilder<ButtonCubit, ButtonColor>(
                  builder: (context, state) {
                    return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize:
                              Size(double.infinity, 25 * pixel.verticalpixel()),
                          backgroundColor:(state is Bluecolor)? Color.fromRGBO(0, 123, 255, 1):
                          Color.fromRGBO(204, 204, 204, 1)
                          ,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  7 * pixel.horizontalpixel())),
                        ),
                        onPressed:(state is Bluecolor)? () async{
                          Navigator.of(context).pushNamed("otpscreen",arguments: _args);
                        }:(){},
                        child: Text(_args["screen3"]["buttontext"],
                            style: GoogleFonts.poppins(
                                fontSize: 12 * pixel.horizontalpixel(),
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontWeight: FontWeight.w600)));
                  },
                ),
              ),
            )
          
            ],
          ),
        ),
      ),
    );
  }
  bool validatenumber(String phone){
    RegExp r= RegExp(r'^\+?\d{1,4}?[ -]?\(?\d{1,4}\)?[ -]?\d{1,4}[ -]?\d{1,9}$');
    return r.hasMatch(phone);

  }
}
