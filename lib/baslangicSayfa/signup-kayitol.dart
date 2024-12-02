import 'package:Vistopia/OOP/colors.dart';
import 'package:Vistopia/baslangicSayfa/login-girisyapma.dart';
import 'package:Vistopia/OOP/baslangicOop.dart';
import 'package:Vistopia/baslangicSayfa/mail-tlf-onay-kullan.dart';
import 'package:Vistopia/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'ulke-telefon-kodlari.dart';

class baslangicSingup extends StatefulWidget {

  @override

  State<baslangicSingup> createState() => _baslangicSingupstate();
}

class _baslangicSingupstate extends State<baslangicSingup> {
  var formkey=GlobalKey<FormState>();//key anahtarı
  var tfname=TextEditingController();//kullanıcı işlemleri
  var tfpassword=TextEditingController();//sifre islemleri
  var tfbirthday=TextEditingController();//doğum günü işlemleri
  var tfMail = TextEditingController();
  var tfPhone = TextEditingController();


  String? _selectedCountryCode = '+90'; // Varsayılan ülke kodu
  //PASSWORD İŞLEMLERİ OBSURECURT
  bool _isObscure = true; // Başlangıçta şifre gizli olacak
  //ULKE KODU SEARCH KISMI
  void _navigateToCountryCodeSearch() async {
    final selectedCode = await Navigator.push(//SECİLECEK KOD
      context,
      MaterialPageRoute(builder: (context) => CountryCodeSearch()),//BASLANGICOOP.DART SAYFASINA GİDER ARAMA KISMI
    );
//VARSAYILAN KOD BU OLACAK
    if (selectedCode != null) {
      setState(() {
        print("Seçilen Ülke Kodumuz: $selectedCode");
        _selectedCountryCode = selectedCode; // YENİ VARSAYILAN VE SECİLEN KOD AKTARIMI
      });
    }
  }
  //birtdayy
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: Theme(
            data: ThemeData.light(),
            child: child ?? const SizedBox.shrink(),
          ),
        );
      },
    );
    if (picked != null) {
      setState(() {
        tfbirthday.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }
  bool hasError = false;
  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height, // Ekranın tamamını kaplamasını sağlar
          width: MediaQuery.of(context).size.width,
          child: Center(
            child:
            Stack(
              children: [
                Positioned(
                  top: 0,
                  child:
                  Image.asset('image/1.1.png',
                  ),
                ),


                Column(

                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                       Center(
                        child: Padding(
                          padding:  EdgeInsets.only(top:screenHeight*0.04),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Kayıt Ol",
                                  style: TextStyle(
                                      fontFamily: "Poppins",
                                    fontSize: screenWidth * 0.09,

                                  ),),

                            ],
                          ),
                        ),
                      ),

                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding:  EdgeInsets.all(screenWidth*0.05),
                        child: Form(
                          key: formkey,
                          child:Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                //KULLANICI ADI
                                Padding(
                                  padding: const EdgeInsets.only(top: 10,bottom: 5),
                                  child: TextFormField(
                                    cursorColor: Colors.black,//yazılırkenki cursor rengi
                                    controller: tfname,
                                    decoration: customInputDecoration(
                                      colorr: Colors.black54,
                                      Filcolorr: Colors.transparent,//arkaplan rengi
                                      suffixIcon: Icons.person, // name simgesi başa eklenir
                                      hintText: "Kullanıcı Adı",
                                      labeltext: "Kullanıcı Adı",
                                      hasError: hasError,
                                    ),
                                    validator: (tfgirdisi){
                                      if(tfgirdisi!.isEmpty){
                                        setState(() => hasError = true);
                                        return "Kullanıcı Adınızı Giriniz";
                                      }
                                      if(tfgirdisi.length>15){
                                        setState(() => hasError = true);
                                        return "Kullanıcı Adı 15 karakterden Uzun Olamaz";
                                      }
                                      // Kullanıcı adında olmaması gereken karakterleri kontrol eden RegExp
                                      final regex = RegExp(r'[!?\^+%&/|-]');

                                      if (regex.hasMatch(tfgirdisi)) {
                                        setState(() => hasError = true);
                                        return "Kullanıcı adınızda ! ? ' ^ + % & / - | karakterler olmamalı";
                                      }
                                      setState(() => hasError = false);
                                      return null;
                                    },
                                  ),
                                ),
                                //PASSWORD
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0,bottom: 5.0),
                                  //PASSWORD
                                  child: TextFormField(
                                    controller: tfpassword,
                                    decoration: customInputDecoration(
                                      Filcolorr: Colors.transparent,
                                      colorr: Colors.black54,
                                      //şifre gorunur yapma kapatma
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
                                      hasError: hasError
                                    ),
                                    obscureText: _isObscure,//sifre gorunur veya gorunmez yapma
                                    validator:(tfgirdisi){
                                      if(tfgirdisi!.isEmpty){
                                        setState(() => hasError = true);
                                        return "Lütfen Şifre Giriniz";
                                      }
                                      if(tfgirdisi!.length<6){
                                        setState(() => hasError = true);
                                        return "Şifre 6 Karakterden Küçük Olamaz";
                                      }
                                      bool hasUpperCase = tfgirdisi.contains(RegExp(r'[A-Z]'));
                                      bool hasLowerCase = tfgirdisi.contains(RegExp(r'[a-z]'));
                                      bool hasDigit = tfgirdisi.contains(RegExp(r'[0-9]'));

                                      if (!hasUpperCase) {
                                        setState(() => hasError = true);
                                        return "Şifre en az bir büyük harf içermelidir";
                                      }
                                      if (!hasLowerCase) {
                                        setState(() => hasError = true);
                                        return "Şifre en az bir küçük harf içermelidir";
                                      }
                                      if (!hasDigit) {
                                        setState(() => hasError = true);
                                        return "Şifre en az bir rakam içermelidir";
                                      }
                                      setState(() => hasError = false);
                                      return null;
                                    },
                                  ),
                                ),
                                //EMAİL
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0,bottom: 5.0),
                                  //E MAİL
                                  child: TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    controller: tfMail,
                                    decoration: customInputDecoration(
                                      Filcolorr: Colors.transparent,
                                      colorr: Colors.black54,
                                      suffixIcon: Icons.email_outlined, // email simgesi başa eklenir
                                        hintText: "E-Mail Giriniz",
                                        labeltext: "E-Mail Giriniz",
                                      hasError: hasError
                                    ),
                                    validator:(tfgirdisi){
                                      if(tfgirdisi!.isEmpty){
                                        setState(() => hasError = true);
                                        return "Lütfen Email Giriniz";
                                      }
                                      if(!tfgirdisi.contains("@")){
                                        return "Lütfen Geçerli Bir E-Mail Adresi Giriniz";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                //BİRTDAY
                                Padding(
                                  padding: const EdgeInsets.only(top: 10,bottom: 5),
                                  child: TextFormField(
                                    cursorColor: Colors.black,//yazılırkenki cursor rengi
                                    controller: tfbirthday,
                                    decoration: customInputDecoration(
                                      Filcolorr: Colors.transparent,//arkaplan rengi
                                      colorr: Colors.black54,//error color
                                      suffixIcon: Icons.calendar_month, // name simgesi başa eklenir
                                        hintText: "Doğum Tarihiniz",
                                        labeltext: "Doğum Tarihiniz",
                                      hasError: hasError
                                    ),
                                      validator:(tfgirdisi) {
                                        if (tfgirdisi!.isEmpty) {
                                          setState(() => hasError = true);
                                          return "Lütfen Doğum Tarihini Giriniz";
                                        }
                                        setState(() => hasError = false);
                                        return null;
                                      },
                                    onTap: () {
                                      // Klavyeyi kapatmak için.
                                      FocusScope.of(context).requestFocus(FocusNode());
                                      _selectDate(context);
                                    },
                                  ),
                                ),
                                //telefon
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0,bottom: 5.0),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: screenHeight*0.072,
                                        width: 100,
                                        decoration: BoxDecoration(
                                          color: Colors.transparent, // Arka plan rengi (yarı şeffaf beyaz)
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10)
                                          ),
                                          border: Border.all(
                                            color: Colors.black54,
                                            width: 1
                                          )
                                        ),
                                        child: TextButton(
                                          onPressed: _navigateToCountryCodeSearch,
                                          child: Text(
                                            //VARSAYILAN VE GOSTERİLEN KOD
                                            _selectedCountryCode ?? 'Henüz ülke kodu seçilmedi',
                                            style: TextStyle(fontSize: 20,color: Colors.black54),


                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 3.0), // Dropdown ile TextField arasındaki boşluk
                                      Expanded(
                                        child: TextFormField(
                                          keyboardType: TextInputType.number,
                                          controller: tfPhone,
                                          decoration: customInputDecoration(
                                            Filcolorr: Colors.transparent,//arkaplan rengi
                                            colorr: Colors.black54,//error rengi
                                            suffixIcon: Icons.phone_outlined,
                                              hintText: "Telefon",
                                              labeltext: "Telefon",
                                            hintStyle: TextStyle(
                                              color: Colors.grey[600],
                                            ),
                                            hasError: hasError
                                          ),
                                          validator:(tfgirdisi){
                                            if(tfgirdisi!.isEmpty){
                                              setState(() => hasError = true);
                                              return "Telefon Numaranızı Giriniz";
                                            }
                                            if (_selectedCountryCode=='+90'&&tfgirdisi.isNotEmpty && tfgirdisi[0] != '5' ) {
                                              setState(() => hasError = true);
                                              return "Geçersiz numara";
                                            }

                                            if (tfgirdisi.length != 10) {
                                              setState(() => hasError = true);
                                              return "Telefon Numarası 10 Karakterdir";
                                            }
                                            if (!RegExp(r'^[0-9]+$').hasMatch(tfgirdisi)) {
                                              setState(() => hasError = true);
                                              return "Sadece Rakam Girilmelidir"; // Harf veya özel karakter kontrolü
                                            }
                                            setState(() => hasError = false);
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
                        ),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(bottom:screenHeight*0.03),
                      child: SizedBox(
                        width: screenWidth * 1.1,
                        //baslangicoop button
                        child: CustomButton(
                          text: "Kayıt OL",
                          onPressed:(){
                            //key anahtarları buraya gelir ve doğrulama işlemleri olur
                            //yani karakter uzunluğu 6 yı geciyor mu mesela
                            print("Anasayfaya Geçiş izni kontrol ediliyor");
                            bool kontrolsonucu=formkey.currentState!.validate();//TEXTFİELD KONTROL
                            if(kontrolsonucu){
                              String name = tfname.text;
                              String pasw = tfpassword.text;
                              String mail=tfMail.text;
                              String birthday=tfbirthday.text;
                              String tlf=tfPhone.text;
                              print("Kullanıcı Adı:$name ve Şifresi $pasw . mail:$mail , doğum tarihi: $birthday, telefonu:$tlf");
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>
                                  MainSayfa()
                              ));
                            }


                          },
                          backgroundColor:Colorss.vibrantTeal,
                          textColor: Colors.white,
                          borderColor: Colors.black87,
                          elevation: 5,
                          borderRadius: 30,
                          fontSize: screenWidth*0.05,
                        ),),


                    ),

                  ],
                ),
                Padding(
                  padding:  EdgeInsets.only(bottom: screenHeight*0.045, ),
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
                            Text("Hesabınız var mı?", style: TextStyle(color: Colors.black)),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => baslangicLogin(),
                                  ),
                                );
                              },
                              child: Text(
                                "Giriş Yap",
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
