import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

ButtonStyle customButtonStyle() {
  return ButtonStyle(
    backgroundColor: MaterialStateProperty.all(
      HexColor(
        '#d68f35',
      ),
    ),
    shape: const MaterialStatePropertyAll(
      BeveledRectangleBorder(
        borderRadius: BorderRadiusDirectional.all(Radius.circular(3)),
      ),
    ),
  );
}
