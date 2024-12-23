import 'package:Vistopia/OOP/colors.dart';
import 'package:Vistopia/baslangicSayfa/login-girisyapma.dart';
import 'package:Vistopia/baslangicSayfa/mail-tlf-onay-kullan.dart';
import 'package:Vistopia/baslangicSayfa/sifre-unutma.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../main.dart';
import 'baslangicOop.dart';

/////////////////////////////////////////////////KODU ONAYLAMA//////////
class SifreUnutmaKod extends StatefulWidget {
  const SifreUnutmaKod({Key? key}) : super(key: key);

  @override
  State<SifreUnutmaKod> createState() => _SifreUnutmaKodState();
}
var formKey2 = GlobalKey<FormState>(); // Kod ve şifre formu için key
var tfKod = TextEditingController(); // Kod kontrolcüsü
var tfPassword = TextEditingController(); // Şifre onay kontrolcüsü
var tfPassword2 = TextEditingController(); // Şifre mail kontrolcüsü
bool _isObscure = true; // Başlangıçta şifre gizli olacak
bool _isObscure2 = true; // Başlangıçta şifre gizli olacak


class _SifreUnutmaKodState extends State<SifreUnutmaKod> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child:                    // Kod ve şifre formu
          //gelen kod buraya yazılır
          Center(
            child: Container(
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

                  SizedBox(
                    height: screenHeight*0.5,
                    child: Center(
                      child: Text("Şifreni Değiştir",
                        style:
                        TextStyle(
                          color: Colors.black,
                          fontFamily: "Poppins",
                          fontSize: screenWidth * 0.09,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Form(
                      key: formKey2,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              //yeni şifre
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(

                                  controller: tfPassword,
                                  obscureText: _isObscure2,//sifre gorunur veya gorunmez yapma

                                  //baslangicoop sayfasından inputdecoratiın
                                  decoration: customInputDecoration(
                                    passwordd: IconButton(
                                      icon:Icon(
                                        _isObscure2 ? Icons.visibility : Icons.visibility_off,
                                        color: Colors.grey,
                                      ) ,
                                      onPressed: () {
                                        setState(() {
                                          _isObscure2 = !_isObscure2; // Şifre görünürlüğünü değiştir
                                        });
                                      },
                                    ),
                                    Filcolorr: Colors.transparent,
                                    colorr: Colors.black54,
                                    suffixIcon: Icons.password_outlined, // Name simgesi başa eklenir
                                    hintText: "Yeni Şifre",
                                    hintStyle: TextStyle(
                                      color: Colorss.darkGray, // HintText rengi
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Şifre boş olamaz";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              //yeni şifre tekrar
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(

                                  controller: tfPassword2,

                                  //baslangicoop sayfasından inputdecoratiın
                                  decoration: customInputDecoration(
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
                                    colorr: Colors.black54,
                                    Filcolorr: Colors.transparent,
                                    suffixIcon: Icons.password_outlined, // Name simgesi başa eklenir
                                    hintText: "Yeni Şifre Tekrar",
                                    hintStyle: TextStyle(
                                      color: Colorss.darkGray, // HintText rengi
                                    ),
                                  ),
                                  obscureText: _isObscure,//sifre gorunur veya gorunmez yapma

                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Şifre boş olamaz";
                                    }
                                    if (value != tfPassword.text) {
                                      return "Şifreler eşleşmiyor!";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              //baslangicoop button
                              CustomButton(
                                text: "Şifreyi Güncelle",
                                onPressed: () {
                                  if (formKey2.currentState!.validate()) {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text("Başarılı"),
                                          content: Text("Şifreniz başarıyla değiştirildi!"),
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

                                    String kod = tfKod.text;
                                    String sifre = tfPassword.text;
                                    print("Girilen Kod: $kod");
                                    print("Yeni Şifre: $sifre");
                                  }
                                  if (tfPassword.text.isEmpty || tfPassword2.text.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text("Lütfen tüm alanları doldurunuz!"),
                                        duration: Duration(seconds: 2),
                                        backgroundColor: Colorss.vibrantTeal,
                                      ),
                                    );
                                  }
                                  if (tfPassword.text != tfPassword2.text) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text("Lütfen Şifrelerin Eşleştiğinden Emin Olun!"),
                                        duration: Duration(seconds: 2),
                                        backgroundColor: Colorss.vibrantTeal,
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
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  child: Text("Şifreni mi Unuttun?",),
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>sifreYenileme()));
                                  },
                                ),),
                            ],
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
    );
  }
}
//////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////
//hesap bilgilerini telefon mail vs guncelleme

class HesapBilgileriSayfasi extends StatefulWidget {
  @override
  _HesapBilgileriSayfasiState createState() => _HesapBilgileriSayfasiState();
}

class _HesapBilgileriSayfasiState extends State<HesapBilgileriSayfasi> {
  // Kullanıcı bilgileri
  String kullaniciAdi = '@dengnekir';
  String telefonNumarasi = '05427746359';
  String mailAdresi = 'usluferhat98@gmail.com';

  // TextController'lar
  TextEditingController kullaniciAdiController = TextEditingController();
  TextEditingController telefonController = TextEditingController();
  TextEditingController mailController = TextEditingController();

  bool kullaniciAdiDuzenleniyor = false;
  bool telefonDuzenleniyor = false;
  bool mailDuzenleniyor = false;

  @override
  void initState() {
    super.initState();
    // TextController'lara mevcut kullanıcı bilgilerini atıyoruz
    kullaniciAdiController.text = kullaniciAdi;
    telefonController.text = telefonNumarasi;
    mailController.text = mailAdresi;
  }

  @override
  void dispose() {
    // Controller'ları temizliyoruz
    kullaniciAdiController.dispose();
    telefonController.dispose();
    mailController.dispose();
    super.dispose();
  }
  // Telefon numarasındaki baştaki 0'ı kaldırma fonksiyonu
  String telefonNumarasiniDuzenle(String numara) {
    if (numara.startsWith('0')) {
      return numara.substring(1); // İlk karakteri siler
    }
    return numara;
  }
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          //arkaplan resmi
          Positioned(
            top: 0,
            child: Image.asset(
              'image/1.1.png',
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Container(
                  width: screenWidth * 0.8, // İçeriği ortalamak için genişlik ayarlandı
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Hesap Bilgileri",style: TextStyle(
                        fontSize: screenWidth*.7/10,
                        fontWeight: FontWeight.bold,
                      ),),
                      SizedBox(
                        height: screenHeight*.4/10,
                      ),
                      // Kullanıcı Adı
                      Text(
                        'Kullanıcı Adı:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth * 0.05, // Ekran boyutuna göre font
                        ),
                      ),
                      SizedBox(height: 8),
                      kullaniciAdiDuzenleniyor
                          ? TextField(
                        maxLength: 20,
                        controller: kullaniciAdiController,
                        decoration: InputDecoration(hintText: 'Yeni kullanıcı adı'),
                        onSubmitted: (value) {
                          setState(() {
                            kullaniciAdi = value;
                            kullaniciAdiDuzenleniyor = false;
                          });
                        },

                      )

                          : GestureDetector(
                        onTap: () {
                          setState(() {
                            kullaniciAdiDuzenleniyor = true;
                          });
                        },
                        child: Text(kullaniciAdi, style: TextStyle(fontSize: 16)),
                      ),
                      Divider(),
                      Divider(),

                      SizedBox(height: 16),

                      // Telefon Numarası
                      Text(
                        'Telefon:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth * 0.05, // Ekran boyutuna göre font
                        ),
                      ),
                      SizedBox(height: 8),
                      telefonDuzenleniyor
                          ? TextField(
                        keyboardType: TextInputType.number,
                        maxLength: 10,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly, // Sadece sayıları kabul eder
                        ],
                        controller: telefonController,
                        decoration: InputDecoration(hintText: 'Yeni telefon numarası'),
                        onChanged: (value) {
                          // Başındaki 0'ı kaldırıyoruz
                          setState(() {
                            telefonController.text = telefonNumarasiniDuzenle(value);
                            telefonController.selection = TextSelection.fromPosition(
                                TextPosition(offset: telefonController.text.length));
                          });
                        },
                        onSubmitted: (value) {
                          setState(() {
                            telefonNumarasi = telefonNumarasiniDuzenle(value);
                            telefonDuzenleniyor = false;
                          });
                        },
                      )
                          : GestureDetector(
                        onTap: () {
                          setState(() {
                            telefonDuzenleniyor = true;
                          });
                        },
                        child: Text(telefonNumarasi, style: TextStyle(fontSize: 16)),
                      ),
                      Divider(),
                      Divider(),

                      SizedBox(height: 16),

                      // Mail Adresi
                      Text(
                        'E-posta:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth * 0.05, // Ekran boyutuna göre font
                        ),
                      ),
                      SizedBox(height: 8),
                      mailDuzenleniyor
                          ? TextField(
                        controller: mailController,
                        decoration: InputDecoration(hintText: 'Yeni mail adresi'),
                        onSubmitted: (value) {
                          setState(() {
                            mailAdresi = value;
                            mailDuzenleniyor = false;
                          });
                        },
                      )
                          : GestureDetector(
                        onTap: () {
                          setState(() {
                            mailDuzenleniyor = true;
                          });
                        },
                        child: Text(mailAdresi, style: TextStyle(fontSize: 16)),
                      ),
                      Divider(),
                      Divider(),

                      SizedBox(height: 32),

                      // Düzenleme Butonu (isteğe bağlı)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                          onPressed: () {
                    // Güncel bilgileri alıyoruz
                    setState(() {
              kullaniciAdi = kullaniciAdiController.text;
              telefonNumarasi = telefonController.text;
              mailAdresi = mailController.text;
              });

              // Güncellenen bilgileri yeni ekrana gönderiyoruz
              Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => kodOnaylama(
                  data: VerificationData(
                    email: mailAdresi,
                    phoneNumber: telefonNumarasi,
                    userName: kullaniciAdi,
                  ),
                ),
              ),
            );

              print('Bilgiler kaydedildi.');
    },
      child: Text('Kaydet'),
    ),

    ElevatedButton(
                            onPressed: () {
                              // Düzenleme işlemi (örneğin, veritabanına kaydetme)
                              print('çıkış yapıldı.');
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                  baslangicLogin(),
                              ));
                            },
                            child: Text('Çıkış Yap',style: TextStyle(color: Colors.red),),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
}

//////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////
//hesabı silme

class HesapSilmeCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      contentPadding: EdgeInsets.all(16),
      title: Text(
        'Hesabı silmek istediğinize emin misiniz?',
        style: TextStyle(fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 8),
          Text(
            ' 30 gün sonra hesabınız tamamen silinecek, verilerinize '
                'erişim mümkün olmayacaktır. Ancak, bu süre boyunca fikrinizi '
                'değiştirirseniz hesabınıza giriş yaparak işlemi iptal edebilirsiniz. '
                'Geri döneceğiniz umuduyla, sizi özleyeceğimizi bilmenizi istiyoruz.',
            style: TextStyle(color: Colors.grey, fontSize: 14),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              // Hesap silme işlemini burada gerçekleştirin
              print('Hesap silindi.');
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colorss.vibrantTeal,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.symmetric(vertical: screenHeight*.1/10, horizontal: screenWidth*1.3/10),
            ),
            child: Text(
              'Sil',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
