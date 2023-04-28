class Parser {
  final String text;
  Parser(this.text);

  double getPPM() {
    //"<00000,0295,041,SETOSH=|08,00,21,00,SETAKT=|15,05,15,03,SETCDT=|>";
    var ppm = text.substring(1, 6);
    var ppmInt = int.parse(ppm);
    return ppmInt / 1000;
  }

  double getTemp() {
    var temp = text.substring(7, 11);
    var tempInt = int.parse(temp);
    return tempInt / 10;
  }

  int getMoisture() {
    var moisture = text.substring(12, 15);
    var moistureInt = int.parse(moisture);
    return moistureInt;
  }

  String getAKT1() {
    var hour1 = text.substring(24, 26);
    var min1 = text.substring(27, 29);
    return "$hour1:$min1";
  }

  String getAKT2() {
    var hour2 = text.substring(30, 32);
    var min2 = text.substring(33, 35);
    return "$hour2:$min2";
  }

  String getCDT1() {
    var hour1 = text.substring(44, 46);
    var min1 = text.substring(47, 49);
    return "$hour1:$min1";
  }

  String getCDT2() {
    var hour2 = text.substring(50, 52);
    var min2 = text.substring(53, 55);
    return "$hour2:$min2";
  }
}
