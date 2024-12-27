import 'package:Vistopia/MainSayfa/Main-Home-Index.dart';
import 'package:flutter/material.dart';

import 'MainSayfa/Main-Location.dart';
import 'MainSayfa/Main-Personel.dart';
import 'MainSayfa/Main-Post.dart';
import 'MainSayfa/Main-Search.dart';
import 'OOP/baslangicOop.dart';
void main() {
  runApp(MaterialApp(
    home: MainSayfa(),
    debugShowCheckedModeBanner: false,
  ));
}

class MainSayfa extends StatefulWidget {
  final VerificationData? verificationData; // Optional data
  final Kullanici? userdata; // Optional data

  const MainSayfa({this.verificationData ,this.userdata});
  @override
  State<MainSayfa> createState() => _MainSayfaState();
}


class _MainSayfaState extends State<MainSayfa> {
  late final List<Widget> sayfaListesi;

  @override
  void initState() {
    super.initState();
    sayfaListesi = [
      Location(),
      Search(),
      HomeIndex(),
      PostAdd(),
      // Eğer userdata null ise, default bir kullanıcı objesi oluşturabilirsiniz
      Personel(
        data: widget.verificationData,
        userDataaa: widget.userdata ??
            Kullanici(isim: 'Default User',
                hakkimda: 'defaultc1',
                hakkimda2:'default2',
                baglantiLinki:".com",

            ),
      ),// Removed data parameter
    ];
  }

  int secilenIndex = 2;
  bool postAddIcon = true;
  bool mainIcon = true;
  bool searchIcon = true;
  bool personIcon = true;
  bool navigationIcon = true;

  void _onIconTapped(int index) {
    setState(() {
      if (index != secilenIndex) {
        secilenIndex = index;
        navigationIcon = index == 0 ? !navigationIcon : true;
        searchIcon = index == 1 ? !searchIcon : true;
        mainIcon = index == 2 ? !mainIcon : true;
        postAddIcon = index == 3 ? !postAddIcon : true;
        personIcon = index == 4 ? !personIcon : true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: sayfaListesi[secilenIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              navigationIcon ? Icons.location_off_sharp : Icons.location_on,
              size: 30,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              searchIcon ? Icons.search_outlined : Icons.search_sharp,
              size: 30,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              mainIcon ? Icons.home_filled : Icons.home_sharp,
              size: 30,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              postAddIcon
                  ? Icons.add_box_outlined
                  : Icons.add_circle_outline_outlined,
              size: 30,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              personIcon ? Icons.person : Icons.person_2,
              size: 30,
            ),
            label: "",
          ),
        ],
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white70,
        unselectedItemColor: Colors.white,
        currentIndex: secilenIndex,
        onTap: (index) => _onIconTapped(index),
      ),
    );
  }
}