import 'package:Vistopia/MainSayfa/Main-Post.dart';
import 'package:Vistopia/OOP/abone-takipci-personel.dart';
import 'package:Vistopia/OOP/baslangicOop.dart';
import 'package:Vistopia/OOP/colors.dart';
import 'package:Vistopia/OOP/profiliDuzenle-personel.dart';
import 'package:Vistopia/baslangicSayfa/login-girisyapma.dart';
import 'package:Vistopia/baslangicSayfa/sifre-unutma.dart';
import 'package:Vistopia/baslangicSayfa/signup-kayitol.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import '../OOP/sifreDegistir-hesapSil-onayKod.dart';
// UserData üzerinden verilere erişiyoruz takipçi ve takip sayısı
final userData = FollowersFollowingPage();


 class Personel extends StatefulWidget {
  final VerificationData? data; // Make data nullable
  final Kullanici userDataaa;

  const Personel({this.data, required this.userDataaa});


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
          //hesap değiştirme
          title: TextButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                builder: (context) {
                  return SizedBox(
                   height:screenHeight*3/10 ,
                    width:screenWidth ,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding:  EdgeInsets.only(top:screenWidth*.7/10,left: screenWidth*.7/10,right: screenWidth*.5/10),
                                  child: CircleAvatar(
                                    radius: 30,
                                    backgroundImage: AssetImage("image/logo.png"), // Profil resmi
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${widget.userDataaa.isim}",
                                  style: TextStyle(
                                    fontSize: screenWidth*.5/10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "${widget.data?.userName}",
                                  style: TextStyle(
                                    fontSize: screenWidth*.4/10,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),


                         SizedBox(height: screenHeight*.2/10),
                        Container(
                          width: screenWidth*.9,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)
                              =>baslangicSingup(),
                              ));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey[300],
                              foregroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text("Yeni Hesap Oluştur"),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          width: screenWidth*.9,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)
                              =>baslangicLogin()
                              ),);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey[300],
                              foregroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text("Var Olan Hesabı Ekle"),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
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
                  "@${widget.data?.userName}",
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
                print("gonderi ekleme butonuna basıldı");
                Navigator.push(context, MaterialPageRoute(builder: (context)=>PostAdd()));
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.transparent,
                splashFactory: NoSplash.splashFactory,
              ),
              icon: Icon(Icons.add_box_outlined),
            ),
            IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                  ),
                  backgroundColor: Colorss.lightGray,
                  builder: (BuildContext context) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Hesabım",style: TextStyle(
                                    fontSize: screenWidth*.6/10,
                                    fontWeight: FontWeight.bold
                                  ),),
                                  Text("@${widget.data?.userName}",style: TextStyle(
                                      fontSize: screenWidth*.4/10,
                                  ),),
                                ],
                              ),
                            ],
                          ),
                          ListTile(
                            leading: Icon(Icons.account_circle, color: Colors.black87),
                            title: Text("Hesap Bilgileri" ,style: TextStyle(
                              fontWeight: FontWeight.bold
                            ),),
                            subtitle: Text("Telefon Numarası, E-posta adresini ve diğer hesap bilgilerini gör"),
                            onTap: () {
                              print("Hesap Bilgileri tıklandı");
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>
                                  HesapBilgileriSayfasi( data: widget.data!,)));

                            },
                          ),
                          Divider(),
                          ListTile(
                            leading: Icon(Icons.lock, color: Colors.black87),
                            title: Text("Şifreni Değiştir",style: TextStyle(
                              fontWeight: FontWeight.bold
                            ),),
                            subtitle: Text("Yeni Şifreni Oluştur"),

                            onTap: () {

                              print("Şifre Değiştir tıklandı");
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SifreUnutmaKod()));
                            },
                          ),
                          Divider(),
                          ListTile(
                            leading: Icon(Icons.heart_broken, color: Colors.black87),
                            title: Text("Hesabı Sil",style: TextStyle(fontWeight: FontWeight.bold),),
                            subtitle: Text("Kalıcı olarak Hesabını Silmek İstiyor musun?"),

                            onTap: () {
                              print("Hesabı Sil tıklandı");
                              // HesapSilmeCard'ı çağırdığınız yerde:
                              showDialog(
                                context: context,
                                barrierColor: Colors.grey.withOpacity(0.7), // veya istediğiniz renk
                                builder: (BuildContext context) => HesapSilmeCard(),

                              );
                            },
                          ),

                        ],
                      ),
                    );
                  },
                );
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.transparent,
                splashFactory: NoSplash.splashFactory,
              ),
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
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileEditPage()));
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
                                              Text("${widget.userDataaa.isim}",
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
                                            Text("${widget.userDataaa.hakkimda}",
                                              style: TextStyle(
                                                  fontSize: screenWidth*0.04
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text("${widget.userDataaa.hakkimda2}",
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
                                              child: Text("${widget.userDataaa.baglantiLinki}",
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
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>FollowersFollowingPage()));
                                            },
                                            child: Text("${userData.getFollowersCount()}",
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
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>FollowersFollowingPage()));

                                              print("takip edilenlere basıldı");
                                            },
                                            child: Text("${userData.getFollowingCount()}",
                                              style: TextStyle(
                                                  fontSize: screenWidth*0.05,
                                                  fontWeight: FontWeight.bold
                                              ),
                                            ),
                                          ),
                                          Text("takipler",
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
///////////////////////////////////////////////////////////////////////////////////