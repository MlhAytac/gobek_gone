import 'package:flutter/material.dart';
import 'package:gobek_gone/MainPages/ContentPage.dart';

import 'app_colors.dart';

// contentBar sınıfı artık PreferredSizeWidget arayüzünü uyguluyor.
class contentBar extends StatefulWidget implements PreferredSizeWidget {
  const contentBar({super.key});

  // ✨ ANA DÜZELTME: Bu zorunlu metot eklenmeli.
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  // kToolbarHeight, standart AppBar yüksekliğidir (genellikle 56.0).


  @override
  State<contentBar> createState() => _contentBarState();
}

class _contentBarState extends State<contentBar> {

  bool _isSearching = false;

  final TextEditingController _searchController = TextEditingController();

  void _toogleSearch(){
    setState(() {
      _isSearching = !_isSearching;
      if(!_isSearching){
        _searchController.clear();
        FocusScope.of(context).unfocus();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.appbar_color,
      elevation: 0,                                             // AppBar'ın yüksekliği üzerindeki gölgeyi kaldırır.
      automaticallyImplyLeading: false, // Otomatik geri tuşunu devre dışı bırakır

      title: _isSearching ? _buildSearchBar() : _buildDefaultTitle(),

      leading: _isSearching ? null : _buildButton(),
      // ✨ BOŞLUK AZALTMA: leadingWidth değeri küçültülerek (örneğin 40.0) metne yaklaştırıldı.
      leadingWidth: _isSearching ? 0 : 80.0,
      actions: _buildActions(),
    );
  }

  // geri buton yap
  Widget _buildButton(){
    // ✨ BOŞLUK AZALTMA: Row kaldırıldı ve IconButton direkt döndürüldü.
    return IconButton(
      // padding: EdgeInsets.zero, // Boşluğu daha da sıfırlamak için eklenebilir
        onPressed: (){

          // Geri dönme işlemi
          Navigator.pop(context);

        },
        icon: Icon(
          Icons.arrow_back,
          color: Colors.black54,
        )
    );
  }

  Widget _buildDefaultTitle(){
    // Metnin sola yanaşması için Row yerine direkt Text kullanmak daha temiz olabilir,
    // ancak mevcut Row yapısını koruyarak devam ediyorum.
    return  Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Today : Tuesday, Sep 12",
          style: TextStyle(
            fontSize: 16,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }

  Widget _buildSearchBar(){
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        controller: _searchController,
        autofocus: true,
        decoration: InputDecoration(
          hintText: "Search in the App...",
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        ),
        onSubmitted: (value) {
          print("Search : $value");
          _toogleSearch();
        },
      ),
    );
  }

  List<Widget> _buildActions(){
    return [
      IconButton(
        icon: Icon(
          _isSearching ? Icons.close : Icons.search,
          color: Colors.black54,
          size: 28,
        ),
        onPressed: _toogleSearch,
      ),

      if(! _isSearching)
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: IconButton(
            icon: const Icon(
              Icons.person,
              color: Colors.black54,
              size: 30,
            ),
            onPressed: (){
              // KUllanıcı profil sayfasına gidiş
            },
          ),
        ),
    ];
  }

}