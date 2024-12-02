import 'package:Vistopia/OOP/baslangicOop.dart';
import 'package:Vistopia/OOP/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class Personel extends StatefulWidget {
  @override
  State<Personel> createState() => _PersonelState();
}

class _PersonelState extends State<Personel> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: TextButton(
            onPressed: () {
              print("Kullanıcı adına basıldı");
            },
            style: TextButton.styleFrom(
              foregroundColor: Colorss.lightGray,
              backgroundColor: Colors.transparent,
              splashFactory: NoSplash.splashFactory,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "dengnekir",
                  style: TextStyle(
                    fontSize: screenWidth * 0.06,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_down_sharp,
                  size: screenHeight * 0.03,
                  color: Colors.black,
                ),
                SizedBox(width: 8),
              ],
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                print("Bildirimler butonuna basıldı");
              },
              icon: Icon(Icons.notifications),
            ),
            IconButton(
              onPressed: () {
                print("Menü butonuna basıldı");
              },
              icon: Icon(Icons.menu, size: screenWidth * 0.09),
              splashColor: Colorss.vibrantTeal,
              highlightColor: Colorss.lightGray,
            ),
          ],
        ),
        body: Column(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //resimler
                  Stack(
                    children: [
                      Container(
                        width: screenWidth,
                        height: screenHeight * 0.17,
                        child: Image.asset(
                          "image/imagemainpersonel/background.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: screenWidth / 3.2,
                            height: screenHeight / 30,
                            child: CustomButton(
                              text: "Profili Düzenle",
                              onPressed: () {
                                print("profili duzenleme sayfasına gidiliyor");
                              },
                              backgroundColor: Colorss.lightGray.withOpacity(0.7),
                              textColor: Colors.black87.withOpacity(0.7),
                              borderColor: Colors.transparent,
                              elevation: 1,
                              borderRadius: 8,
                              fontSize: screenWidth * 0.04,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: (screenHeight * 0.15) / 2 - 40,
                        left: screenWidth / 15,
                        child: ClipOval(
                          child: Container(
                            width: screenWidth * 0.2,
                            height: screenHeight * 0.1,
                            child: Image.asset(
                              'image/profil.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  //isim takipci ve yazılar
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          height: screenHeight*0.17,
                          width: screenWidth,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // İsim
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: screenHeight*0.2,
                                  width: screenWidth/2.2,
                                  child: Column(
                                      children: [
                                        //isim soy isim
                                        Padding(
                                          padding:  EdgeInsets.only(top:screenWidth*0.03,bottom: screenWidth*0.04),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("Ferhat Uslu",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: screenWidth*0.05
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text("Yanlız Kalacksın Kardeş",
                                              style: TextStyle(
                                                  fontSize: screenWidth*0.04
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text("İstanbul/ Türkiye",
                                              style: TextStyle(
                                                  fontSize: screenWidth*0.04
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: (){
                                                print("harici kişisel baglantıya aktarılıyor");
                                              },
                                              child: Text("www.youtube.com",
                                                style: TextStyle(
                                                    fontSize: screenWidth*0.04,
                                                    color: Colors.indigo
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ]
                                  ),
                                ),
                              ),

                              // Takipçi sayısı
                              Container(
                                height: screenHeight*0.2,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:  EdgeInsets.only(top:screenWidth*0.04,right: screenWidth*0.03),
                                      child: Column(
                                        children: [
                                          GestureDetector(
                                            onTap: (){
                                              print("postlara basıldı");
                                            },
                                            child: Text("30",
                                              style: TextStyle(
                                                  fontSize: screenWidth*0.05,
                                                  fontWeight: FontWeight.bold
                                              ),
                                            ),
                                          ),
                                          Text("post",
                                            style: TextStyle(
                                              fontSize: screenWidth*0.04,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:  EdgeInsets.only(top:screenWidth*0.04,right: screenWidth*0.03),
                                      child: Column(
                                        children: [
                                          GestureDetector(
                                            onTap: (){
                                              print("takipçilere  basıldı");
                                            },
                                            child: Text("20",
                                              style: TextStyle(
                                                  fontSize: screenWidth*0.05,
                                                  fontWeight: FontWeight.bold
                                              ),
                                            ),
                                          ),
                                          Text("abone",
                                            style: TextStyle(
                                              fontSize: screenWidth*0.04,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:  EdgeInsets.only(top:screenWidth*0.04,right: screenWidth*0.03),
                                      child: Column(
                                        children: [
                                          GestureDetector(
                                            onTap: (){
                                              print("takip edilenlere basıldı");
                                            },
                                            child: Text("150",
                                              style: TextStyle(
                                                  fontSize: screenWidth*0.05,
                                                  fontWeight: FontWeight.bold
                                              ),
                                            ),
                                          ),
                                          Text("takip ağı",
                                            style: TextStyle(
                                              fontSize: screenWidth*0.04,
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
                      ],
                    ),
                  //hakkımda ve yeni gonderi faliyetleri
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: screenWidth / 2.2,
                          height: screenHeight / 20,
                          child: CustomButton(
                            text: "Hakkımda",
                            onPressed: () {
                              print("Hakkımda duzenleme sayfasına gidiliyor");
                            },
                            backgroundColor: Colorss.lightGray.withOpacity(0.7),
                            textColor: Colors.black87,
                            borderColor: Colors.transparent,
                            elevation: 1,
                            borderRadius: 30,
                            fontSize: screenWidth * 0.05,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: screenWidth / 2.2,
                          height: screenHeight / 20,
                          child: CustomButton(
                            text: "Yeni Faaliyet",
                            onPressed: () {
                              print("Yeni gonderi duzenleme sayfasına gidiliyor");
                            },
                            backgroundColor: Colorss.lightGray.withOpacity(0.7),
                            textColor: Colors.black87,
                            borderColor: Colors.transparent,
                            elevation: 1,
                            borderRadius: 30,
                            fontSize: screenWidth * 0.05,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // TabBar ve TabBarView kısımları
            Expanded(
              child: Column(
                children: [
                  TabBar(
                    labelColor: Colorss.vibrantTeal,
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      Tab(icon: Icon(Icons.grid_on)),
                      Tab(icon: Icon(Icons.slow_motion_video)),
                      Tab(icon: Icon(Icons.camera_rounded) ),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        Center(child: Text('Ana Sayfa İçeriği')),
                        Center(child: Text('Reels İçeriği')),
                        Center(child: Text('Story İçeriği')),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
