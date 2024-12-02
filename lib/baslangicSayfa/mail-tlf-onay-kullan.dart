import 'dart:async';
import 'package:Vistopia/OOP/baslangicOop.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';

import '../main.dart';

class kodOnaylama extends StatefulWidget {
  final VerificationData data; // Constructor'da kullanılacak baslangicooptan bilgi alır

  // Constructor
  kodOnaylama({required this.data});//baslangicoop bilgileri burda kullanıma hazır durumda

  @override
  State<kodOnaylama> createState() => _kodOnaylamaState();
}

class _kodOnaylamaState extends State<kodOnaylama> {
  late Timer _timerMail;
  late Timer _timerPhone;
  int _remainingTimeMail = 0;
  int _remainingTimePhone = 0;

  var formkey = GlobalKey<FormState>(); //key anahtarı
  var tfMail = TextEditingController(); //mail kod doğrulama
  var tfPhone = TextEditingController(); //telefon kod doğrulama

  bool _isObscure = true; // Başlangıçta kod yok mail
  bool is_Obscure = true; // Başlangıçta kod yok telefon

  void startTimerMail() {
    _remainingTimeMail = 60;
    _timerMail = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTimeMail > 0) {
          _remainingTimeMail--;
        } else {
          _timerMail.cancel();
        }
      });
    });
  }

  void startTimerPhone() {
    _remainingTimePhone = 60;
    _timerPhone = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTimePhone > 0) {
          _remainingTimePhone--;
        } else {
          _timerPhone.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timerMail.cancel();
    _timerPhone.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height, // Ekranın tamamını kaplamasını sağlar
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    'image/1.png',
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: SizedBox(
                          height: 150,
                          width: 150,
                          child: Image.asset("image/logo.png"),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(height: 60.0),
                    Text(
                      "Doğrulama",
                      style: TextStyle(
                        fontFamily: "Rowdies",
                        fontSize: 30,
                      ),
                    ),
                    Text(
                      "Hesabınızı Güvence Altına Almak İçin \n Doğrulamaları Tamamlayın",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                    //Girilen kullanıcı adı burda gözukur
                    Text(
                      "${widget.data.userName}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Rowdies",
                        fontSize: 30,),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Form(
                          key: formkey,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                // Email
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: RichText(
                                    text: TextSpan(
                                      text: 'Kod ',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey, // Genel renk ayarı
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: '${widget.data.email} ',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: 'Rowdies',
                                            color: Colors.grey,
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'adresine gönderilecek',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0, bottom: 5.0),
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    controller: tfMail,
                                    decoration: customInputDecoration(
                                      Filcolorr: Colors.white,
                                      colorr: Colors.purple,
                                      passwordd: GestureDetector(
                                        child: Padding(
                                          padding: const EdgeInsets.only(top: 13.0, bottom: 5.0,right: 10),
                                          child: Text(
                                            _remainingTimeMail > 0 ? "$_remainingTimeMail sn kaldı" : "Kodu Gönder",
                                            style: TextStyle(
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          if (_remainingTimeMail == 0) {
                                            // Mesaj gönderme işlemi burada yapılacak
                                            startTimerMail();
                                            setState(() {
                                              is_Obscure = false; // kodun sifre gibi yıldızlanmasını engeller
                                            });
                                          }
                                        },
                                      ),
                                      suffixIcon: Icons.email,
                                      hintText: "Mail Doğrulama Kodu",
                                      hintStyle: TextStyle(
                                        color: Colors.grey
                                      ),

                                    ),
                                    obscureText: is_Obscure,
                                    validator: (tfgirdisi) {
                                      if (tfgirdisi!.isEmpty) {
                                        return "Lütfen Kodu Giriniz";
                                      }
                                      if (tfgirdisi.length != 6) {
                                        return "Kodunuz Doğru Giriniz";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                // Telefon
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: RichText(
                                    text: TextSpan(
                                      text: 'Kod ',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey,
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: '${widget.data.phoneNumber} ',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 16,
                                            fontFamily: 'rowdies',
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'Numarasına Gönderilecek',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
,
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0, bottom: 5.0),
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    controller: tfPhone,
                                    decoration: customInputDecoration(
                                      Filcolorr: Colors.white,
                                      colorr: Colors.purple,

                                      passwordd: GestureDetector(
                                        child: Padding(
                                          padding: const EdgeInsets.only(top: 13.0, bottom: 5.0,right: 10),
                                          child: Text(
                                            _remainingTimePhone > 0 ? "$_remainingTimePhone sn kaldı" : "Kodu Gönder",
                                            style: TextStyle(
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          if (_remainingTimePhone == 0) {
                                            // Mesaj gönderme işlemi burada yapılacak
                                            startTimerPhone();
                                            setState(() {
                                              is_Obscure = false; // kodun sifre gibi yıldızlanmasını engeller
                                            });
                                          }
                                        },
                                      ),
                                      suffixIcon: Icons.phone_android,
                                      hintText: "Telefon Doğrulama Kodu",
                                      hintStyle: TextStyle(
                                        color: Colors.grey
                                      )
                                    ),
                                    obscureText: _isObscure,
                                    validator: (tfgirdisi) {
                                      if (tfgirdisi!.isEmpty) {
                                        return "Lütfen Kodu Giriniz";
                                      }
                                      if (tfgirdisi.length != 6) {
                                        return "Kodunuz Doğru Giriniz";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    //baslangicoop button
                                    child: CustomButton(
                                      width: MediaQuery.of(context).size.width,
                                      text: "Onayla",
                                      onPressed: () {
                                        //key anahtarları buraya gelir ve doğrulama işlemleri olur
                                        //yani karakter uzunluğu 6 yı geciyor mu mesela
                                        print("Anasayfaya Geçiş izni kontrol ediliyor");
                                        bool kontrolsonucu = formkey.currentState!.validate(); // TEXTFIELD KONTROL
                                        if (kontrolsonucu) {
                                          String mail = tfMail.text;
                                          String phone = tfPhone.text;
                                          print("Email Kodu:$mail ve Telefon Kodu:$phone dir");
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>MainSayfa(),));

                                        }
                                      },
                                      backgroundColor: Colors.black,
                                      textColor: Colors.white,
                                      borderColor: Colors.black87,
                                      elevation: 1,
                                      borderRadius: 16,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      print("anasayfaya onaylanmadan geçiş yapıldı");
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>MainSayfa()));
                                    },
                                    child: Text(
                                      "Daha Sonra Hatırlat",
                                      style: TextStyle(
                                        color: Colors.black,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
