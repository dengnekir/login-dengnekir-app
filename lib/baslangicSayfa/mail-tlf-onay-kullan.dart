import 'dart:async';
import 'package:Vistopia/OOP/baslangicOop.dart';
import 'package:Vistopia/OOP/colors.dart';
import 'package:Vistopia/main.dart';
import 'package:flutter/material.dart';

class kodOnaylama extends StatefulWidget {
  final VerificationData data;

  kodOnaylama({required this.data});

  @override
  State<kodOnaylama> createState() => _kodOnaylamaState();
}

class _kodOnaylamaState extends State<kodOnaylama> {
  late Timer _timerMail;
  late Timer _timerPhone;
  int _remainingTimeMail = 0;
  int _remainingTimePhone = 0;

  var formKey = GlobalKey<FormState>();
  var tfMail = TextEditingController();
  var tfPhone = TextEditingController();

  // Timer başlatma fonksiyonu
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
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: Image.asset('image/1.1.png'),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Hesabınızı Güvence Altına Alın",
                  style: TextStyle(
                    fontSize: screenWidth * 0.06,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenWidth * .5 / 10),
                Form(
                    key: formKey,
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${widget.data.userName}",
                      style: TextStyle(
                        fontSize: screenWidth * 0.05,
                        color: Colorss.pastelTeal,
                      ),
                    ),
                    SizedBox(height: screenWidth * .8 / 10),

                    // Email doğrulama kısmı
                    Text(
                      'Kod ${widget.data.email} adresine gönderildi.',
                      style: TextStyle(fontSize: screenWidth * 0.04),
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      controller: tfMail,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Mail Doğrulama Kodu",
                        labelStyle: TextStyle(
                          color: Colorss.pastelTeal
                        ),
                        errorStyle: TextStyle(
                          color: Colorss.pastelTeal, // Hata mesaj rengi
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colorss.pastelTeal, // Hata durumu border rengi
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colorss.vibrantTeal, // Fokuslanmış hata durumu border rengi
                          ),
                        ),
                        suffix: GestureDetector(
                          child: Text(
                            _remainingTimeMail > 0
                                ? "${_remainingTimeMail}s "
                                : "Kodu Gönder",
                            style: TextStyle(color: Colorss.darkGray),
                          ),
                          onTap: () {
                            if (_remainingTimeMail == 0) {
                              startTimerMail();
                            }
                          },
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Lütfen kodu giriniz";
                        }
                        if (value.length != 6) {
                          return "Kod 6 haneli olmalıdır";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),

                    // Telefon doğrulama kısmı
                    Text(
                      'Kod ${widget.data.phoneNumber} numarasına gönderildi.',
                      style: TextStyle(fontSize: screenWidth * 0.04),
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      controller: tfPhone,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Telefon Doğrulama Kodu",
                        labelStyle: TextStyle(
                            color: Colorss.pastelTeal
                        ),
                        errorStyle: TextStyle(
                          color: Colorss.pastelTeal, // Hata mesaj rengi
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colorss.pastelTeal, // Hata durumu border rengi
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colorss.vibrantTeal, // Fokuslanmış hata durumu border rengi
                          ),
                        ),
                        suffix: GestureDetector(
                          child: Text(
                            _remainingTimePhone > 0
                                ? "${_remainingTimePhone}s"
                                : "Kodu Gönder",
                            style: TextStyle(color: Colorss.darkGray),
                          ),
                          onTap: () {
                            if (_remainingTimePhone == 0) {
                              startTimerPhone();
                            }
                          },
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Lütfen kodu giriniz";
                        }
                        if (value.length != 6) {
                          return "Kod 6 haneli olmalıdır";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 32),

                    // Onayla ve Daha Sonra butonları
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              String mail = tfMail.text;
                              String phone = tfPhone.text;
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text("Başarılı"),
                                    content: Text("Bilgileriniz başarıyla değiştirildi!"),
                                    actions: [
                                      TextButton(
                                        child: Text("Tamam"),
                                        onPressed: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>MainSayfa(),));
                                          // Dialogu kapatır

                                        },
                                      ),
                                    ],
                                  );
                                },
                              );

                            }
    if (tfMail.text.isEmpty || tfPhone.text.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
    content: Text("Lütfen tüm alanları doldurunuz!"),
    duration: Duration(seconds: 2),
    backgroundColor: Colorss.vibrantTeal,
    ),
    );
    }

                          },
                          child: Text("Onayla"),

                        ),

                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => MainSayfa()),
                            );
                          },
                          child: Text("Daha Sonra"),
                        ),
                      ],
                    ),
                  ],
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
