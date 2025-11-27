import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gobek_gone/General/AppBar.dart';
import 'package:gobek_gone/General/app_colors.dart';
import 'package:gobek_gone/General/contentBar.dart';
import 'package:gobek_gone/MainPages/AI.dart';
import 'package:gobek_gone/MainPages/Badges.dart';
import 'package:gobek_gone/MainPages/Friends.dart' hide AppColors;
import 'package:gobek_gone/MainPages/HomeContent.dart';

class DietlistPage extends StatefulWidget {
  const DietlistPage({super.key});

  @override
  State<DietlistPage> createState() => _DietlistPageState();
}

class _DietlistPageState extends State<DietlistPage> {

  int _selectedIndex = 0;
  bool _isSidebarOpen = false;

  static final List<Widget> _screens = [
    Homecontent(),
    BadgesPage(),
    AIpage(),
    FriendsPage(),
    Center(child: Text("Content Page")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.main_background,
      body: Stack(
        children: [
          Column(

            // sayfa içeriği

          ),

          _screens[_selectedIndex],

          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: contentBar(),
          ),
        ],
      ),
    );
  }
}
