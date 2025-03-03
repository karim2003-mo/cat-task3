import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task2/cubit/allstates.dart';
import 'package:task2/language/load_lang.dart';

class Screen1Cubit extends Cubit<Screen1State> {

  Screen1Cubit() : super(Loading());
  void arabiclanguage() async{
    Map<String,dynamic> Localization=await Language.loadlanguage(Lang.ARABIC);
    emit(Screen1ArabicLang(Localization: Localization));
  }
  void englishlanguage() async{
    Map<String,dynamic> Localization=await Language.loadlanguage(Lang.ENGLISH);
    emit(Screen1EnglishLang(Localization: Localization));
  }
}
class CubitIdentityCardShape extends Cubit<IdentityCardShape>{
  CubitIdentityCardShape():super(NotSelected());
  selected(){
    emit(Selected());
  }
  notselected(){
    emit(NotSelected());
  }
}
class ButtonCubit extends Cubit<ButtonColor>{
  ButtonCubit():super(Greycolor());
  gry(){
    emit(Greycolor());
  }
  blue(){
    emit(Bluecolor());
  }
}
class CubitIdentityButtonColor extends Cubit<IdentityButtonColor>{
  CubitIdentityButtonColor():super(IdentityGreycolor());
    grey(){
    emit(IdentityGreycolor());
  }
  blue(){
    emit(IdentityBluecolor());
  }
}
class CubitVerifyButtonColor extends Cubit<VerifyButtonColor>{
  CubitVerifyButtonColor() : super(VerifyGreycolor());
  blue(){emit(VerifyBluecolor());
  }
  grey(){
    emit(VerifyGreycolor());
  }
}
class CubitOtp extends Cubit<OtpBorderColer>{
  CubitOtp() : super(GreyOtp());
  red(){
    emit(RedOtp());
  }
  grey(){
    emit(GreyOtp());
  }
}