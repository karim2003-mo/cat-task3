import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task2/cubit/allstates.dart';
import 'package:task2/cubit/cubitstates.dart';
import 'package:task2/stdpixels/stdpixel.dart';

class CreateAccountScreen extends StatefulWidget {
  @override
  State<CreateAccountScreen> createState() => CreateAccountScreenState();
}

class CreateAccountScreenState extends State<CreateAccountScreen> {
  late Map<String, dynamic> _args;
  late double screenwidth;
  late double screenheight;
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    screenwidth = MediaQuery.of(context).size.width;
    screenheight = MediaQuery.of(context).size.height;
    Pixel _pixel = Pixel(screenwidth: screenwidth, screenheight: screenheight);
    _args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
        body: Center(
            child: Container(
                margin: EdgeInsets.only(
                    top: 30 * _pixel.verticalpixel(),
                    left: 10 * _pixel.horizontalpixel(),
                    right: 10 * _pixel.horizontalpixel()),
                child: Column(children: [
                  SizedBox(
                    width: 45 * _pixel.horizontalpixel(),
                    child: Image.asset("assets/splash_image/app_icon.png"),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 20 * _pixel.verticalpixel(),
                    ),
                    child: Text(
                      _args["screen5"]["title"],
                      style: GoogleFonts.poppins(
                          fontSize: 14 * _pixel.horizontalpixel(),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10 * _pixel.verticalpixel()),
                    width: 120 * _pixel.horizontalpixel(),
                    child: Text(_args["screen5"]["subtitle"],
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 8 * _pixel.horizontalpixel(),
                          color: Color.fromRGBO(118, 122, 126, 1),
                          fontWeight: FontWeight.w400,
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10 * _pixel.verticalpixel()),
                    width: double.infinity,
                    child: TextField(
                      controller: name,
                      onChanged: (value) {},
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.person,
                            size: 15 * _pixel.horizontalpixel(),
                          ),
                          enabledBorder: InputBorder.none,
                          hintText: _args["screen5"]["namefeild"]),
                    ),
                  ),
                  BlocProvider(
                    create: (context) => CubitVisiblePass(),
                    child: Container(
                      margin: EdgeInsets.only(top: 10 * _pixel.verticalpixel()),
                      width: double.infinity,
                      child: BlocBuilder<CubitVisiblePass, PassVisibility>(
                        builder: (context, state) {
                          return TextField(
                            controller: password,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: (state is Visible)?false:true,
                            onChanged: (value) {},
                            decoration: InputDecoration(
                                suffixIcon:
                                    InkWell(
                                        onTap: () {
                                          if (state is InVisible)
                                            context
                                                .read<CubitVisiblePass>()
                                                .visible();
                                          else {
                                            context
                                                .read<CubitVisiblePass>()
                                                .invisible();
                                          }
                                        },
                                        child: (state is InVisible)
                                            ? Icon(Icons.visibility_off)
                                            : Icon(Icons.visibility)),
                                  
                                
                                enabledBorder: InputBorder.none,
                                hintText: _args["screen5"]["pass"]),
                          );
                        },
                      ),
                    ),
                  ),BlocProvider(
                    create: (context) => CubitConfirmPassVisibility(),
                    child: Container(
                      margin: EdgeInsets.only(top: 10 * _pixel.verticalpixel()),
                      width: double.infinity,
                      child: BlocBuilder<CubitConfirmPassVisibility, ConfirmPassVisibility>(
                        builder: (context, state) {
                          return TextField(
                            controller: confirmpassword,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: (state is ConfirmVisible)?false:true,
                            onChanged: (value) {},
                            decoration: InputDecoration(
                                suffixIcon:
                                    InkWell(
                                        onTap: () {
                                          if (state is ConfirmInVisible)
                                            context
                                                .read<CubitConfirmPassVisibility>()
                                                .visible();
                                          else {
                                            context
                                                .read<CubitConfirmPassVisibility>()
                                                .invisible();
                                          }
                                        },
                                        child: (state is ConfirmInVisible)
                                            ? Icon(Icons.visibility_off)
                                            : Icon(Icons.visibility)),
                                  
                                
                                enabledBorder: InputBorder.none,
                                hintText: _args["screen5"]["confirmpass"]),
                          );
                        },
                      ),
                    ),
                  ),
                  Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 20 * _pixel.verticalpixel()),
                child:ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize:
                              Size(double.infinity, 25 * _pixel.verticalpixel()),
                          backgroundColor:Color.fromRGBO(0, 123, 255, 1)
                          
                          ,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  7 * _pixel.horizontalpixel())),
                        ),
                        onPressed: (){
                        },
                        child: Text(_args["screen5"]["buttontext"],
                            style: GoogleFonts.poppins(
                                fontSize: 12 * _pixel.horizontalpixel(),
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontWeight: FontWeight.w600)))
                  
                
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 5*_pixel.verticalpixel()
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(_args["screen5"]["hint"],
                        style: GoogleFonts.poppins(
                          fontSize: 8 * _pixel.horizontalpixel(),
                          color: Color.fromRGBO(118, 122, 126, 1),
                          fontWeight: FontWeight.w400,
                        )),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          _args["screen5"]["textbtn"],
                          style: GoogleFonts.poppins(
                              color: Color.fromRGBO(0, 123, 255, 1),
                              fontSize: 8 * _pixel.horizontalpixel()),
                        ))
                  ],
                ),
              )
                ]))));
  }
}
