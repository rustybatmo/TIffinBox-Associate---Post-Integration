import 'package:flutter/material.dart';
// OTP Page

const otp = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 12.0),
  isDense: true,
  filled: true,
  border: InputBorder.none,
  fillColor: Colors.amber,
  counterText: '',
);
// personaldetail
const cardbar = InputDecoration(
  hintStyle: TextStyle(fontSize: 14.0, letterSpacing: 1.0),
  contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
  fillColor: Color(0xFFFFF9C4),
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(25.0)),
    borderSide: BorderSide(color: Colors.transparent, width: 2.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(25.0)),
    borderSide: BorderSide(color: Colors.transparent, width: 2.0),
  ),
);

//  Add Menu Item styling
const addmenustyle = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0),
  isDense: true,
);

Widget backButton(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5.0),
      boxShadow: [
        BoxShadow(
          color: Colors.grey[300],
          blurRadius: 3.5, // soften the shadow
          spreadRadius: 0.05, //extend the shadow
          offset: Offset(2.5, 2.5), // Offset in x and y axes from the container
        ),
      ],
      color: Colors.white,
    ),
    child: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          size: 18.0,
        ),
        color: Colors.black,
        onPressed: () {
          Navigator.pop(context);
        }),
  );
}

Widget backContainerButton(BuildContext context) {
  return Container(
    height: 30.0,
    width: 40.0,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5.0),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey[300],
          blurRadius: 3.5, // soften the shadow
          spreadRadius: 0.05, //extend the shadow
          offset: Offset(2.5, 2.5), // Offset in x and y axes from the container
        ),
      ],
    ),
    child: IconButton(
        alignment: Alignment.topCenter,
        icon: Icon(
          Icons.arrow_back_ios,
          size: 18.0,
        ),
        color: Colors.black,
        onPressed: () {
          Navigator.pop(context);
        }),
  );
}
