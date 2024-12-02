import 'package:Vistopia/OOP/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../OOP/baslangicOop.dart';

/////////////////////////////ULKE KODLARI//////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////
void main() => runApp(countrycodess());
class countrycodess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CountryCodeSearch(),
    );
  }
}

class CountryCodeSearch extends StatefulWidget {
  @override
  _CountryCodeSearchState createState() => _CountryCodeSearchState();
}

class _CountryCodeSearchState extends State<CountryCodeSearch> {
  //countyr listesi
  final List<Map<String, String>> countryCodes = [
    {'code': '+93', 'name': 'Afganistan'},
    {'code': '+355', 'name': 'Arnavutluk'},
    {'code': '+213', 'name': 'Cezayir'},
    {'code': '+376', 'name': 'Andorra'},
    {'code': '+244', 'name': 'Angola'},
    {'code': '+1264', 'name': 'Antigua ve Barbuda'},
    {'code': '+54', 'name': 'Arjantin'},
    {'code': '+687', 'name': 'Yeni Kaledonya'},
    {'code': '+61', 'name': 'Avustralya'},
    {'code': '+43', 'name': 'Avusturya'},
    {'code': '+994', 'name': 'Azerbaycan'},
    {'code': '+1242', 'name': 'Bahamalar'},
    {'code': '+973', 'name': 'Bahreyn'},
    {'code': '+880', 'name': 'Bangladeş'},
    {'code': '+1246', 'name': 'Barbados'},
    {'code': '+375', 'name': 'Beyaz Rusya'},
    {'code': '+32', 'name': 'Belçika'},
    {'code': '+501', 'name': 'Belize'},
    {'code': '+229', 'name': 'Benin'},
    {'code': '+1441', 'name': 'Bermuda'},
    {'code': '+975', 'name': 'Butan'},
    {'code': '+591', 'name': 'Bolivya'},
    {'code': '+387', 'name': 'Bosna-Hersek'},
    {'code': '+267', 'name': 'Botsvana'},
    {'code': '+55', 'name': 'Brezilya'},
    {'code': '+226', 'name': 'Burkina Faso'},
    {'code': '+257', 'name': 'Burundi'},
    {'code': '+855', 'name': 'Kamboçya'},
    {'code': '+237', 'name': 'Kamerun'},
    {'code': '+1', 'name': 'Kanada'},
    {'code': '+238', 'name': 'Yeşil Burun Adaları'},
    {'code': '+1345', 'name': 'Cayman Adaları'},
    {'code': '+236', 'name': 'Orta Afrika Cumhuriyeti'},
    {'code': '+235', 'name': 'Çad'},
    {'code': '+56', 'name': 'Şili'},
    {'code': '+86', 'name': 'Çin'},
    {'code': '+57', 'name': 'Kolombiya'},
    {'code': '+269', 'name': 'Komorlar'},
    {'code': '+242', 'name': 'Kongo-Brazzaville'},
    {'code': '+243', 'name': 'Kongo-Kinşasa'},
    {'code': '+682', 'name': 'Cook Adaları'},
    {'code': '+506', 'name': 'Kosta Rika'},
    {'code': '+225', 'name': 'Fildişi Sahili'},
    {'code': '+385', 'name': 'Hırvatistan'},
    {'code': '+53', 'name': 'Küba'},
    {'code': '+357', 'name': 'Kıbrıs'},
    {'code': '+420', 'name': 'Çek Cumhuriyeti'},
    {'code': '+45', 'name': 'Danimarka'},
    {'code': '+253', 'name': 'Cibuti'},
    {'code': '+1767', 'name': 'Dominika'},
    {'code': '+1809', 'name': 'Dominik Cumhuriyeti'},
    {'code': '+593', 'name': 'Ekvador'},
    {'code': '+20', 'name': 'Mısır'},
    {'code': '+503', 'name': 'El Salvador'},
    {'code': '+240', 'name': 'Ekvator Ginesi'},
    {'code': '+291', 'name': 'Eritre'},
    {'code': '+372', 'name': 'Estonya'},
    {'code': '+251', 'name': 'Etiyopya'},
    {'code': '+500', 'name': 'Falkland Adaları'},
    {'code': '+298', 'name': 'Faroe Adaları'},
    {'code': '+679', 'name': 'Fiji'},
    {'code': '+358', 'name': 'Finlandiya'},
    {'code': '+33', 'name': 'Fransa'},
    {'code': '+689', 'name': 'Fransız Polinezyası'},
    {'code': '+241', 'name': 'Gabon'},
    {'code': '+220', 'name': 'Gambia'},
    {'code': '+995', 'name': 'Gürcistan'},
    {'code': '+49', 'name': 'Almanya'},
    {'code': '+30', 'name': 'Yunanistan'},
    {'code': '+299', 'name': 'Grönland'},
    {'code': '+502', 'name': 'Guatemala'},
    {'code': '+44', 'name': 'Birleşik Krallık'},
    {'code': '+224', 'name': 'Gine'},
    {'code': '+245', 'name': 'Gine-Bissau'},
    {'code': '+509', 'name': 'Haiti'},
    {'code': '+379', 'name': 'Vatikan'},
    {'code': '+39', 'name': 'İtalya'},
    {'code': '+962', 'name': 'Ürdün'},
    {'code': '+7', 'name': 'Rusya'},
    {'code': '+254', 'name': 'Kenya'},
    {'code': '+686', 'name': 'Kirim'},
    {'code': '+965', 'name': 'Kuveyt'},
    {'code': '+996', 'name': 'Kırgızistan'},
    {'code': '+856', 'name': 'Laos'},
    {'code': '+371', 'name': 'Letonya'},
    {'code': '+961', 'name': 'Lübnan'},
    {'code': '+266', 'name': 'Lesotho'},
    {'code': '+231', 'name': 'Liberia'},
    {'code': '+218', 'name': 'Libya'},
    {'code': '+423', 'name': 'Liechtenstein'},
    {'code': '+370', 'name': 'Litvanya'},
    {'code': '+352', 'name': 'Lüksemburg'},
    {'code': '+853', 'name': 'Makau'},
    {'code': '+389', 'name': 'Kuzey Makedonya'},
    {'code': '+261', 'name': 'Madagaskar'},
    {'code': '+265', 'name': 'Malavi'},
    {'code': '+60', 'name': 'Malezya'},
    {'code': '+960', 'name': 'Maldivler'},
    {'code': '+223', 'name': 'Mali'},
    {'code': '+356', 'name': 'Malta'},
    {'code': '+692', 'name': 'Marşal Adaları'},
    {'code': '+596', 'name': 'Martinik'},
    {'code': '+222', 'name': 'Moritanya'},
    {'code': '+230', 'name': 'Mauritius'},
    {'code': '+262', 'name': 'Mayotte'},
    {'code': '+52', 'name': 'Meksika'},
    {'code': '+60', 'name': 'Malezya'},
    {'code': '+373', 'name': 'Moldova'},
    {'code': '+377', 'name': 'Monako'},
    {'code': '+976', 'name': 'Moğolistan'},
    {'code': '+382', 'name': 'Karadağ'},
    {'code': '+212', 'name': 'Fas'},
    {'code': '+258', 'name': 'Mozambik'},
    {'code': '+95', 'name': 'Myanmar'},
    {'code': '+264', 'name': 'Namibya'},
    {'code': '+674', 'name': 'Nauru'},
    {'code': '+977', 'name': 'Nepal'},
    {'code': '+31', 'name': 'Hollanda'},
    {'code': '+687', 'name': 'Yeni Kaledonya'},
    {'code': '+64', 'name': 'Yeni Zelanda'},
    {'code': '+505', 'name': 'Nikaragua'},
    {'code': '+227', 'name': 'Nijer'},
    {'code': '+234', 'name': 'Nijerya'},
    {'code': '+683', 'name': 'Niue'},
    {'code': '+850', 'name': 'Kuzey Kore'},
    {'code': '+47', 'name': 'Norveç'},
    {'code': '+968', 'name': 'Umman'},
    {'code': '+92', 'name': 'Pakistan'},
    {'code': '+680', 'name': 'Palau'},
    {'code': '+507', 'name': 'Panama'},
    {'code': '+675', 'name': 'Papua Yeni Gine'},
    {'code': '+595', 'name': 'Paraguay'},
    {'code': '+51', 'name': 'Peru'},
    {'code': '+63', 'name': 'Filipinler'},
    {'code': '+48', 'name': 'Polonya'},
    {'code': '+351', 'name': 'Portekiz'},
    {'code': '+974', 'name': 'Katar'},
    {'code': '+40', 'name': 'Romanya'},
    {'code': '+250', 'name': 'Ruanda'},
    {'code': '+262', 'name': 'Réunion'},
    {'code': '+7', 'name': 'Rusya'},
    {'code': '+378', 'name': 'San Marino'},
    {'code': '+966', 'name': 'Suudi Arabistan'},
    {'code': '+221', 'name': 'Senegal'},
    {'code': '+381', 'name': 'Sırbistan'},
    {'code': '+248', 'name': 'Seyşeller'},
    {'code': '+232', 'name': 'Sierra Leone'},
    {'code': '+65', 'name': 'Singapur'},
    {'code': '+421', 'name': 'Slovakya'},
    {'code': '+386', 'name': 'Slovenya'},
    {'code': '+677', 'name': 'Solomon Adaları'},
    {'code': '+252', 'name': 'Somali'},
    {'code': '+27', 'name': 'Güney Afrika'},
    {'code': '+82', 'name': 'Güney Kore'},
    {'code': '+211', 'name': 'Güney Sudan'},
    {'code': '+34', 'name': 'İspanya'},
    {'code': '+94', 'name': 'Sri Lanka'},
    {'code': '+249', 'name': 'Sudan'},
    {'code': '+597', 'name': 'Surinam'},
    {'code': '+268', 'name': 'Svaziland'},
    {'code': '+46', 'name': 'İsveç'},
    {'code': '+41', 'name': 'İsviçre'},
    {'code': '+963', 'name': 'Suriye'},
    {'code': '+992', 'name': 'Tacikistan'},
    {'code': '+255', 'name': 'Tanzanya'},
    {'code': '+66', 'name': 'Tayland'},
    {'code': '+228', 'name': 'Togo'},
    {'code': '+676', 'name': 'Tonga'},
    {'code': '+216', 'name': 'Tunus'},
    {'code': '+90', 'name': 'Türkiye'},
    {'code': '+993', 'name': 'Türkmenistan'},
    {'code': '+688', 'name': 'Tuvalu'},
    {'code': '+256', 'name': 'Uganda'},
    {'code': '+380', 'name': 'Ukrayna'},
    {'code': '+971', 'name': 'Birleşik Arap Emirlikleri'},
    {'code': '+598', 'name': 'Uruguay'},
    {'code': '+998', 'name': 'Özbekistan'},
    {'code': '+678', 'name': 'Vanuatu'},
    {'code': '+58', 'name': 'Venezuela'},
    {'code': '+84', 'name': 'Vietnam'},
    {'code': '+681', 'name': 'Wallis ve Futuna'},
    {'code': '+967', 'name': 'Yemen'},
    {'code': '+260', 'name': 'Zambiya'},
    {'code': '+263', 'name': 'Zimbabve'},
  ];

