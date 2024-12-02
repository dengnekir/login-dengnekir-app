
import 'package:Vistopia/OOP/colors.dart';
import 'package:Vistopia/baslangicSayfa/signup-kayitol.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'login-girisyapma.dart';
import '../OOP/baslangicOop.dart';

void main() {
  runApp(const MyDengnekirApp());
}

class MyDengnekirApp extends StatelessWidget {
  const MyDengnekirApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dengnekir',//çalıştırılmadı appbar yok
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colorss.vibrantTeal),
        fontFamily: "OpenSans",
        useMaterial3: true,
      ),
      home:  MyHomePage(title: 'Dengnekir'),//appbar yok çalıştırılmadı
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child:
        Stack(//image ustune eklenen widgets
              
                children: [
                  Positioned(
                    top: 0,
                    child:
                      Image.asset('image/1.1.png',
                      ),
                  ),
                  Positioned(//6.4> inç ekranlar için yuksekten ayarlama
                    left: 0,
                    right: 0,
                    top: screenHeight*0.2,
                      child:
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //LOGO AND LOGO STYLE
                          SizedBox(
                              height: screenHeight*0.2,
                              width: screenWidth*0.2,
                              child: Image.asset("image/logo.png")
                          ),
                          SizedBox(
                            height: screenHeight*0.01,
                          ),
                          //APP NAME AND NAME STYLE
                          Text("Vistopia",
                          style:
                          TextStyle(
                            fontFamily: "Poppins",
                              fontSize: screenWidth*0.13,
                              color: Colors.black,
                          ),
                          ),
                          //AÇIKLAMA
                          Padding(
                            padding: const EdgeInsets.only(top: 10,bottom: 35),
                            child: Text("Senin Yolculuğun, Senin Hikayen",
                            style: TextStyle(
                              fontFamily: "OpenSans",
                              fontSize: screenWidth*0.045,
                              color: Colors.black
                            ),                         ),
                          ),
                          //BUTTON
                          SizedBox(
                            height: screenHeight*0.2,
                            width: screenWidth*0.7,//Button genişliği
                            //baslangicoop button
                            child: CustomButton(
                              text: "Giriş Yap",
                              onPressed: () {
                                print("login ekrana geçiliyor");
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context) => baslangicLogin()),
                                );
                              },
                              backgroundColor: Colorss.vibrantTeal,
                              textColor: Colors.white,
                              borderColor: Colors.black87,

                              elevation: 1,
                              borderRadius: 30,
                              fontSize: screenWidth*0.05,
                            ),
                          ),
                          Padding(
                            padding:  EdgeInsets.only(top: screenHeight*0.15),
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
                                    Text("Hesabın yok mu?", style: TextStyle(color: Colorss.darkGray)),
                                    Expanded(
                                      child: Divider(
                                        thickness: 1,//kalınlık
                                        indent: 10,//uzunluk
                                        endIndent: 20,//sonndan uzunluk
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),

                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pushReplacement(
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
                  //BUTTON
              
                      ],
              ),

        ),

    );
  }
}
