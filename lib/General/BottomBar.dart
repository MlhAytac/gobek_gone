import 'dart:io';

import 'package:flutter/material.dart';

class Bottombar extends StatelessWidget {
  final int pageIndex;
  final Function(int) onTap;

  const Bottombar({
    super.key,
    required this.pageIndex,
    required this.onTap,
});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: Platform.isAndroid ? 16 : 0,
      ),
      child: BottomAppBar(
        elevation: 0.0,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 60,
            color: Colors.green,
            child: Row(
              children: [
                navItem(
                  Icons.home_outlined,
                  pageIndex == 0,
                  ontap: () => onTap(0),
                ),
                navItem(
                  Icons.message_outlined,
                  pageIndex == 1,
                  ontap: () => onTap(1),
                ),
                navItem(
                  Icons.notifications_none_outlined,
                  pageIndex == 2,
                  ontap: () => onTap(2),
                ),
                navItem(
                  Icons.person_outline,
                  pageIndex == 3,
                  ontap: () => onTap(3),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget navItem(IconData icon, bool selected, {Function()? ontap}){
    return Expanded(
      child: InkWell(
        onTap: ontap,
        child: Icon(
          icon,
          color: selected ? Colors.white : Colors.white.withOpacity(0.4),
        ),
      ),
    );
  }

}