  @override

  List<Map<String, String>> filteredCountryCodes = [];//arama kısmına ulke bulma

  void initState() {
    super.initState();
    // filteredCountryCodes listesini başlangıçta tüm countryCodes ile doldur
    filteredCountryCodes = List.from(countryCodes);
  }
//ulke isminden bulma
  void _filterCountryCodes(String query) {
    setState(() {
      filteredCountryCodes = countryCodes
          .where((country) =>//country kısmında name kısmına eriş
      country['name']!.toLowerCase().contains(query.toLowerCase()))
          .toList();//filtreli aramayı liste donustur
    });
  }
  String? _selectedCode;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(

      body: Stack(
        children:[
          Positioned(
            top: 0,
            child: Image.asset("image/1.1.png",
            ),

          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: Colors.transparent,
                  width: 2.0,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12.withOpacity(0.1),
                    blurRadius: 20.0,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Padding(
                    padding:  EdgeInsets.only(top:screenHeight*0.05,right: screenWidth*0.02,left: screenWidth*0.02),
                    child: TextField(

                      cursorColor: Colors.grey,
                      cursorErrorColor: Colors.grey,
                      onChanged: _filterCountryCodes,
                      decoration:customInputDecoration(

                        Filcolorr: Colors.transparent,//arkaplan rengi

                        labeltext: "Ülke Telefon Kodları",

                        suffixIcon: Icons.search,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: filteredCountryCodes.length,
                      itemBuilder: (context, index) {
                        final countryCode = filteredCountryCodes[index];
                        final isSelected = _selectedCode == countryCode['code'];
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedCode = countryCode['code'];
                              Navigator.pop(context, _selectedCode); // Seçilen ülke kodunu geri döndür
                            });
                            print("Seçilen Ülke Kodu: ${countryCode['code']}");
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
                              margin: EdgeInsets.only(bottom: 1.0), // Her bir öğe arasına boşluk bırakmak için margin

                              decoration: BoxDecoration(

                                color: index % 2 == 0 ? Colors.white30 : Colors.white, // Alternatif arka plan rengi için
                                borderRadius: BorderRadius.circular(10.0), // Köşeleri yuvarlatmak için
                                border: Border.all(
                                  color: isSelected ? Colors.black : Colorss.vibrantTeal,
                                  width: 1.5,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    filteredCountryCodes[index]['name']!,
                                    style: TextStyle(
                                      fontFamily: "OpenSans", //ulke ismi fontstyle
                                      color: isSelected ? Colors.black :Colors.black54,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  Text(
                                    filteredCountryCodes[index]['code']!,
                                    style: TextStyle(
                                      fontFamily: "OpenSans", //ulke ismi fontstyle

                                      color: isSelected ? Colors.black : Colors.black54,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}