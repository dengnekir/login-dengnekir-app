

import 'package:Vistopia/MainSayfa/Main-Location.dart';
import 'package:flutter/material.dart';

import 'MainSayfa/Main-Chat.dart';
import 'MainSayfa/Main-Home-Index.dart';
import 'MainSayfa/Main-Personel.dart';
import 'MainSayfa/Main-Search.dart';


void main() {
  runApp(const MainSayfa());
}

class MainSayfa extends StatelessWidget {
  const MainSayfa({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dengnekir',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white70),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Dengnekir'),
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
  //sırasıyla bottombar sayfaları
  var sayfaListesi = [Location(), Search(),HomeIndex(), Chat(), Personel()];
  //sayfa acıldığında acık olan bottombar
  int secilenIndex = 2;

//ikonların mevcut hali
  bool messageIcon = true;
  bool mainIcon = true;
  bool searchIcon = true;
  bool personIcon = true;
  bool navigationIcon = true;
//ikon rengi ne ise ikon o sekil alır ikinci ikon calısmaz
  void _onIconTapped(int index) {
    setState(() {
      if (index != secilenIndex) {
        secilenIndex = index;

        // İkon durumlarını sıfırlama
        navigationIcon = index == 0 ? !navigationIcon : true;
        searchIcon = index == 1 ? !searchIcon : true;
        mainIcon = index == 2 ? !mainIcon : true;
        messageIcon = index == 3 ? !messageIcon : true;
        personIcon = index == 4 ? !personIcon : true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //acılacak sayfa listesi
      body: sayfaListesi[secilenIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              navigationIcon ? Icons.location_off_sharp: Icons.location_on,
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
              messageIcon ? Icons.notifications_paused : Icons.notifications,
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
        type: BottomNavigationBarType.fixed,//arkplan renginin değişmesini sağlar
        backgroundColor:Colors.black, //arksplan rengi
        selectedItemColor: Colors.white70,//secili ikon rengi
        unselectedItemColor: Colors.white,//secili olmayan ikon rengi
        currentIndex: secilenIndex,//sayfalar arası baglantı ile bottom bar baglantı noktası
        onTap: (index) => _onIconTapped(index),
      ),
    );
  }
}
