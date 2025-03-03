import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task2/cubit/cubitstates.dart';
import 'package:task2/screens/PhoneScreen.dart';
import 'package:task2/screens/identityscreen.dart';
import 'package:task2/screens/language.dart';
import 'package:task2/screens/verificationotp.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiBlocProvider(providers: [
      BlocProvider(create: (context) => Screen1Cubit()),
      BlocProvider(create: (context) => CubitIdentityCardShape()),
      BlocProvider(create: (context) => ButtonCubit()),
      BlocProvider(create: (context) => CubitIdentityButtonColor()),
      BlocProvider(create: (context) => CubitVerifyButtonColor()),
      BlocProvider(create: (context) => CubitOtp()),
    ], child:MainApp()
    ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        'language': (context) => LanguageScreen(),
        "identity": (context) => Identity(),
        "phone":(context) => PhoneScreen(),
        "otpscreen":(context) => OtpScreen(),
      },
      home: 
      BlocProvider(
        create: (context) => Screen1Cubit()..englishlanguage(),
        child:LanguageScreen(),
      ),
    );
  }
}
