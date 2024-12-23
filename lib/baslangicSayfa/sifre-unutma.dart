import 'package:Vistopia/OOP/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


import '../OOP/sifre-degistirme.dart';
import 'signup-kayitol.dart';
import '../OOP/baslangicOop.dart';
import 'ulke-telefon-kodlari.dart';
class sifreYenileme extends StatefulWidget {

  @override
  State<sifreYenileme> createState() => _sifreyenilemeState();
}
//AutomaticKeepAliveClientMixin amacı geri gelince her seyin yerli yerince olmasını sağlar
class _sifreyenilemeState extends State<sifreYenileme> with AutomaticKeepAliveClientMixin {
  var formKey1 = GlobalKey<FormState>(); // Kullanıcı adı formu için key
  var formKey2 = GlobalKey<FormState>(); // Kod formu için key
  var tfKullanici = TextEditingController();
  var tfmail = TextEditingController();
  var tfphone = TextEditingController();
  var tfKod = TextEditingController();
  String? _selectedCountryCode = '+90'; // Varsayılan ülke kodu

  // Durumu korumak için gerekli
  @override
  bool get wantKeepAlive => true;

  void _navigateToCountryCodeSearch() async {
    final selectedCode = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CountryCodeSearch()),
    );

    if (selectedCode != null) {
      setState(() {
        _selectedCountryCode = selectedCode;
      });
    }
  }


  @override

  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return DefaultTabController(//SAYFAYI TAB YAPMA
      length: 3,//TAB UZUNLUĞU 3
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Center(
              child: Container( //MAİN CONTAİNER
                height: MediaQuery.of(context).size.height, // Ekranın tamamını kaplamasını sağlar
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [

                    //arkaplan resmi
                    Positioned(
                      top: 0,
                      child: Image.asset(
                        'image/1.1.png',
                      ),
                    ),
                    //logo hizalama
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                              height: screenHeight*0.25,
                              width: screenWidth*0.2,
                              child: Image.asset("image/logo.png")
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(top:screenHeight*0.1),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Padding(
                              padding:  EdgeInsets.all(screenHeight*0),
                              child: Column(
                                children: [
                                  // Kullanıcı adı formu || FORM 1
                                  Form(
                                    key: formKey1,
                                    child: Container( //CONTAİNER 1
                                      width: screenWidth*0.9,
                                      height: screenHeight*0.36,
                                      padding: EdgeInsets.all(screenHeight*0.02),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16.0),
                                        border: Border.all(
                                          color: Colorss.vibrantTeal,
                                          width: 2.0,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black12.withOpacity(0.1),
                                            blurRadius: 16.0,//golge bulanıklılıgı
                                            spreadRadius: 3, // Gölgenin yayılma alanı
                                            offset: Offset(0, 9),
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        children: [
                                          Text(
                                            "Kullanıcı adı, e-posta veya telefon numaranızı girin",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                          //TABBAR KAYDIRMA EKRANI
                                          TabBar(
                                            tabs: [
                                              Tab(
                                                text: "Kullanıcı Adı",
                                              ),
                                              Tab(
                                                text: "Mail",
                                              ),
                                              Tab(
                                                text: "Telefon",
                                              ),
                                            ],
                                            indicatorColor: Colorss.vibrantTeal,
                                            labelColor: Colorss.vibrantTeal,
                                            unselectedLabelColor: Colorss.darkGray,

                                          ),
                                          SizedBox(
                                            height: screenHeight*0.15,
                                            child: TabBarView(
                                              children: [
                                                // Kullanıcı Adı
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.all(8.0),
                                                  child: TextFormField(
                                                    controller: tfKullanici,
                                                    decoration:
                                                    customInputDecoration(
                                                      Filcolorr: Colors.transparent,
                                                      colorr: Colors.black54,
                                                      suffixIcon: Icons
                                                          .person,
                                                      hintText:
                                                      "Kullanıcı Adı",
                                                      hintStyle: TextStyle(
                                                        color: Colorss.darkGray,
                                                      ),
                                                    ),
                                                    validator: (value){
                                                      if(value!.isEmpty){
                                                        return "Kullanıcı Adınızı Giriniz";
                                                      }
                                                      if(value.length>15){
                                                        return "Kullanıcı Adı 15 karakterden Uzun Olamaz";
                                                      }
                                                      // Kullanıcı adında olmaması gereken karakterleri kontrol eden RegExp
                                                      final regex = RegExp(r'[!?\^+%&/|-]');

                                                      if (regex.hasMatch(value)) {
                                                        return "Kullanıcı adınızda ! ? ' ^ + % & / - | karakterler olmamalı";
                                                      }
                                                      return null;
                                                    },
                                                  ),
                                                ),
                                                // Mail
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.all(8.0),
                                                  child: TextFormField(
                                                    keyboardType: TextInputType.emailAddress,
                                                    controller: tfmail,
                                                    decoration:
                                                    customInputDecoration(
                                                      Filcolorr: Colors.transparent,
                                                      colorr: Colors.black54,
                                                      suffixIcon:
                                                      Icons.email_outlined,
                                                      hintText: "E-posta",
                                                      hintStyle: TextStyle(
                                                        color: Colorss.darkGray
                                                      )
                                                    ),
                                                    validator:(value){
                                                      if(value!.isEmpty){
                                                        return "Lütfen Email Giriniz";
                                                      }
                                                      if(!value.contains("@")){
                                                        return "Lütfen Geçerli Bir E-Mail Adresi Giriniz";
                                                      }
                                                      return null;
                                                    },
                                                  ),
                                                ),
                                                // Telefon
                                              Padding(
                                                padding: const EdgeInsets.only(top: 10.0,bottom: 5.0),
                                                child: Row(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                              Container(//kod alanı genişliği
                                                                height: screenHeight*0.072,
                                                                width: 100,
                                                                decoration: BoxDecoration(
                                                                  color: Colors.transparent, // Arka plan rengi (yarı şeffaf beyaz)
                                                                    borderRadius: BorderRadius.all(
                                                                        Radius.circular(10)
                                                                    ),
                                                                    border: Border.all(
                                                                        color: Colorss.darkGray,
                                                                        width: 1.5
                                                                    )
                                                                ),
                                                                child: TextButton(
                                                                  onPressed: _navigateToCountryCodeSearch,
                                                                  child: Text(
                                                                    _selectedCountryCode ?? 'Henüz ülke kodu seçilmedi',//varsayılan ulke kodu
                                                                    style: TextStyle(fontSize: 20,color: Colorss.darkGray),


                                                                  ),
                                                                ),
                                                              ),
                                                        SizedBox(width: 3.0), // elevatedbutton ile TextField arasındaki boşluk
                                                        Expanded(
                                                          child: TextFormField(
                                                            keyboardType: TextInputType.number,
                                                            controller: tfphone,
                                                            decoration: customInputDecoration(
                                                              Filcolorr: Colors.transparent,
                                                              colorr: Colors.black54,
                                                              suffixIcon: Icons.phone_outlined,
                                                              hintText: "Telefon",
                                                              hintStyle: TextStyle(
                                                                color: Colorss.darkGray
                                                              ),
                                                            ),
                                                            validator:(value){
                                                              if(value!.isEmpty){
                                                                return "Lütfen Telefon Numaranızı Giriniz";
                                                              }
                                                              if (_selectedCountryCode=='+90'&&value.isNotEmpty && value[0] != '5') {
                                                                return "Geçersiz numara";
                                                              }

                                                              if (value.length != 10) {
                                                                return "Telefon Numarası 10 Karakterdir";
                                                              }
                                                              if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                                                                return "Sadece Rakam Girilmelidir"; // Harf veya özel karakter kontrolü
                                                              }
                                                              return null;
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                              ),
                                              ],
                                            ),
                                          ),
                                          CustomButton(
                                            text: "Kodu Gönder",
                                            backgroundColor:Colorss.vibrantTeal,
                                            textColor: Colors.white,
                                            borderColor: Colors.black87,
                                            elevation: 5,
                                            borderRadius: 30,
                                            fontSize: screenWidth*0.05,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 2),
                                            onPressed: () {
                                              if (formKey1.currentState!
                                                  .validate()) {//formkey texfield kontrol
                                                showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      title: Text("Başarılı"),
                                                      content: Text(
                                                        "Kod başarıyla gönderildi!\nGelen kodu yazarak yeni şifreyi belirleyiniz",
                                                      ),
                                                      actions: [
                                                        TextButton(
                                                          child: Text("Tamam"),
                                                          onPressed: () {
                                                            Navigator.pop(context);
                                                            print("kullanıcının kodu yazması bekleniyor");
                                                          },
                                                        ),

                                                      ],

                                                    );

                                                  },

                                                );
                                                String kullanici =
                                                    tfKullanici.text;
                                                String mail =
                                                tfmail.text;
                                                String telefon =
                                                tfphone.text;
                                                print(
                                                    "Kullanıcı Adı: $kullanici, mail:$mail, telefon:$telefon");
                                                print("Kod Gönderiliyor");

                                              }

                                              else {ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                        "Lütfen kullanıcı adı, e-posta veya telefonunuzu giriniz!"),
                                                    duration:
                                                    Duration(seconds: 5),
                                                    backgroundColor:
                                                    Colorss.vibrantTeal,
                                                  ),
                                                );
                                              }
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Center(
                            child: Form(
                              key: formKey2,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Container(

                                  width: 400,
                                  height: 200,
                                  padding: EdgeInsets.all(16.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16.0),
                                    border: Border.all(
                                      color: Colorss.vibrantTeal,
                                      width: 2.0,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12.withOpacity(0.1), // Container arkaplan opaklık
                                        blurRadius: 16.0,
                                        offset: Offset(0, 7),//golge boyutu
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextFormField(
                                          keyboardType: TextInputType.number,
                                          controller: tfKod,
                                          //baslangicoop sayfasından inputdecoratiın
                                          decoration: customInputDecoration(
                                            Filcolorr: Colors.transparent,
                                            colorr: Colors.black54,
                                            suffixIcon: Icons.code, // Name simgesi başa eklenir
                                            hintText: "Kod",
                                            hintStyle: TextStyle(
                                              color: Colorss.darkGray, // HintText rengi
                                            ),
                                          ),
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return "Kod boş olamaz";
                                            }
                                            if(value.length!=6){
                                              return "Kod 6 Haneli Olmalıdır.";
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                      Spacer(),
                                      //baslangicoop button
                                      CustomButton(
                                        text: "Şifreyi Değiştir",
                                        onPressed: () {
                                          if (formKey2.currentState!.validate()) {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: Text("Başarılı"),
                                                  content: Text("Kod Alındı!"),
                                                  actions: [
                                                    TextButton(
                                                      child: Text("Tamam"),
                                                      onPressed: () {
                                                        print("sifre değiştirme sayfasına yonendiriliyor");
                                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SifreUnutmaKod(),));
                                                        // Dialogu kapatır
                                                      },
                                                    ),
                                                  ],
                                                );
                                              },
                                            );

                                            String kod = tfKod.text;
                                            print("Girilen Kod: $kod");

                                          }
                                          if (tfKod.text.isEmpty) {
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(
                                                content: Text("Kodu doldurunuz!"),
                                                duration: Duration(seconds: 2),
                                                backgroundColor: Colorss.vibrantTeal,
                                              ),
                                            );
                                          }
                                        },
                                        backgroundColor:Colorss.vibrantTeal,
                                        textColor: Colors.white,
                                        borderColor: Colors.black87,
                                        elevation: 5,
                                        borderRadius: 30,
                                        fontSize: screenWidth*0.05,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),
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
        ),
      ),
    );
  }
}
