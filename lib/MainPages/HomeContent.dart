import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gobek_gone/General/AppBar.dart';
import 'package:gobek_gone/General/BottomBar.dart';
import 'package:gobek_gone/General/Fab.dart';
import 'package:gobek_gone/MainPages/AI.dart';
import 'package:gobek_gone/MainPages/Badges.dart';
import 'package:gobek_gone/MainPages/ContentPage.dart';
import 'package:gobek_gone/MainPages/Friends.dart';

class Homecontent extends StatefulWidget {
  const Homecontent({super.key});

  @override
  State<Homecontent> createState() => _HomecontentState();
}

class _HomecontentState extends State<Homecontent> {

  int _selectedIndex = 0;

  static final List<Widget> _screens = [
    Homecontent(),
    BadgesPage(),
    AIpage(),
    FriendsPage(),
    ContentPage(),
  ];

  // Tüm indeksler için sayfa geçişi yapacak şekilde güncellendi
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: gobekgAppbar(),



    );
    }
}