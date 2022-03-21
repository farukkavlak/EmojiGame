import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
const Color kLightYellow = Color(0xFFFFF9EC);
const Color kLightYellow2 = Color(0xFFFFE4C7);
const Color kDarkYellow = Color(0xFFF9BE7C);
const Color kRed = Color(0xFFE46472);
const Color kGreen = Color(0xFF309397);
const String kAlphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
const kWordTextStyle = TextStyle(
    fontSize: 57, color: kGreen, fontFamily: 'FiraMono', letterSpacing: 8);
const kWordTextStyle30 = TextStyle(
    fontSize: 30, color: kGreen, fontFamily: 'FiraMono', letterSpacing: 8);
var kSuccessAlertStyle = AlertStyle(
  animationType: AnimationType.grow,
  isCloseButton: false,
  isOverlayTapDismiss: false,
  animationDuration: const Duration(milliseconds: 500),
  backgroundColor: const Color(0xFF2C1E68),
  alertBorder: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10.0),
  ),
  titleStyle: const TextStyle(
    color: Color(0xFF00e676),
    fontWeight: FontWeight.bold,
    fontSize: 30.0,
    letterSpacing: 1.5,
  ));
  var kExitAlertStyle = AlertStyle(
animationType: AnimationType.grow,
  isCloseButton: false,
  isOverlayTapDismiss: false,
  descStyle: const TextStyle(
color: Colors.white,
fontWeight: FontWeight.bold,
fontSize: 27.0,
letterSpacing: 2.0,
),
    animationDuration: const Duration(milliseconds: 500),
backgroundColor: const Color(0xFF2C1E68),
alertBorder: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(10.0),
),
titleStyle: const TextStyle(
color: Colors.white,
fontWeight: FontWeight.bold,
fontSize: 27.0,
letterSpacing: 2.0,
));
var kGameOverAlertStyle = AlertStyle(
    animationType: AnimationType.grow,
    isCloseButton: false,
    isOverlayTapDismiss: false,
    animationDuration: const Duration(milliseconds: 450),
    backgroundColor: const Color(0xFF2C1E68),
    alertBorder: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    titleStyle: const TextStyle(
      color: Colors.red,
      fontWeight: FontWeight.bold,
      fontSize: 30.0,
      letterSpacing: 1.5,
    ),
    descStyle: const TextStyle(
      color: Colors.lightBlue,
      fontWeight: FontWeight.bold,
      fontSize: 25.0,
      letterSpacing: 1.5,
    ));
    var kFailedAlertStyle = AlertStyle(
animationType: AnimationType.grow,
    isCloseButton: false,
    isOverlayTapDismiss: false,
    animationDuration: const Duration(milliseconds: 450),
    backgroundColor: const Color(0xFF2C1E68),
alertBorder: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(10.0),
),
titleStyle: const TextStyle(
color: Colors.red,
fontWeight: FontWeight.bold,
fontSize: 30.0,
letterSpacing: 1.5,
));
const kDialogButtonColor = Color(0x00000000);
const kButtonColor = Color.fromRGBO(48, 147, 152, 1);
const kButtonColorFalse = Color.fromRGBO(16, 67, 70, 1);
const kEmojiListCardcolor = Color.fromRGBO(228, 100, 113, 1);
const kEmojiListCardColorCompleted = Color.fromRGBO(219, 26, 45, 1);