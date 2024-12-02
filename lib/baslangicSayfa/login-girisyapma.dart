import 'package:Vistopia/OOP/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../main.dart';
import 'sifre-unutma.dart';
import 'signup-kayitol.dart';
import '../OOP/baslangicOop.dart';

class baslangicLogin extends StatefulWidget {
  @override
  _baslangicLoginState createState() => _baslangicLoginState();
}

class _baslangicLoginState extends State<baslangicLogin> {
  bool _isObscure = true; // Başlangıçta şifre gizli olacak
  final formkey = GlobalKey<FormState>();
  final tfname = TextEditingController();
  final tfpassword = TextEditingController();
  bool hasError = false;
  bool isRememberMeChecked = false; // Hatırla durumu sifre kaydetme


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  child: Image.asset(
                    'image/1.1.png',
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(bottom:screenHeight*0.09),
                          child: Text(
                                "Giriş Yap",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Poppins",
                                  fontSize: screenWidth * 0.09,
                                ),
                              ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding:  EdgeInsets.all(screenHeight*0.02),
                        child: Form(
                          key: formkey,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                TextFormField(
                                  cursorColor: Colors.black54,
                                  style: TextStyle(
                                    color: Colors.black54,
                                  ),
                                  controller: tfname,
                                  decoration: customInputDecoration(
                                    Filcolorr: Colors.transparent,
                                    colorr: Colors.black54,
                                    suffixIcon: Icons.person,
                                    hintText: "Kullanıcı Adı",
                                    labeltext: "Kullanıcı Adı",
                                    hintStyle: TextStyle(
                                      color: Colors.black54,
                                    ),
                                    hasError: hasError,
                                  ),
                                  validator: (tfgirdisi) {
                                    if (tfgirdisi!.isEmpty) {
                                      setState(() => hasError = true);
                                      return "Kullanıcı Adınızı Giriniz";
                                    }

                                    final regex = RegExp(r'[!?\^+%&/|-]');
                                    if (regex.hasMatch(tfgirdisi)) {
                                      setState(() => hasError = true);
                                      return "Kullanıcı adınızda ! ? ' ^ + % & / - | karakterler olmamalı";
                                    }

                                    setState(() => hasError = false);
                                    return null;
                                  },
                                  onChanged: (value) {
                                    setState(() {
                                      hasError = RegExp(r'[!?\^+%&/|-]').hasMatch(value);
                                    });
                                  },
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(top: 20.0, bottom: 5.0),
                                    child: TextFormField(
                                      cursorColor: Colors.black54,
                                      style: TextStyle(color: Colors.black54),
                                      controller: tfpassword,
                                      decoration: customInputDecoration(
                                        Filcolorr: Colors.transparent,
                                        colorr: Colors.black54,
                                        passwordd: IconButton(
                                          icon:Icon(
                                            _isObscure ? Icons.visibility : Icons.visibility_off,
                                            color: Colors.grey,
                                          ) ,
                                          onPressed: () {
                                            setState(() {
                                              _isObscure = !_isObscure; // Şifre görünürlüğünü değiştir
                                            });
                                          },
                                        ),
                                        suffixIcon: Icons.lock, // password simgesi başa eklenir
                                        hintText: "Şifre Giriniz",
                                        labeltext: "Şifre Giriniz",
                                        hintStyle: TextStyle(color: Colors.black54),
                                        hasError: hasError, // Hata durumunu geçiriyoruz
                                      ),
                                      obscureText: _isObscure,//sifre gorunur veya gorunmez yapma

                                      validator: (tfgirdisi) {
                                        if (tfgirdisi == null || tfgirdisi.isEmpty) {
                                          setState(() => hasError = true); // Hata durumunu true yap
                                          return "Lütfen Şifre Giriniz";
                                        }
                                        if (tfgirdisi.length < 6) {
                                          setState(() => hasError = true); // Hata durumunu true yap
                                          return "Şifre 6 Karakterden Küçük Olamaz";
                                        }
                                        bool hasUpperCase = tfgirdisi.contains(RegExp(r'[A-Z]'));
                                        bool hasLowerCase = tfgirdisi.contains(RegExp(r'[a-z]'));
                                        bool hasDigit = tfgirdisi.contains(RegExp(r'[0-9]'));

                                        if (!hasUpperCase) {
                                          setState(() => hasError = true); // Hata durumunu true yap
                                          return "Şifre en az bir büyük harf içermelidir";
                                        }
                                        if (!hasLowerCase) {
                                          setState(() => hasError = true); // Hata durumunu true yap
                                          return "Şifre en az bir küçük harf içermelidir";
                                        }
                                        if (!hasDigit) {
                                          setState(() => hasError = true); // Hata durumunu true yap
                                          return "Şifre en az bir rakam içermelidir";
                                        }
                                        setState(() => hasError = false); // Hata yoksa hasError'ı false yap
                                        return null; // Geçerli şifre
                                      },
                                    ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Checkbox(
                                      checkColor: Colors.white,

                                      value: isRememberMeChecked, // Boolean değişkenini kullan
                                      onChanged: (bool? value) {
                                        setState(() {
                                          isRememberMeChecked = value ?? false; // Değeri güncelle
                                        });
                                      },
                                      activeColor: Colorss.vibrantTeal, // Onaylı durum rengi
                                    ),
                                    Text(
                                      "Beni Hatırla",
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontFamily: "OpenSans",
                                        fontWeight: FontWeight.bold,
                                        fontSize: screenWidth * 0.045,
                                      ), // Yazı rengi
                                    ),
                                  ],
                                ),

                                Padding(
                                  padding: EdgeInsets.only(top: screenHeight * 0),
                                  child: SizedBox(
                                    width: screenWidth * 1.1,
                                    height: screenWidth * 0.2,
                                    child: CustomButton(
                                      text: "Giriş Yap",
                                      onPressed: () {
                                        bool kontrolsonucu = formkey.currentState!.validate();
                                        if (kontrolsonucu) {
                                          String name = tfname.text;
                                          String pasw = tfpassword.text;
                                          print("Kullanıcı Adı:$name ve Şifresi $pasw");
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => MainSayfa(),
                                            ),
                                          );
                                        }
                                      },
                                      backgroundColor: Colorss.vibrantTeal,
                                      textColor: Colors.white,
                                      borderColor: Colors.black87,
                                      elevation: 5,
                                      borderRadius: 30,
                                      fontSize: screenWidth * 0.05,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => sifreYenileme(),
                                        ),
                                      );
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Şifremi unuttum",
                                        style: TextStyle(
                                          color: Colors.black54,
                                          fontFamily: "OpenSans",
                                          fontWeight: FontWeight.bold,
                                          fontSize: screenWidth * 0.045,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),
                      ),
                    ),


                  ],
                ),
                Padding(
                  padding:  EdgeInsets.only(bottom: screenHeight*0.04),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end, // Orta hizalama
                    children: [

                      // Row ile yeni yapı
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center, // Boşlukları ayarla
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 1,
                              indent: 20,
                              endIndent: 10,
                              color: Colors.grey,
                            ),
                          ),
                          Text("YADA", style: TextStyle(color: Colors.grey)),
                          Expanded(
                            child: Divider(
                              thickness: 1,
                              indent: 10,
                              endIndent: 20,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),

                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          children: [
                            Text("Hesabınız yok mu?", style: TextStyle(color: Colors.black,

                            )),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => baslangicSingup(),
                                  ),
                                );
                              },
                              child: Text(
                                "Hemen kayıt ol",
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontFamily: "OpenSans",
                                  fontWeight: FontWeight.bold,
                                  fontSize: screenWidth * 0.045,

                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
