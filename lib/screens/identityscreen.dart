import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task2/cubit/allstates.dart';
import 'package:task2/cubit/cubitstates.dart';
import 'package:task2/stdpixels/stdpixel.dart';

class Identity extends StatefulWidget {
  const Identity({super.key});

  @override
  _IdentityState createState() => _IdentityState();
}

class _IdentityState extends State<Identity> {
  Map<String, dynamic>? args;
  late double _screenwidth;
  late double _screenheight;
  int selectedcard = 2;
  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    _screenwidth = MediaQuery.of(context).size.width;
    _screenheight = MediaQuery.of(context).size.height;
    Pixel pixel = Pixel(screenwidth: _screenwidth, screenheight: _screenheight);
    print(selectedcard);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(args!["screen2"]["title"],
            style: GoogleFonts.poppins(
                fontSize: 12 * pixel.horizontalpixel(),
                fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: EdgeInsets.only(
            top: 2 * pixel.verticalpixel(),
            left: 5 * pixel.horizontalpixel(),
            right: 5 * pixel.horizontalpixel()),
        child: Column(
          children: [
            Center(
              child: SizedBox(
                width: 130 * pixel.horizontalpixel(),
                height: 25 * pixel.verticalpixel(),
                child: Text(args!['screen2']['subtitle'],
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 8 * pixel.horizontalpixel(),
                      color: Color.fromRGBO(118, 122, 126, 1),
                      fontWeight: FontWeight.w400,
                    )),
              ),
            ),
            BlocProvider(
              create: (context) => CubitIdentityCardShape(),
              child: SizedBox(
                width: double.infinity,
                height: 100 * pixel.verticalpixel(),
                child: GridView.builder(
                    itemCount: 2,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: 0.75,
                    ),
                    itemBuilder: (context, index) {
                      List<Map<String, dynamic>> data = [
                        {
                          "image": "assets/images/designer.png",
                          "role": args!["screen2"]["role1"]
                        },
                        {
                          "image": "assets/images/client.png",
                          "role": args!["screen2"]["role2"]
                        }
                      ];
                      return BlocBuilder<CubitIdentityCardShape,
                          IdentityCardShape>(
                        builder: (context, state) {
                          return InkWell(
                            onTap: () {
                              selectedcard = index;
                              context.read<CubitIdentityCardShape>().selected();
                              if(selectedcard!=2){
                                context.read<CubitIdentityButtonColor>().blue();
                              }
                            },
                            child: Card(
                              color: Color.fromRGBO(251, 251, 251, 1),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  side: BorderSide(
                                      width: pixel.verticalpixel(),
                                      color: (state is Selected &&
                                              selectedcard == index)
                                          ? Color.fromRGBO(0, 123, 255, 1)
                                          : Color.fromRGBO(251, 251, 251, 1))),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(
                                    child: SizedBox(
                                      width: 40 * pixel.horizontalpixel(),
                                      child: Image.asset(
                                        data[index]['image'],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 20),
                                    child: Text(
                                      data[index]['role'],
                                      style: GoogleFonts.poppins(
                                          fontSize:
                                              12 * pixel.horizontalpixel(),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }),
              ),
            ),
            BlocListener<CubitIdentityButtonColor,IdentityButtonColor>(
              listener: (BuildContext context,state) { },
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 20 * pixel.verticalpixel()),
                child: BlocBuilder<CubitIdentityButtonColor, IdentityButtonColor>(
                  builder: (context, state) {
                    return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize:
                              Size(double.infinity, 25 * pixel.verticalpixel()),
                          backgroundColor:(state is IdentityBluecolor&& selectedcard!=2)? Color.fromRGBO(0, 123, 255, 1):
                          Color.fromRGBO(204, 204, 204, 1)
                          ,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  7 * pixel.horizontalpixel())),
                        ),
                        onPressed: () {
                          context.read<ButtonCubit>().gry();
                          Navigator.of(context)
                              .pushNamed("phone", arguments: args);
                        },
                        child: Text(args!["screen2"]["buttontext"],
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
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    selectedcard=2;
  }
}
