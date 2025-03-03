class Pixel{
  double screenwidth;
  double screenheight;
  late double _x;
  late double _y;
  Pixel({required this.screenwidth, required this.screenheight}){
    _x = screenwidth/200;
    _y = screenheight/350;
  }
  double horizontalpixel(){
    return _x;
  }
  double verticalpixel(){
    return _y;
  }
}