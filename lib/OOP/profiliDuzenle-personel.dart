import 'dart:io';
import 'package:Vistopia/OOP/baslangicOop.dart';
import 'package:Vistopia/MainSayfa/Main-Personel.dart'; // Personel sınıfı buradan içe aktarılıyor
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'colors.dart';

class ProfileEditPage extends StatefulWidget {
  @override
  _ProfileEditPageState createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController linkController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  File? profileImage;
  File? coverImage;

  bool isValidUrl(String url) {
    try {
      final uri = Uri.parse(url);
      return uri.hasScheme && uri.hasAuthority;
    } catch (e) {
      return false;
    }
  }

  Future<void> pickImage(bool isProfile) async {
    final picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        if (isProfile) {
          profileImage = File(image.path);
        } else {
          coverImage = File(image.path);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Profili Düzenle'),
        actions: [
          TextButton(
            onPressed: () {
              final userdataa = Kullanici(

                isim: nameController.text,
                hakkimda: bioController.text,
                hakkimda2: locationController.text,
                baglantiLinki: linkController.text,
              );
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => Personel(userDataaa: userdataa),
                ),
                    (route) => false, // Bu, tüm önceki sayfaları çıkartacak
              );
            },
            child: Text('Kaydet', style: TextStyle(color: Colorss.vibrantTeal)),
          ),


        ],
      ),

            body: Stack(
            children: [
            SingleChildScrollView(
              child: Column(
              children: [
              Stack(
              children: [
            Container(
            height: screenHeight * 2.2 / 10,
              width: screenWidth,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                image: coverImage != null
                    ? DecorationImage(
                  image: FileImage(coverImage!),
                  fit: BoxFit.cover,
                )
                    : null,
              ),
              child: coverImage == null
                  ? Icon(Icons.camera_alt, size: 40, color: Colors.grey)
                  : null,
            ),
            Positioned(
              right: 10,
              bottom: 10,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: IconButton(
                  icon: Icon(Icons.camera_alt_outlined, color: Colorss.vibrantTeal),
                  onPressed: () => pickImage(false),
                ),
              ),
            ),
            ],
          ),
          Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20),
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey[200],
                  backgroundImage: profileImage != null
                      ? FileImage(profileImage!)
                      : null,
                  child: profileImage == null
                      ? Icon(Icons.person, size: 50, color: Colors.grey)
                      : null,
                ),
              ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 18,
                        child: IconButton(
                          icon: Icon(Icons.camera_alt_outlined, size: 18, color: Colorss.vibrantTeal),
                          onPressed: () => pickImage(true),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [

                      SizedBox(height: 16),
                      TextFormField(
                        controller: nameController,
                        maxLength: 25,
                        decoration: InputDecoration(
                          labelText: 'İsim',
                          labelStyle: TextStyle(
                            color: Colorss.darkGray,         // Etiket rengi siyah
                            fontWeight: FontWeight.bold, // Etiketin kalın olması
                            fontSize: 16,                // Etiketin yazı boyutu
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colorss.vibrantTeal),  // Border rengini vibrantTeal yapıyoruz
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colorss.vibrantTeal),  // Focuslandığında da aynı renk
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colorss.vibrantTeal),  // Enable durumunda da aynı renk
                          ),
                        ),
                        cursorColor: Colorss.vibrantTeal,  // Cursor rengini vibrantTeal yapıyoruz
                      ),

                      SizedBox(height: 16),
                      TextFormField(
                        controller: locationController,
                        maxLength: 25,
                        decoration: InputDecoration(
                          labelText: 'Location',
                          labelStyle: TextStyle(
                            color: Colorss.darkGray,         // Etiket rengi siyah
                            fontWeight: FontWeight.bold, // Etiketin kalın olması
                            fontSize: 16,                // Etiketin yazı boyutu
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colorss.vibrantTeal),  // Border rengini vibrantTeal yapıyoruz
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colorss.vibrantTeal),  // Focuslandığında da aynı renk
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colorss.vibrantTeal),  // Enable durumunda da aynı renk
                          ),
                        ),
                        cursorColor: Colorss.vibrantTeal,  // Cursor rengini vibrantTeal yapıyoruz
                      ),

                      SizedBox(height: 16),
                      TextFormField(
                        controller: bioController,
                        maxLength: 25,
                        maxLines: 3,
                        decoration: InputDecoration(
                          labelText: 'Kişisel Bilgiler',
                          labelStyle: TextStyle(
                            color: Colorss.darkGray,         // Etiket rengi siyah
                            fontWeight: FontWeight.bold, // Etiketin kalın olması
                            fontSize: 16,                // Etiketin yazı boyutu
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colorss.vibrantTeal),  // Border rengini vibrantTeal yapıyoruz
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colorss.vibrantTeal),  // Focuslandığında da aynı renk
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colorss.vibrantTeal),  // Enable durumunda da aynı renk
                          ),
                        ),
                        cursorColor: Colorss.vibrantTeal,  // Cursor rengini vibrantTeal yapıyoruz
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        controller: linkController,
                        decoration: InputDecoration(
                          labelText: 'Bağlantı',
                          labelStyle: TextStyle(
                            color: Colorss.darkGray,         // Etiket rengi siyah
                            fontWeight: FontWeight.bold, // Etiketin kalın olması
                            fontSize: 16,                // Etiketin yazı boyutu
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colorss.vibrantTeal),  // Border rengini vibrantTeal yapıyoruz
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colorss.vibrantTeal),  // Focuslandığında da aynı renk
                          ),

                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colorss.vibrantTeal),  // Enable durumunda da aynı renk
                          ),
                        ),
                        cursorColor: Colorss.vibrantTeal,  // Cursor rengini vibrantTeal yapıyoruz
                        validator: (value) {
                          if (value != null && value.isNotEmpty && !isValidUrl(value)) {
                            return 'Geçerli bir URL giriniz';
                          }
                          return null;
                        },
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
