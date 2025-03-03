class Screen1State{
  Map<String,dynamic> Localization;
  Screen1State({required this.Localization});
}
class Screen1ArabicLang extends Screen1State{
  Screen1ArabicLang({required super.Localization});
}
class Screen1EnglishLang extends Screen1State{
  Screen1EnglishLang({required super.Localization});
}
class Loading extends Screen1State{
  Loading():super(Localization:{});
}
class IdentityCardShape{
}
class Selected extends IdentityCardShape{}
class NotSelected extends IdentityCardShape{}
class IdentityButtonColor{}
class IdentityGreycolor extends IdentityButtonColor{}
class IdentityBluecolor extends IdentityButtonColor{}
class ButtonColor{}
class Greycolor extends ButtonColor{}
class Bluecolor extends ButtonColor{}
class VerifyButtonColor{}
class VerifyGreycolor extends VerifyButtonColor{}
class VerifyBluecolor extends VerifyButtonColor{}
class OtpBorderColer{}
class RedOtp extends OtpBorderColer{}
class GreyOtp extends OtpBorderColer{}