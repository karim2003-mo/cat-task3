import 'dart:convert';

import 'package:flutter/services.dart';

class Language{
  static loadlanguage(Lang lang) async{
    String Translation;
    Map<String,dynamic> Localization;
    if(lang == Lang.ENGLISH){
      Translation=await rootBundle.loadString("assets/jsonlangs/english.json");
      Localization= jsonDecode(Translation);
      return Localization;
  }
  else{
        Translation=await rootBundle.loadString("assets/jsonlangs/arabic.json");
      Localization= jsonDecode(Translation);
      return Localization;
  }
}
}
enum Lang{
  ENGLISH ,
  ARABIC
}