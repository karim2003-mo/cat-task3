import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task2/cubit/allstates.dart';
import 'package:task2/cubit/cubitstates.dart';
import 'package:task2/stdpixels/stdpixel.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  late double screenwidth;
  late double screenheight;
  @override
  Widget build(BuildContext context) {
    screenwidth = MediaQuery.of(context).size.width;
    screenheight = MediaQuery.of(context).size.height;
    Pixel pixel = Pixel(screenwidth: screenwidth, screenheight: screenheight);
    return BlocBuilder<Screen1Cubit, Screen1State>(
      builder: (context, state) {
        if(state is Loading){
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(state.Localization["screen1"]["title"],
            style: GoogleFonts.poppins(
              fontSize: 12*pixel.horizontalpixel(),
              fontWeight: FontWeight.bold
              )
            ),
          ),
          body: Padding(
            padding: EdgeInsets.only(top:  10*pixel.verticalpixel(),left:5*pixel.horizontalpixel(),right:5*pixel.horizontalpixel()),
            child: Column(
              children: [
                Container(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10*pixel.verticalpixel()),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          onTap: (){
                            context.read<Screen1Cubit>().englishlanguage();
                          },
                          child: Container(
                            width: double.infinity,
                            height: 28*pixel.verticalpixel(),
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(251, 251, 251, 1),
                              borderRadius: BorderRadius.circular(7*pixel.horizontalpixel()),
                              border: (state is Screen1EnglishLang)? Border.all(
                                color: Color.fromRGBO(0, 123, 255, 1),
                                width: 1*pixel.horizontalpixel()
                              ):Border.all(
                                width: 0,
                                color: Color.fromRGBO(251, 251, 251, 1)
                              )
                            ),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  margin: EdgeInsets.only(left: 5*pixel.horizontalpixel()),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        "assets/images/Eng.svg",
                                        width: 20*pixel.horizontalpixel(),
                                        height: 20*pixel.verticalpixel(),
                                      ),
                                      Text("English",
                                      style: GoogleFonts.poppins(
                                        fontSize: 15*pixel.horizontalpixel(),
                                        fontWeight: FontWeight.w600
                                        )
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10*pixel.verticalpixel()),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          onTap: (){
                            context.read<Screen1Cubit>().arabiclanguage();
                          },
                          child: Container(
                            width: double.infinity,
                            height: 28*pixel.verticalpixel(),
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(251, 251, 251, 1),
                              borderRadius: BorderRadius.circular(7*pixel.horizontalpixel()),
                              border: (state is Screen1ArabicLang)? Border.all(
                                color: Color.fromRGBO(0, 123, 255, 1),
                                width: 1*pixel.horizontalpixel()
                              ):Border.all(
                                width: 0,
                                color: Color.fromRGBO(251, 251, 251, 1)
                              )
                            ),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  margin: EdgeInsets.only(left: 5*pixel.horizontalpixel()),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        "assets/images/Ar.svg",
                                        width: 20*pixel.horizontalpixel(),
                                        height: 20*pixel.verticalpixel(),
                                      ),
                                      Text("العربية",
                                      style: GoogleFonts.poppins(
                                        fontSize: 15*pixel.horizontalpixel(),
                                        fontWeight: FontWeight.w600
                                        )
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10*pixel.verticalpixel()),
                        child: Row(
                          children: [
                            Text(state.Localization["screen1"]["hint"],
                            style: GoogleFonts.montserrat(
                              fontSize: 8*pixel.horizontalpixel(),
                              color: Color.fromRGBO(153, 143, 143, 1),
                              fontWeight: FontWeight.w400,
                              )
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 20*pixel.verticalpixel()),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(double.infinity, 25*pixel.verticalpixel()),
                      backgroundColor: Color.fromRGBO(0, 123, 255, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7*pixel.horizontalpixel())
                      ),
                    ),
                    onPressed: (){
                      Navigator.of(context).pushNamed("identity",arguments: state.Localization);
                    }, child: Text(state.Localization["screen1"]["buttontext"],
                    style: GoogleFonts.poppins(
                      fontSize: 12*pixel.horizontalpixel(),
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontWeight: FontWeight.w600
                      )
                    )),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
