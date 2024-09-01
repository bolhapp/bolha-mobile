import 'package:flutter/material.dart';

class TextInputCommonDecoration {
  static InputDecoration textFieldStyle({
    String hintTextStr = "",
  }) {
    return InputDecoration(
        hintText: hintTextStr,
        contentPadding: const EdgeInsets.only(left: 20),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide:
                BorderSide(width: 1, color: Color.fromARGB(0, 114, 113, 113))));
  }
}
