import 'package:flutter/material.dart';

class Pad {
  static Padding padall(double all,{ Widget ?child}) {
    return  Padding(padding: EdgeInsets.all(all),
    child:child ,
    );
  }
  static Padding padcustom(double top, double bottom, double left, double right,{ Widget ?child}) {
    return  Padding(padding: EdgeInsets.only(top: top, bottom: bottom, left: left, right: right),
    child:child ,
    );
  }
  static Padding padsymmetric(double vertical, double horizontal,{ Widget ?child}) {
    return  Padding(padding: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
    child:child ,
    );
  }
}