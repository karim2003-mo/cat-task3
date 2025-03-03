import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task2/cubit/allstates.dart';
import 'package:task2/cubit/cubitstates.dart';
import 'package:task2/stdpixels/stdpixel.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OtpScreen extends StatefulWidget {
  @override
  State<OtpScreen> createState() => OtpScreenState();
}

class OtpScreenState extends State<OtpScreen> {
  late Map<String, dynamic> _args;
  late double screenwidth;
  late double screenheight;
  String otp = "";
  @override
  Widget build(BuildContext context) {
    screenwidth = MediaQuery.of(context).size.width;
    screenheight = MediaQuery.of(context).size.height;
    Pixel _pixel = Pixel(screenwidth: screenwidth, screenheight: screenheight);
    _args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return BlocProvider(
      create: (context) => CubitOtp(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(_args["screen4"]["title"],
              style: GoogleFonts.poppins(
                  fontSize: 12 * _pixel.horizontalpixel(),
                  fontWeight: FontWeight.bold)),
        ),
        body: Container(
          margin: EdgeInsets.only(
              top: 5 * _pixel.verticalpixel(),
              left: 10 * _pixel.horizontalpixel(),
              right: 10 * _pixel.horizontalpixel()),
          child: Column(
            children: [
              Container(
                child: Text(_args["screen4"]["subtitle"],
                    style: GoogleFonts.poppins(
                      fontSize: 8 * _pixel.horizontalpixel(),
                      color: Color.fromRGBO(118, 122, 126, 1),
                      fontWeight: FontWeight.w400,
                    )),
              ),
              BlocBuilder<CubitOtp, OtpBorderColer>(
                builder: (context, state) {
                  return Container(
                    margin: EdgeInsets.only(top: 20 * _pixel.verticalpixel()),
                    child: OtpTextField(
                      numberOfFields: 4, // Number of OTP digits
                      enabledBorderColor:(state is RedOtp)? Colors.red:Colors.blue,
                      showFieldAsBox: true,
                      onSubmit: (String code) {
                        otp = code;
                        context.read<CubitVerifyButtonColor>().blue();
                      },
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      fieldWidth: 35 * _pixel.horizontalpixel(),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  );
                },
              ),
              Container(
                margin: EdgeInsets.only(top: 20 * _pixel.verticalpixel()),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(_args["screen4"]["proplem"],
                        style: GoogleFonts.poppins(
                          fontSize: 8 * _pixel.horizontalpixel(),
                          color: Color.fromRGBO(118, 122, 126, 1),
                          fontWeight: FontWeight.w400,
                        )),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          _args["screen4"]["textbtn"],
                          style: GoogleFonts.poppins(
                              color: Color.fromRGBO(0, 123, 255, 1),
                              fontSize: 8 * _pixel.horizontalpixel()),
                        ))
                  ],
                ),
              ),
              BlocListener<CubitVerifyButtonColor, VerifyButtonColor>(
                listener: (BuildContext context, state) {},
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 20 * _pixel.verticalpixel()),
                  child: BlocBuilder<CubitVerifyButtonColor, VerifyButtonColor>(
                    builder: (context, state) {
                      return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(
                                double.infinity, 25 * _pixel.verticalpixel()),
                            backgroundColor:
                                (state is VerifyBluecolor &&otp.length == 4)
                                    ? Color.fromRGBO(0, 123, 255, 1)
                                    : Color.fromRGBO(204, 204, 204, 1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    7 * _pixel.horizontalpixel())),
                          ),
                          onPressed:
                              (state is VerifyBluecolor && otp.length == 4)
                                  ? () async {
                                    if(checkotp(otp)){
                                      Navigator.of(context).pushReplacementNamed(
                                          "accountscreen",
                                          arguments: _args);
                                    }
                                    else{
                                      context.read<CubitOtp>().red();
                                    }
                                    }
                                  : () {},
                          child: Text(_args["screen4"]["buttontext"],
                              style: GoogleFonts.poppins(
                                  fontSize: 12 * _pixel.horizontalpixel(),
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  fontWeight: FontWeight.w600)));
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool checkotp(String otp) {
    return otp == Otp.OTP.value;
  }
}

enum Otp {
  OTP("1111");

  final String value;
  const Otp(this.value);
}
