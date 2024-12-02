import 'package:Vistopia/OOP/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



////////////// KAYIT EKRANII BİLGİLERİ KOD ONAYINA AKTARMA/////////////////
////////////////KOD ONAYI-SİNUP SAYFASI BAGLANTISI////////////////////
class VerificationData {
  final String email;
  final String phoneNumber;
  final String userName;

  VerificationData({required this.email, required this.phoneNumber,required this.userName});
}

////////////////////////DECORATİON ORTAK KISIM//////////////////////
InputDecoration customInputDecoration({
  String? hintText,
  IconData? suffixIcon,
  String? prefixText,
  TextStyle? hintStyle,
  Color? colorr,
  Color? Filcolorr,
  String? labeltext,
  Widget? passwordd, // password widgetı yeniden eklendi
  bool hasError = false, // Hata durumunu kontrol etmek için eklendi
  String? fontFamily, // Font ailesi parametresi
}) {
  return InputDecoration(
    suffixIcon: passwordd != null
        ? passwordd
        : (suffixIcon != null
        ? Icon(
      suffixIcon,
      color: hasError ? Colorss.vibrantTeal : Colorss.darkGray, // Hata varsa teal, yoksa gri
    )
        : null),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colorss.mediumGray,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colorss.darkGray,
        width: 1.5,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colorss.mediumGray,
        width: 1.5,
      ),
    ),
    errorStyle: TextStyle(
      color: colorr,
      fontSize: 13,
      height: 0,
    ),
    hintText: hintText,
    hintMaxLines: 25,
    labelText: labeltext,
    labelStyle: TextStyle(
      color: Colors.black54,
      fontFamily: "Opensans",
    ),
    prefixText: prefixText,
    hintStyle: hintStyle,
    filled: true,
    fillColor: Filcolorr,
  );
}




////////////////////////////////BUTONLAR İÇİN/////////////////////

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double fontSize;
  final double width;
  final double height;
  final double borderRadius;
  final Color borderColor;
  final double elevation;
  final EdgeInsetsGeometry padding;
  final FontWeight fontWeight;
  final String fontfamily;
  final Color pressedColor;


  const CustomButton({

    this.fontWeight=FontWeight.bold,
    required this.text,
    required this.onPressed,
    this.backgroundColor = Colors.black,
    this.textColor = Colors.white,
    this.fontSize = 28,
    this.fontfamily= 'OpenSans' ,
    this.width = 200,
    this.height = 40.0,
    this.borderRadius = 8.0,
    this.borderColor = Colors.transparent,
    this.elevation = 2.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 16.0, vertical: 1.0),
    this.pressedColor=Colorss.lightGray,
  });

  @override
  Widget build(BuildContext context) {

    return Center(
      child: SizedBox(
        width: width,
        height: height,
        child: TextButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            padding: padding,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              side: BorderSide(color: borderColor),
            ),
            elevation: elevation,
          ).copyWith(
            overlayColor: MaterialStateProperty.all(pressedColor as Color?),
          ),

          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(
              fontFamily: fontfamily, // fontFamily burada kullanılıyor
              fontSize: fontSize,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}

