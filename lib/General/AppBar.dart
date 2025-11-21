import 'package:flutter/material.dart';

class Appbar extends StatelessWidget implements PreferredSizeWidget{
  const Appbar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);


  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFFC0E0DD),
      elevation: 0,                                             // AppBar'ın yüksekliği üzerindeki gölgeyi kaldırır.

      //(Logo ve Metin)
      leadingWidth: 80,
      leading: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,                       // İçeriği kadar yer kaplar.
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                    image: AssetImage('images/logo-Photoroom.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),

      // Tarih kısmı
      title: Text(
        "Today: Tuesday, Sep 12",
        style: TextStyle(
          fontSize: 16,
          color: Colors.black54,
        ),
      ),

      // Kullanıcı buttonu
      actions: [
        IconButton(
          icon: Icon(Icons.person, color: Colors.black54, size: 30,),
          onPressed: (){
            // KUllanıcı profil sayfası gidiş
          },
        ),
      ],
    );
  }
}
