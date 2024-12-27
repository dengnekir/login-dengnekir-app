import 'package:Vistopia/OOP/colors.dart';
import 'package:flutter/material.dart';

class FollowersFollowingPage extends StatelessWidget {
  final List<String> followers = [
    "Ahmet Yılmaz",
    "Mehmet Demir",
    "Ayşe Kaya",
    "Elif Şahin",
    "Elif Şahin",
    "Elif Şahin",
  ];

  final List<String> following = [
    "Fatma Çelik",
    "Ali Kurt",
    "Hüseyin Taş",
    "Zehra Aksoy",
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                text: "Takipçiler (${getFollowersCount()})",
              ),
              Tab(
                text: "Takip Edilenler (${getFollowingCount()})",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Takipçi Listesi
            _buildListView(context, followers, "takipçi"),
            // Takip Edilenler Listesi
            _buildListView(context, following, "takip edilen"),
          ],
        ),
      ),
    );
  }

  Widget _buildListView(BuildContext context, List<String> list, String type) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.grey[300],
            child: Icon(Icons.person, color: Colors.grey[700]),
          ),
          title: Text(list[index]),
          trailing: PopupMenuButton<String>(
            padding: EdgeInsets.zero,
            icon: Icon(Icons.more_vert, size: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            onSelected: (value) {
              if (value == "remove") {
                _showSmallConfirmationDialog(context, list[index], type);
              }
            },
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(
                height: 30,
                value: "remove",
                child: Row(
                  children: [
                    Icon(Icons.delete, color: Colorss.pastelTeal, size: 18),
                    SizedBox(width: 8),
                    Text(
                      "Sil",
                      style: TextStyle(fontSize: 14, color: Colors.black87),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showSmallConfirmationDialog(BuildContext context, String name, String type) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.7,
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Silme Onayı",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  "$name adlı $type listesinden silinsin mi?",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text("İptal"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Sil"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colorss.lightTeal,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Takipçi sayısını döndüren fonksiyon
  int getFollowersCount() {
    return followers.length;
  }

  // Takip edilen sayısını döndüren fonksiyon
  int getFollowingCount() {
    return following.length;
  }
}
